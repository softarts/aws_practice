# UAA
以前kotlin的并非标准做法，定义了一堆controller, endpoint...

## Authorization server
参考uaa,用的是spring-security-oauth2(depreciated)，因为在新版本中security5不再有authorization server

## Resource Server
uaa-resource的实现有点旧，用的是spring-security-oauth2，这个depreciated

uaa-card 是目前最新的实现
使用了ResourceServerConfigurerAdapter， 使用spring-boot-starter-oauth2-resource-server


## package
```
2.1.2.RELEASE autoconfigure
<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-starter-oauth2</artifactId>
    <version>2.2.5.RELEASE</version>
</dependency>
```

# Test

```
mvn -DskipTests=true clean package
mvn spring-boot:run
```


```
1. 从uaa拿到access token

curl -X POST -u tester001:123456 http://127.0.0.1:8089/oauth/token?grant_type=client_credentials

->
{"access_token":"eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJvcGVuaWQiXSwiZXhwIjoxNjM3ODk5MjAyLCJhdXRob3JpdGllcyI6WyJST0xFX1VTRVIiXSwianRpIjoiMTczNWU5N2QtYzI1Mi00NTY4LWIyZWUtNDU0OThkMmIyM2E2IiwiY2xpZW50X2lkIjoidGVzdGVyMDAxIn0.KiDaybSoCg5GXdaA1QPNnlVipBMKczSWaA7avwcbQ5fYOE4eHGJXuyu2AGXMUIzT5yOLnpUOlGOsu4sASXmw72p-ypHsoZjfcyYrKV2cvMpfAT-cPIisEoSuY3Op4IKNZIKHjne-wyY6vSfmWoPswn6dldBuJIRQD7goh_jP75s6yjPvsJ0HDIGcF9BRyvrKs8FZJdynQU_0xT0yNw2GAEZm95GAOAfsy3-AgXxWEElWS2ebcVjXdxMO2DYhLFnPGXZJ9DQrLwBes1xThQgOZh53bj3VKzCsZtYTXDHwpkENTGyxMththF58oROWgTT40_fmzcQQ5XWCvDSCyWwKKg","token_type":"bearer","expires_in":43199,"scope":"openid","jti":"1735e97d-c252-4568-b2ee-45498d2b23a6"}
```

2. 用access token 访问 resource server
```
curl http://127.0.0.1:8092/users -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJvcGVuaWQiXSwiZXhwIjoxNjM4MDY0ODY5LCJhdXRob3JpdGllcyI6WyJST0xFX1VTRVIiXSwianRpIjoiYzk4ZTFjZjUtMGQzNS00ZWQ2LTlkOWQtZDQ1YzQ5YTEzYzY5IiwiY2xpZW50X2lkIjoidGVzdGVyMDAxIn0.eJ0Vm8qANodbQqAzhTGmKWsu-EiyO-snxBtIKrY81D-25cTUDi34FodFE07Kw0Gsb9vOCHVgQjvm8vjivVFaqL24uKxFOOBO-fDhRvUpnNYF79rt0_e27mZznzQQ4-ZG5uyA1SBLKKLg9QdDTxh3ERZPeCFMtRTXimkbnSGxci0NNd9E_uvQ55e5aB5I-sAhoBqMg5L4w6HeJk8fEFn1rHgFCkc750e91me5gU_mJBlLSvzhCPz883_i2WK61C_x4ENX2eX87jujmYqxn70LTVnuRAiGbRXLicSA7FuS9NIQIIw2hfFUwvKI108eL5okj85GpvaK2FV9UXIwwcFwDQ'

-> {"user":"tester001"}

curl http://127.0.0.1:8092/foos/1 -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJvcGVuaWQiXSwiZXhwIjoxNjM4MTM0Mjc1LCJhdXRob3JpdGllcyI6WyJST0xFX1VTRVIiXSwianRpIjoiOWM1YTk1MzktYzdmNy00OWZkLWI0MWUtYWUyMjA0YTAxODVhIiwiY2xpZW50X2lkIjoidGVzdGVyMDAxIn0.IOkxLzMDQYZJ8kLg0ComB88XAyUj9aNqeTFYDTYsTZonjPWUOoZivqO37CeEyEOIDd1xK_1iU4wQjuLbf7dZDiq3B1NQk6L9Fw8Z-_5TwmZqB7uwqZlS-jjJgrmpJVHSeYBDA_AU3ej-VToIqNOWVl01i5Ra2Lgik5QeuB7sQd7Ak2H0iK7-lOhtCjbTqlL2P7chEpKZ0FIX_69lpYzU2TG4xJkMcD_XISqI-mlorU9oU-vw93u3LUByOTWzbS6ywLl4FoREgSRibZQN2NRJnLy8c6Rv9YNDzqUYFLDD0zCQOJfL4M-E1WIKBvK-TKQTZye2UZ7hBopHgkp5yLdkmg'

```

3. jwt.jks
```
curl http://127.0.0.1:8089/.well-known/jwks.json
{"keys":[{"kty":"RSA","e":"AQAB","n":"sD9P9Bc86DHbEBzaMG_VokXs6Up9wxaotFLjjC-tk-LSwX0zn3rQGU6i_q9UD7GB3JPrFmHgAkntmlhT54sZf3yGAu3BdsbC_zGVNqnRs98hTB6oKS_F9z6bCjOPc4Xguht6YNY6Xo7dnUnmmZj-n_LEbD-VSahpWSP4kzh_BdWxn4Qf8N1Cr-3GzGIyBZXwMB805ZUanc86eEjNH0UTT0z7QpDMYFan9vLm2bAcu_0XQJUwMAkDHjNYGzzzvtpBSHGekTJW6JalYdC3oHB19Dg9KBP5opwdJLsNRcTjOIpDntyk9DAk3kxfHBWcYPhCybO8_h4lyrxnW8pHdKm6aw"}]}
```

使用baeldung的做法,
- This kid is an arbitrary alias for the key, and it's usually used by the Resource Server to select the correct entry from the collection since the same key should be included in the JWT Header.
```
curl http://127.0.0.1:8089/.well-known/jwks.json
{"keys":[{"kty":"RSA","e":"AQAB","use":"sig","kid":"bael-key-id","alg":"RS256","n":"sD9P9Bc86DHbEBzaMG_VokXs6Up9wxaotFLjjC-tk-LSwX0zn3rQGU6i_q9UD7GB3JPrFmHgAkntmlhT54sZf3yGAu3BdsbC_zGVNqnRs98hTB6oKS_F9z6bCjOPc4Xguht6YNY6Xo7dnUnmmZj-n_LEbD-VSahpWSP4kzh_BdWxn4Qf8N1Cr-3GzGIyBZXwMB805ZUanc86eEjNH0UTT0z7QpDMYFan9vLm2bAcu_0XQJUwMAkDHjNYGzzzvtpBSHGekTJW6JalYdC3oHB19Dg9KBP5opwdJLsNRcTjOIpDntyk9DAk3kxfHBWcYPhCybO8_h4lyrxnW8pHdKm6aw"}]}
```
感觉这是个比较古老的做法，换个库看看
{"error":"invalid_token","error_description":"Invalid JWT/JWS: kid is a required JOSE Header"}




# 密码
**Bcrypt**
使用Bcrypt在线计算密码
https://www.jisuan.mobi/p163u3BN66Hm6JWx.html
然后填入data.sql初始化
```
123456->
$2a$10$Bz7YBU3cNMCzhJT3JUzP0.pkl.IqMH4kTP6ailv71q4EPACiezCyW
```



TODO token_key


# Refer
## jwt.jks
这个有点旧了
https://www.baeldung.com/spring-security-oauth2-jws-jwk


https://zhuanlan.zhihu.com/p/403674303
https://github.com/xpp1109/spring-security-gte5-oauth2/blob/main/authorization-server/src/main/java/com/xpp/ssgo/as/config/WebAuthorizationServerConfig.java

## laiweihong
https://segmentfault.com/a/1190000040295266
https://github.com/lanweihong/spring-securuty-oauth2-jwt/blob/main/spring-security-auth/src/main/java/com/lanweihong/security/auth/config/WebSecurityConfig.java

这里用了usersvc来校验用户数据
```
@Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
        TokenEnhancerChain enhancerChain = new TokenEnhancerChain();
        List<TokenEnhancer> delegates = new ArrayList<>();

        delegates.add(tokenEnhancer());
        delegates.add(accessTokenConverter());

        // 配置 JWT 内容增强
        enhancerChain.setTokenEnhancers(delegates);

        endpoints
                // 开启密码模式授权
                .authenticationManager(authenticationManager)
                .userDetailsService(userDetailsService)
                .accessTokenConverter(accessTokenConverter())
                .tokenEnhancer(enhancerChain)
                // 设置 token 存储方式
                .tokenStore(tokenStore);
    }
```

tokenEnhance用于加入其他信息




https://www.ruanyifeng.com/blog/2019/04/oauth-grant-types.html

# security-oauth
depriciated?

https://segmentfault.com/a/1190000040295266

# After security 5
https://github.com/spring-projects/spring-security/wiki/OAuth-2.0-Migration-Guide
