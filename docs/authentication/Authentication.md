---
tags: [authentication]
---

# Simplified Authentication

Each authenticated request requires the `Authorization` header to be set with the string `SessionId <id>` where `<id>` must be replaced with the Session Id obtained as described next. In order to obtain a Session Id, make a POST to `/sessions` with the body:
```
{
  data: {
    type: 'session-request',
    attributes: {
      login: 'user@email.com',
      password: 'userPassword',
      userAgent: 'myApp'
    }
  }
}
```

If the request is successful (HTTP 200 Code), it will return a JSON with the following structure:
```
{
  data: {
    id: '<sessionId>',
    secret: '<sessionSecretForHmacSigning>'
    expirationDateTime: '<dateTime>'
  }
}
```

The simplified authentication model allows you to use only the Session Id as authentication for every request.

After creating a session for the first time for a new account, the first thing you will need to do is to obtain the Company and Branch ID for your account. In order to do that, make a GET request to `/companies`. Don't forget to add the SessionId Authorization header:
```
curl -H "Authorization: SessionId ab678943-4546-4a72-2abc-5751862a28e7" https://api.convess.com/companies
```

For every other request that is not to the `/companies` endpoint, it will be required to add the `X-Company` and `X-Branch` headers with the respective ID for each. Example:
```
curl -H "Authorization: SessionId ab678943-4546-4a72-2abc-5751862a28e7" -H "X-Company: ABC2mw" -H "X-Branch: 0O0aBc" https://api.convess.com/persons
```

An example API client can be found at [https://github.com/useawise/api-node-client](https://github.com/useawise/api-node-client)