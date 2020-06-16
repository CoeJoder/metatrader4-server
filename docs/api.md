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
  
  ##### Example
  ```json
  {
    "action": "GET_ACCOUNT_INFO"
  }
  ```
  ##### Response
  ```json
  {
    "data": {
      "login": 2102224685,
      "name": "my Acme account",
      "server": "Acme-Server3",
      "currency": "USD",
      "company": "Acme, Ltd."
    } 
  }
  ```

- #### GET_ACCOUNT_INFO_INTEGER
  Get an integer property of the account (see [AccountInfoInteger](https://docs.mql4.com/account/accountinfointeger)).
  The `property_name` must be from [ENUM_ACCOUNT_INFO_INTEGER](https://docs.mql4.com/constants/environment_state/accountinformation#enum_account_info_integer).
  
  ##### Example
  ```json
  {
    "action": "GET_ACCOUNT_INFO_INTEGER",
    "property_name": "ACCOUNT_LIMIT_ORDERS"
  }
  ```
  ##### Response
  ```json
  {
    "data": 1500.0
  }
  ```

- #### GET_ACCOUNT_INFO_DOUBLE
  Get a double property of the account (see [AccountInfoDouble](https://docs.mql4.com/account/accountinfodouble)).
  The `property_name` must be from [ENUM_ACCOUNT_INFO_DOUBLE](https://docs.mql4.com/constants/environment_state/accountinformation#enum_account_info_double).
  
  ##### Example
  ```json
  {
    "action": "GET_ACCOUNT_INFO_DOUBLE",
    "property_name": "ACCOUNT_BALANCE"
  }
  ```
  ##### Response
  ```json
  {
    "data": 5000.0
  }
  ```
### Market

- #### GET_SYMBOL_INFO
  Get static information about the given symbol.
  
  ##### Example
  ```json
  {
    "action": "GET_SYMBOL_INFO",
    "symbol": "EURUSD"
  }
  ```
  ##### Response
  ```json
  {
    "data": {
      "digits": 5,
      "freeze_level": 0.0,
      "lot_size": 100000.0,
      "lot_step": 0.01,
      "margin_hedged": 0.0,
      "margin_init": 0.0,
      "margin_maintenance": 0.0,
      "margin_required": 1128.88,
      "max_lot": 1000.0,
      "min_lot": 0.01,
      "name": "EURUSD",
      "point_size": 1e-05,
      "stop_level": 0.0,
      "tick_size": 1e-05,
      "tick_value": 1.0
    } 
  }
  
  ```

- #### GET_SYMBOL_MARKET_INFO
  Get market information about the given symbol.
  The `property` must be one of the [symbol properties](https://docs.mql4.com/constants/environment_state/marketinfoconstants).
  
  ##### Example
  ```json
  {
    "action": "GET_SYMBOL_MARKET_INFO",
    "symbol": "EURUSD",
    "property": "MODE_BID"
  }
  ```
  ##### Response
  ```json
  {
    "data": 1.13006
  }
  ```

- #### GET_SYMBOL_TICK
  Get the current prices of the given symbol (see [SymbolInfoTick](https://docs.mql4.com/marketinformation/symbolinfotick)).
  
  ##### Example
  ```json
  {
    "action": "GET_SYMBOL_TICK",
    "symbol": "EURUSD"
  }
  ```
  ##### Response
  ```json
  {
    "data": {
      "ask": 1.13346,
      "bid": 1.13338,
      "last": 0.0,
      "time": 1591744136,
      "volume": 0
    } 
  }
  ```

### Trading

- #### GET_ORDER
  Lookup an open, pending, or closed order using its ticket number.
  
  ##### Example
  ```json
  {
    "action": "GET_ORDER",
    "ticket": 121204376
  }
  ```
  ##### Response
  ```json
  {
    "data": {
      "close_price": 1.13668,
      "close_time": "1970.01.01 00:00:00",
      "comment": null,
      "commission": -0.04,
      "expiration": "1970.01.01 00:00:00",
      "lots": 0.01,
      "magic_number": 0,
      "open_price": 1.13672,
      "open_time": "2020.06.10 23:30:32",
      "order_type": 0,
      "profit": -0.04,
      "sl": 0.0,
      "swap": 0.0,
      "symbol": "EURUSD",
      "ticket": 121204376,
      "tp": 0.0
    } 
  }
  ```

- #### GET_ORDERS
  Lookup all market and pending orders.
  
  ##### Example
  ```json
  {
    "action": "GET_ORDERS"
  }
  ```
  ##### Response
  ```json
  {
    "data": [
      {
        "close_price": 1.13668,
        "close_time": "1970.01.01 00:00:00",
        "comment": null,
        "commission": -0.04,
        "expiration": "1970.01.01 00:00:00",
        "lots": 0.01,
        "magic_number": 0,
        "open_price": 1.13672,
        "open_time": "2020.06.10 23:30:32",
        "order_type": 0,
        "profit": -0.04,
        "sl": 0.0,
        "swap": 0.0,
        "symbol": "EURUSD",
        "ticket": 121204376,
        "tp": 0.0
      }, {
        "close_price": 1.13671,
        ...
      }
    ]
  }
  ```

- #### GET_HISTORICAL_ORDERS
  Lookup all closed orders loaded in the "Account History" tab of the MT4 terminal.
  
  ##### Example
  ```json
  {
    "action": "GET_HISTORICAL_ORDERS"
  }
  ```
  ##### Response
  ```json
  {
    "data": [
      {
        "close_price": 1.13672,
        "close_time": "2020.06.10 23:29:57",
        "comment": null,
        "commission": -0.04,
        "expiration": "1970.01.01 00:00:00",
        "lots": 0.01,
        "magic_number": 0,
        "open_price": 1.13665,
        "open_time": "2020.06.10 23:29:42",
        "order_type": 1,
        "profit": -0.07,
        "sl": 0.0,
        "swap": 0.0,
        "symbol": "EURUSD",
        "ticket": 121204101,
        "tp": 0.0
      },
      {
        "close_price": 0.0,
        ...
      }
    ]
  }
  ```

- #### GET_SYMBOLS
  Get a list of all market symbols available for trading.
  
  ##### Example
  ```json
  {
    "action": "GET_SYMBOLS"
  }
  ```
  ##### Response
  ```json
  {
    "data": [
      "AAPL",
      "ADSGn",
      "AIG",
      "AIRF.PA",
      "ALVG",
      "AMZN",
      "AUDCAD",
      "AUDCHF",
      ...
    ]
  }
  ```
==TODO more documentation==
