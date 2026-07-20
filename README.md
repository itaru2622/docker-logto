docker-logto


## Configuration

add users on logto (console):

```
self signup: 
- http://localhost:3002/console/sign-in-experience/sign-up-and-sign-in
  > Enable user registration: ON

- add/list user by admin:
  - http://localhost:3002/console/users
```

add OIDC app (console):

- http://localhost:3002/console/applications/third-party-applications
  > Traditional Web


## Test Configuration with oauth2c:

```bash
cliID=...
cliSecret=...

oauth2c http://localhost:3001   --client-id ${cliID}  --client-secret "${cliSecret}" --auth-method client_secret_post --grant-type authorization_code --response-types code --response-mode form_post  --scopes openid,email,profile --redirect-url http://localhost:9876/callback
```

## Reference:
- https://github.com/logto-io/logto
- https://docs.logto.io/logto-oss/get-started-with-oss
- https://logto.io/
