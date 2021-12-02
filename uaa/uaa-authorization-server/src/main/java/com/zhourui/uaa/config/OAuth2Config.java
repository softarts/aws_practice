package com.zhourui.uaa.config;



//import com.lanweihong.security.auth.dto.UserDTO;
//import com.lanweihong.security.auth.service.impl.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.client.JdbcClientDetailsService;
import org.springframework.security.oauth2.provider.code.JdbcAuthorizationCodeServices;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.KeyStoreKeyFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.sql.DataSource;

import com.nimbusds.jose.JWSAlgorithm;
import com.nimbusds.jose.jwk.JWKSet;
import com.nimbusds.jose.jwk.KeyUse;
import com.nimbusds.jose.jwk.RSAKey;

import java.security.KeyPair;
import java.security.interfaces.RSAPublicKey;
import java.util.*;

/**
 * 认证服务配置
 * @author lanweihong
 * @date 2021/1/13 01:30
 */
@Configuration
@EnableAuthorizationServer
public class OAuth2Config extends AuthorizationServerConfigurerAdapter {

    @Value("${jwt.key.path}")
    private String keyPairPath;

    @Value("${jwt.key.alias}")
    private String keyPairAlias;

    @Value("${jwt.key.storepass}")
    private String keyPairStorePassword;

    @Value("${jwt.key.password}")
    private String keyPairPassword;

    private static final String JWK_KID = "bael-key-id";
    /**
     * 数据源
     */
    private final DataSource dataSource;

    //private final UserDetailsServiceImpl userDetailsService;

    /**
     * 密码模式 grant_type:password 需指定 AuthenticationManager
     */
    private final AuthenticationManager authenticationManager;

    //private final PasswordEncoder passwordEncoder;

    //private final TokenStore tokenStore;



    @Autowired
    public OAuth2Config(DataSource dataSource,AuthenticationManager authenticationManager) {
        this.dataSource = dataSource;
        this.authenticationManager = authenticationManager;
        // this.userDetailsService = userDetailsService;

        //this.passwordEncoder = passwordEncoder;
        //this.tokenStore = tokenStore;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


    // 用于读取表数据, 客户端信息来源
    @Bean
    public JdbcClientDetailsService clientDetailsServiceJdbc() {
         JdbcClientDetailsService service =  new JdbcClientDetailsService(dataSource);
         service.setPasswordEncoder(passwordEncoder());
         return service;
    }

    /**
     * token 转换器, 默认是 uuid 格式，我们在这里指定 token 格式为 jwt
     * 用来设置使用的public/private key
     * @return
     */
    @Bean
    public JwtAccessTokenConverter jwtAccessTokenConverter() {
        JwtAccessTokenConverter converter = new JwtAccessTokenConverter();
        // 使用非对称加密算法对 token 签名
        converter.setKeyPair(keyPair());
        return converter;
    }

    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
        endpoints
                // 开启密码模式授权
                .authenticationManager(authenticationManager)
                .authorizationCodeServices(new UuidAuthorizationCodeServices(dataSource))
                .accessTokenConverter(jwtAccessTokenConverter());
    }


    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        // disable 使用自定义的 ClientDetails ，添加缓存支持
        // 直接使用jdbcClientDetail
        clients.withClientDetails(clientDetailsServiceJdbc());
    }

    @Override
    public void configure(AuthorizationServerSecurityConfigurer security) {
        security.passwordEncoder(passwordEncoder())  //使用pwdEncoder
                // 允许表单认证
                .allowFormAuthenticationForClients()
                // 需通过认证后才能访问 /oauth/token_key 获取 token 加密公钥
                .tokenKeyAccess("permitAll()")
                // 开放 /oauth/check_token
                .checkTokenAccess("permitAll()"); // isAuthenticated()
    }



    @Bean
    public KeyPair keyPair() {
        // 从 classpath 目录下的证书 jwt.jks 中获取秘钥对
        KeyStoreKeyFactory keyStoreKeyFactory = new KeyStoreKeyFactory(new ClassPathResource(keyPairPath), keyPairStorePassword.toCharArray());
        return keyStoreKeyFactory.getKeyPair(keyPairAlias, keyPairPassword.toCharArray());
    }

    // for jwt.jks endpoint
// jwt:
//   key:
//     alias: weihong
//     password: lanweihong
//     storepass: lanweihong
//     path: jwt.jks
    @Bean
    public JWKSet jwkSet() {
        // RSAKey.Builder builder = new RSAKey.Builder((RSAPublicKey) keyPair().getPublic()).keyUse(KeyUse.SIGNATURE)
        //     .algorithm(JWSAlgorithm.RS256)
        //     .keyID(JWK_KID);
        // return new JWKSet(builder.build());
        RSAPublicKey publicKey = (RSAPublicKey)keyPair().getPublic();
        RSAKey key = new RSAKey.Builder(publicKey).build();
        return new JWKSet(key);
    }
}

class UuidAuthorizationCodeServices extends JdbcAuthorizationCodeServices {
    UuidAuthorizationCodeServices(DataSource dataSource) {
        super(dataSource);
    }

    @Override
    public String createAuthorizationCode(OAuth2Authentication authentication) {
        String code = UUID.randomUUID().toString();
        store(code, authentication);  // via jdbctemplate
        return code;
    }
}