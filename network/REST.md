# RestApi

`/login` (`login`, `password`):
```json
{
    "token" : "142oln4k14k12ojhawdawdawd2349jdj"
}
```
---
`/register` (`email`, `password`, `phone`, `first_name`, `second_name`):
```json
{
    "token":"142oln4k14k12ojhawdawdawd2349jdj"
}
```
---
`getUserType` (`token`):
```json
{
    "isAdmin":true
}
```
---
`getMyId` (`token`):

```json
42
```
---

`getUser` (`id`):
```json
{
    "first_name":"Text",
    "second_name":"Text",
    "isAdmin":true,
    "email":"test@test.test",
    "phone":"88005553535"
}
```

