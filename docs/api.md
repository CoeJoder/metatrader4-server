# API

## Overview
The transport format for requests and responses is JSON.

Request objects contain an `action` string property, with any params as additional properties.

If the action completed with caveats, the response object will contain a `warning` or `warnings` property.
If the action failed, the `error` or `errors` property alone will be set.

## Actions

### User Account

- #### GET_ACCOUNT_INFO
  Get static information about the account.
  
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

- #### GET_ACCOUNT_INFO_INTEGER
  Get an integer property of the account (see [AccountInfoInteger](https://docs.mql4.com/account/accountinfointeger)).
  The `property_name` must be from [ENUM_ACCOUNT_INFO_INTEGER](https://docs.mql4.com/constants/environment_state/accountinformation#enum_account_info_integer).
  
  #### Example
  ```json
  {
    "action": "GET_ACCOUNT_INFO_INTEGER",
    "property_name": "ACCOUNT_LIMIT_ORDERS"
  }
  ```
  #### Response
  ```json
  {
    "data": 1500.0
  }
  ```

- #### GET_ACCOUNT_INFO_DOUBLE
  Get an double property of the account (see [AccountInfoInteger](https://docs.mql4.com/account/accountinfodouble)).
  The `property_name` must be from [ENUM_ACCOUNT_INFO_DOUBLE](https://docs.mql4.com/constants/environment_state/accountinformation#enum_account_info_double).
  
  #### Example
  ```json
  {
    "action": "GET_ACCOUNT_INFO_DOUBLE",
    "property_name": "ACCOUNT_BALANCE"
  }
  ```
  #### Response
  ```json
  {
    "data": 5000.0
  }
  ```
==TODO more documentation==
