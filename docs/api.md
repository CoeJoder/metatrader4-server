# API

## Overview
The transport format for requests and responses is JSON.

Request objects contain an `action` string property, with any params as additional properties.

Response objects will contain a `data` property with the action's return value.
If the action completed with caveats, the `warning` or `warnings` property will also be set.
If the action failed, the `error` or `errors` property alone will be set.

## Actions

### User Account

- #### GET_ACCOUNT_INFO
  Get static information about the logged-in account.
  
  #### Example
  ```json
  {
    "action": "GET_ACCOUNT_INFO"
  }
  ```
  #### Response
  ```json
  {
    "login":    2102224685,
    "name":     "my Acme account",
    "server":   "Acme-Server3",
    "currency": "USD",
    "company":  "Acme, Ltd."
  }
  ```

==TODO more documentation==
