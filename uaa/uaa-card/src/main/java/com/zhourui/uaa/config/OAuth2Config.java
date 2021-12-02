package com.zhourui.uaa.config;


// import org.springframework.beans.factory.annotation.Value;
// import org.springframework.context.annotation.Bean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.oauth2.server.resource.OAuth2ResourceServerConfigurer;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
// import org.springframework.security.oauth2.jwt.JwtDecoder;
// import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;

/**
 * OAuth resource configuration.
 *
 * @author Josh Cummings
 */
@EnableWebSecurity
public class OAuth2Config extends WebSecurityConfigurerAdapter {
    private static final String[] WHITE_LIST = {
            "/oauth/token",
            "/h2-console/**",
            "/**"
    };
    @Value("${spring.security.oauth2.resourceserver.jwt.jwk-set-uri}")
    String jwkSetUri;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // @formatter:off
        http
            .authorizeHttpRequests((authorize) -> authorize
                //.antMatchers(HttpMethod.GET, "/foos/**").hasAuthority("SCOPE_message:read")
                //.antMatchers(HttpMethod.POST, "/message/**").hasAuthority("SCOPE_message:write")
                .anyRequest().authenticated()
            )
            //.oauth2ResourceServer(OAuth2ResourceServerConfigurer::jwt);
            .oauth2ResourceServer().authenticationEntryPoint(new CustomAuthenticationEntryPoint()).jwt();
        // @formatter:on
    }
}