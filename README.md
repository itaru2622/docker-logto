docker-logto

## Configuration (docker-compose.yaml)

- ENDPOINT:       https endpoint to logto:3001 via ReverseProxy(nginx/caddy etc)
- ADMIN_ENDPOINT: https endpoint to logto:3002 via ReverseProxy(nginx/caddy etc)
- DB_URL:         POSTGRES_USER is freezed with 'postgres'. causing error if changed.

## Configuration (console)

configure to collect email address from users:

```
left pain > Connectors > SMTP
```


add users on logto

```
add/list user by admin:
  left pain > User management > Add user
  - http://localhost:3002/console/users

collect user info at sign(in/up)
  left pain > Sign-in & account > Collect user profile(TAB) > Add profile field

enable self signup:
  left pain > Sign-in & account > Sign-up and sign-in > Enable user registration: ON
  + collect user profile: +Add profile field > select user profile.

check if email address is collected at sign-up phase:
  left pain > Sign-in & account > Sign-up and sign-in > Sign-up identifiers: Email address

```

add OIDC app

```
  left pain > Applications > Third-party apps(TAB) > Create a third-party app (Traditional Web)
  - http://localhost:3002/console/applications/third-party-applications

  at Settings(TAB)
  - SET RedirectURIs
  - GET clientID(appId) and clientSecret(app secret)
  - GET issuer endpoint: /oidc

  at Permissions(TAB)
  - configure permissions, +email, +profile etc.
```

## Test Configuration with oauth2c:

```bash
cliID=...
cliSecret=...

oauth2c http://localhost:3001/oidc   --client-id ${cliID}  --client-secret "${cliSecret}" --auth-method client_secret_post --grant-type authorization_code --response-types code --response-mode form_post  --scopes openid,email,profile --redirect-url http://localhost:9876/callback
```

## Reference:
- https://github.com/logto-io/logto
- https://docs.logto.io/logto-oss/get-started-with-oss
- https://logto.io/
