---
tags: [authentication,bearer]
---

# Bearer-Authentication

Each authenticated request requires the `Authorization` header to be set with the string `Bearer <token>` where `<token>` must be replaced with the User Token obtained following the link [https://app.useawise.com/a/-/-/profile/edit](https://app.useawise.com/a/-/-/profile/edit).


The bearer authentication model allows you to use only the Token as authentication for any request.

With the Token, the first thing you will need to do is to obtain the Company and Branch ID for your account. In order to obtain the Company ID, make a GET request to `/companies`. Don't forget to add the Bearer Authorization header:

```
curl -H "Authorization: Bearer ab67894345464a722abc5751862a28e7" https://api.useawise.com/companies
```

In the same way, make a GET reques to `/branches` to filter out the branches which the owner of the Token has access to. For this request you will need to include the `X-Company` header:

```
curl -H "Authorization: Bearer ab67894345464a722abc5751862a28e7" -H "X-Company: ABC2mw" https://api.useawise.com/branches
```

For every other request that is not to the `/companies` or `/branches` endpoint, it will be required to add the `X-Company` and `X-Branch` headers with the respective ID for each. Example:
```
curl -H "Authorization: Bearer ab67894345464a722abc5751862a28e7" -H "X-Company: ABC2mw" -H "X-Branch: 0O0aBc" https://api.useawise.com/persons
```