# Network

## HTTP

### HTTP Request Method

| Method | Description |
| ------ | ----------- |
| `GET`  | Used to request data. |
| `HEAD` | Requests the headers that would be returned. |
| `POST` | Send data to the server. |
| `PUT`  | Creates a new resource or replaces target resource with the request payload. |

### HTTP Status Code

| Method | Description |
| ------ | ----------- |
| `200 OK` | Success |
| `204 No Content` | The request was successfully processed, but there is no content. The headers may be useful. |
| `301 Moved Permanently` | Resource yas moved to new URL. |
| `304 Not Modified` | Used for caching purposes. The response hasn’t been modified. |
| `400 Bad Request` | Server won't process due to client error. |
| `401 Unauthorized` | The user doesn’t have valid authentication credentials to get the requested resource. |
| `403 Forbidden` | The client doesn’t have access rights to the content. |
| `404 Not found` | Cannot find the resource. |
| `405 Method Not Allowed` | Target resource doesn't support this method. |
| `500 Internal Server Error` | The server has encountered an unexpected error and cannot complete the request. |
| `502 Bad Gateway` | The server acts as a gateway and gets an invalid response from an inbound host. |
| `503 Service Unavailable` | The server is unable to process the request. This often occurs when a server is overloaded or down for maintenance.  |
| `504 Gateway Timeout` | he server was acting as a gateway or proxy and timed out, waiting for a response.  |

### Refrences

- [HTTP response status codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)