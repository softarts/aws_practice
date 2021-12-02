CREATE TABLE IF NOT EXISTS oauth_client_details (
    client_id       VARCHAR(128) NOT NULL PRIMARY KEY,
    resource_ids    VARCHAR(256) NOT NULL DEFAULT '',
    client_secret   VARCHAR(256) NOT NULL DEFAULT '',
    scope           VARCHAR(256) NOT NULL DEFAULT 'openid',
    authorized_grant_types      VARCHAR(256) NOT NULL DEFAULT 'authorization_code,passwod,implicit,client_credentials',
    web_server_redirect_uri     VARCHAR(4096) NOT NULL DEFAULT '',
    authorities                 VARCHAR(256) NOT NULL DEFAULT 'ROLE_USER',
    access_token_validity       INTEGER, -- turns out these two fields are nullable
    refresh_token_validity      INTEGER, -- turns out these two fields are nullable
    additional_information      VARCHAR(4096) NOT NULL DEFAULT '{}',
    autoapprove                 VARCHAR(256) NOT NULL DEFAULT 'openid'
);

create table if not exists oauth_access_token
(
    token_id          varchar(255) null,
    token             longblob     null,
    authentication_id varchar(255) null,
    user_name         varchar(255) null,
    client_id         varchar(255) null,
    authentication    longblob     null,
    refresh_token     varchar(255) null
);


