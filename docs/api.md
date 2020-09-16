# Overview
The transport format for requests and responses is JSON.

Request objects contain an `action` string property, with any params as additional properties.
Response objects contain a `response` property.

If the action completed with caveats, the response will contain a `warning` property.
If the action failed, the response will contain one or more of the following properties: `error_code`, `error_code_description`, `error_message`.
See [MQL4 error codes](https://docs.mql4.com/constants/errorswarnings/errorcodes).

# User Account

### GET_ACCOUNT_INFO
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
    "response": {
      "login": 2102224685,
      "name": "my Acme account",
      "server": "Acme-Server3",
      "currency": "USD",
      "company": "Acme, Ltd."
    } 
  }
  ```

### GET_ACCOUNT_INFO_INTEGER
Get an integer property of the account (see [AccountInfoInteger](https://docs.mql4.com/account/accountinfointeger)).
  
  #### Parameters
  - `property_name` - the [ENUM_ACCOUNT_INFO_INTEGER](https://docs.mql4.com/constants/environment_state/accountinformation#enum_account_info_integer) to lookup
  
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
    "response": 1500.0
  }
  ```

### GET_ACCOUNT_INFO_DOUBLE
Get a double property of the account (see [AccountInfoDouble](https://docs.mql4.com/account/accountinfodouble)).
  
  #### Parameters
  - `property_name` - the [ENUM_ACCOUNT_INFO_DOUBLE](https://docs.mql4.com/constants/environment_state/accountinformation#enum_account_info_double) property to lookup
  
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
    "response": 5000.0
  }
  ```

# Market

### GET_SYMBOLS
Get a list of all market symbols available for trading.
  
  #### Example
  ```json
  {
    "action": "GET_SYMBOLS"
  }
  ```
  #### Response
  ```json
  {
    "response": [
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

### GET_SYMBOL_INFO
Get static information about the given market symbols.
  
  #### Parameters
  - `names` - a list of symbol names
  
  #### Example
  ```json
  {
    "action": "GET_SYMBOL_INFO",
    "names": [
      "EURUSD",
      "USDJPY"
    ]
  }
  ```
  #### Response
  ```json
  {
    "response": {
      "EURUSD": {
        "digits": 5,
        "name": "EURUSD",
        "point_size": 1e-05,
        "trade_contract_size": 100000.0,
        "trade_freeze_level": 0,
        "trade_stops_level": 0,
        "trade_tick_size": 1e-05,
        "trade_tick_value": 1.0,
        "volume_max": 1000.0,
        "volume_min": 0.01,
        "volume_step": 0.01
      },
      "USDJPY": {
        "digits": 3,
        "name": "USDJPY",
        "point_size": 0.001,
        "trade_contract_size": 100000.0,
        "trade_freeze_level": 0,
        "trade_stops_level": 0,
        "trade_tick_size": 0.001,
        "trade_tick_value": 0.9499924,
        "volume_max": 1000.0,
        "volume_min": 0.01,
        "volume_step": 0.01
      }
    }
  }
  ```

### GET_SYMBOL_MARKET_INFO
Get market information about the given symbol (see [MarketInfo](https://docs.mql4.com/marketinformation/marketinfo)).
  
  #### Parameters
  - `symbol` - the market symbol
  - `property` - the [symbol property](https://docs.mql4.com/constants/environment_state/marketinfoconstants) to lookup
  
  #### Example
  ```json
  {
    "action": "GET_SYMBOL_MARKET_INFO",
    "symbol": "EURUSD",
    "property": "MODE_BID"
  }
  ```
  #### Response
  ```json
  {
    "response": 1.13006
  }
  ```

### GET_SYMBOL_INFO_INTEGER
Get an integer property of a symbol (see [SymbolInfoInteger](https://docs.mql4.com/marketinformation/symbolinfointeger)).
  
  #### Parameters
  - `symbol` - the market symbol
  - `property_name` - the [ENUM_SYMBOL_INFO_INTEGER](https://docs.mql4.com/constants/environment_state/marketinfoconstants#enum_symbol_info_integer) to lookup
  
  #### Example
  ```json
  {
    "action": "GET_SYMBOL_INFO_INTEGER",
    "symbol": "EURUSD",
    "property_name": "SYMBOL_SELECT"
  }
  ```
  #### Response
  ```json
  {
    "response": 1
  }
  ```

### GET_SYMBOL_INFO_DOUBLE
Get a double property of a symbol (see [SymbolInfoDouble](https://docs.mql4.com/marketinformation/symbolinfodouble)).
  
  #### Parameters
  - `symbol` - the market symbol
  - `property_name` - the [ENUM_SYMBOL_INFO_DOUBLE](https://docs.mql4.com/constants/environment_state/marketinfoconstants#enum_symbol_info_double) to lookup
  
  #### Example
  ```json
  {
    "action": "GET_SYMBOL_INFO_DOUBLE",
    "symbol": "EURUSD",
    "property_name": "SYMBOL_BID"
  }
  ```
  #### Response
  ```json
  {
    "response": 1.13247
  }
  ```

### GET_SYMBOL_INFO_STRING
Get a string property of a symbol (see [SymbolInfoString](https://docs.mql4.com/marketinformation/symbolinfostring)).
  
  #### Parameters
  - `symbol` - the market symbol
  - `property_name` - the [ENUM_SYMBOL_INFO_STRING](https://docs.mql4.com/constants/environment_state/marketinfoconstants#enum_symbol_info_string) to lookup
  
  #### Example
  ```json
  {
    "action": "GET_SYMBOL_INFO_STRING",
    "symbol": "EURUSD",
    "property_name": "SYMBOL_CURRENCY_BASE"
  }
  ```
  #### Response
  ```json
  {
    "response": "EUR"
  }
  ```

### GET_SYMBOL_TICK
Get the current prices of the given symbol (see [SymbolInfoTick](https://docs.mql4.com/marketinformation/symbolinfotick)).
  
  #### Parameters
  - `symbol` - the market symbol
  
  #### Example
  ```json
  {
    "action": "GET_SYMBOL_TICK",
    "symbol": "EURUSD"
  }
  ```
  #### Response
  ```json
  {
    "response": {
      "ask": 1.13346,
      "bid": 1.13338,
      "last": 0.0,
      "time": 1591744136,
      "volume": 0
    } 
  }
  ```

### GET_OHLCV
Get the most recent OHLCV bars for the given symbol.
  
  #### Parameters
  - `symbol` - the market symbol
  - `timeframe` - the width of the bars, in minutes.
    Use a [standard timeframe](https://docs.mql4.com/constants/chartconstants/enum_timeframes) for a better chance of the broker's server responding successfully.
  - `limit` - the maximum number of bars to return
  - `timeout` - the timeout in milliseconds to wait for the broker's server to return the data
  
  #### Example
  ```json
  {
    "action": "GET_OHLCV",
    "symbol": "EURUSD",
    "timeframe": 60,
    "limit": 100,
    "timeout": 5000
  }
  ```
  #### Response
  ```json
  {
    "response": [
      {
        "open": 1.12307,
        "high": 1.124,
        "low": 1.12301,
        "close": 1.12372,
        "tick_volume": 1702,
        "time": 1592424000
      },
      {
        "open": 1.12372,
        "high": 1.12372,
        "low": 1.12294,
        "close": 1.12308,
        "tick_volume": 1468,
        "time": 1592427600
      },
      ...
    ]
  }
  ```

### GET_SIGNALS
Get a list of all trade signals available in the terminal.
  
  #### Example
  ```json
  {
    "action": "GET_SIGNALS"
  }
  ```
  #### Response
  ```json
  {
    "response": [
      "FibonacciBreakout",
      "EA Happy Gold",
      "Batman EA",
      "EA Happy Market Hours",
      "EA Red Dragon l Demo FXCC l",
      "EA Skynet l Demo FXCC l",
      ...
  }
  ```

### GET_SIGNAL_INFO
Get detailed information on one or more trading signals.

  #### Parameters
  - `names` - a list of signal names

  #### Example
  ```json
  {
    "action": "GET_SIGNAL_INFO",
    "names": [
      "EA Happy Gold",  
      "FibonacciBreakout"  
    ]
  }
  ```
  #### Response
  ```json
  {
    "response": {
      "EA Happy Gold": { 
        "author_login": "HappyForex",
        "balance": 220230.23,
        "broker": "TF Global Markets (Aust) Pty Ltd",
        "broker_server": "ThinkForexAU-Demo",
        "currency": "USD",
        "date_published": 1396947432,
        "date_started": 1396940232,
        "equity": 220230.23,
        "gain": 21923.02,
        "id": 36094,
        "leverage": 400,
        "max_drawdown": 21.98,
        "name": "EA Happy Gold",
        "pips": 41114,
        "price": 20.0,
        "rating": 46,
        "roi": 21923.02,
        "subscribers": 0,
        "trade_mode": 1,
        "trades": 1443
      },
      "FibonacciBreakout": { 
        "author_login": "Antonov-EA",
        "balance": 21522.68,
        ...
      }
    }
  }
  ```

### RUN_INDICATOR
Run one of the built-in [technical indicator functions](https://docs.mql4.com/indicators).
If data is requested that is not already loaded in the terminal, it must be loaded from the broker server, which is why
a timeout must be specified.  
  
  #### Parameters
  - `indicator` - the name of the indicator function
  - `argv` - a list of indicator function parameters
  - `timeout` - the timeout in milliseconds
  
  #### Example
  ```json
  {
    "action": "RUN_INDICATOR",
    "indicator": "iAC",
    "argv": ["EURUSD", 60, 1],
    "timeout": 5000
  }
  ```
  #### Response
  ```json
  {
    "response": 2.251e-05
  }
  ```

# Trading

### GET_ORDER
Lookup an open, pending, or closed order using its ticket number.
  
  #### Parameters
  - `ticket` - the ticket number of the order
  
  #### Example
  ```json
  {
    "action": "GET_ORDER",
    "ticket": 121204376
  }
  ```
  #### Response
  ```json
  {
    "response": {
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

### GET_ORDERS
Lookup all market and pending orders.
  
  #### Example
  ```json
  {
    "action": "GET_ORDERS"
  }
  ```
  #### Response
  ```json
  {
    "response": [
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

### GET_HISTORICAL_ORDERS
Lookup all closed orders loaded in the "Account History" tab of the MT4 terminal.
  
  #### Example
  ```json
  {
    "action": "GET_HISTORICAL_ORDERS"
  }
  ```
  #### Response
  ```json
  {
    "response": [
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

### DO_ORDER_SEND
Open a market order or place a pending order.
This action is more than just a wrapper around the [OrderSend()](https://docs.mql4.com/trading/ordersend) function.
If stop-loss or take-profit params are specified, the order is opened with the given price and then modified with those values (in order to comply with the ECN trading protocol).
If the values violate the [trading requirements and limitations](https://book.mql4.com/appendix/limits), they are nudged the minimum amount to allow the modification to take place.
The resulting order is returned.
  
  #### Parameters
  - `symbol` - the market symbol
  - `order_type` - the order type.
  Must be an integer value from the [order properties](https://docs.mql4.com/constants/tradingconstants/orderproperties) table
  - `lots` - the number of lots to trade
  - `price` - the desired open price.  Required for pending orders, but can be omitted for market orders
  - `slippage` - the maximum price slippage, in points.  Omit to use a permissive default (2x the market spread)
  - `sl` - the absolute stop-loss
  - `sl_points` - the relative stop-loss (mutually exclusive with `sl`)
  - `tp` - the absolute take-profit
  - `tp_points` - the relative take-profit (mutually exclusive with `tp`)
  - `comment` - a string comment to attach to the order
  
  
  #### Example
  ```json
  {
    "action": "DO_ORDER_SEND",
    "symbol": "EURUSD",
    "order_type": 0,
    "lots": 1,
    "comment": "This is a market buy order."
  }
  ```
  #### Response
  ```json
  {
    "response": {
      "close_price": 1.12523,
      "close_time": "1970.01.01 00:00:00",
      "comment": "This is a market buy order.",
      "commission": -4.0,
      "expiration": "1970.01.01 00:00:00",
      "lots": 1.0,
      "magic_number": 0,
      "open_price": 1.1253,
      "open_time": "2020.06.25 04:50:17",
      "order_type": 0,
      "profit": -7.0,
      "sl": 0.0,
      "swap": 0.0,
      "symbol": "EURUSD",
      "ticket": 124114600,
      "tp": 0.0
    }
  }
  ```

### DO_ORDER_CLOSE
Close an opened order.
  
  #### Parameters
  - `ticket` - the ticket number of the order
  - `lots` - the number of lots.  Omit to close entire order
  - `price` - the closing price.  Omit to close at market price
  - `slippage` - the maximum price slippage, in points.  Omit to use a permissive default (2x the market spread)
  
  #### Example
  ```json
  {
    "action": "DO_ORDER_CLOSE",
    "ticket": 124114600
  }
  ```
  #### Response
  ```json
  {
    "response": "Closed order # 124114600"
  }
  ```

### DO_ORDER_DELETE
Delete a pending order.
  
  #### Parameters
  - `ticket` - the ticket number of the order
  - `closeIfOpened` - if true and the order is open, it is closed at market price. Defaults to `false`.
  
  #### Example
  ```json
  {
    "action": "DO_ORDER_DELETE",
    "ticket": 124114600
  }
  ```
  #### Response
  ```json
  {
    "response": "Deleted pending order # 124114600"
  }
  ```

### DO_ORDER_MODIFY
Modify a previously opened or pending order.
  
  #### Parameters
  - `ticket` - the ticket number of the order
  - `price` - the new open price of the pending order
  - `sl` - the absolute stop-loss
  - `sl_points` - the relative stop-loss (mutually exclusive with `sl`)
  - `tp` - the absolute take-profit
  - `tp_points` - the relative take-profit (mutually exclusive with `tp`)
  
  #### Example
  ```json
  {
    "action": "DO_ORDER_MODIFY",
    "ticket": 124114600,
    "price": 1.13552
  }
  ```
  #### Response
  ```json
  {
    "response": {
      "close_price": 1.13552,
      "close_time": "1970.01.01 00:00:00",
      "comment": "This is a pending order.",
      "commission": -4.0,
      "expiration": "1970.01.01 00:00:00",
      "lots": 1.0,
      "magic_number": 0,
      "open_price": 1.13552,
      "open_time": "2020.06.25 04:50:17",
      "order_type": 0,
      "profit": -7.0,
      "sl": 0.0,
      "swap": 0.0,
      "symbol": "EURUSD",
      "ticket": 124114600,
      "tp": 0.0
    }
  }
  ```
