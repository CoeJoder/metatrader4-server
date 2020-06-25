# Overview
The transport format for requests and responses is JSON.

Request objects contain an `action` string property, with any params as additional properties.

If the action completed with caveats, the response object will contain a `warning` or `warnings` property.
If the action failed, the `error` or `errors` property alone will be set.

# Actions

## User Account

- ### GET_ACCOUNT_INFO
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
    "data": {
      "login": 2102224685,
      "name": "my Acme account",
      "server": "Acme-Server3",
      "currency": "USD",
      "company": "Acme, Ltd."
    } 
  }
  ```

- ### GET_ACCOUNT_INFO_INTEGER
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
    "data": 1500.0
  }
  ```

- ### GET_ACCOUNT_INFO_DOUBLE
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
    "data": 5000.0
  }
  ```
## Market

- ### GET_SYMBOL_INFO
  Get static information about the given symbol.
  
  #### Parameters
  - `symbol` - the market symbol
  
  #### Example
  ```json
  {
    "action": "GET_SYMBOL_INFO",
    "symbol": "EURUSD"
  }
  ```
  #### Response
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

- ### GET_SYMBOL_MARKET_INFO
  Get market information about the given symbol.
  
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
    "data": 1.13006
  }
  ```

- ### GET_SYMBOL_TICK
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
    "data": {
      "ask": 1.13346,
      "bid": 1.13338,
      "last": 0.0,
      "time": 1591744136,
      "volume": 0
    } 
  }
  ```

- ### GET_SYMBOLS
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

- ### GET_OHLCV
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
    "data": [
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

- ### GET_SIGNALS
  Get all of the trade signals available in the terminal.
  
  #### Example
  ```json
  {
    "action": "GET_SIGNALS"
  }
  ```
  #### Response
  ```json
  {
    "data": {
      "A30090726": {
        "author_login": "jiaye2",
        "balance": 93826.79,
        "broker": "International Capital Markets Pty Ltd.",
        "broker_server": "ICMarkets-Demo03",
        "currency": "USD",
        "date_published": 1534307271,
        "date_started": 1534308361,
        "equity": 93826.79,
        "gain": 840.72,
        "id": 461007,
        "leverage": 500,
        "max_drawdown": 42.11,
        "name": "A30090726",
        "pips": 50302,
        "price": 0.0,
        "rating": 4,
        "roi": 838.27,
        "subscribers": 4,
        "trade_mode": 1,
        "trades": 3257
      },
      "A30090742": {
        "author_login": "jiaye2",
        ...
      },
      ...
    }
  }
  ```

## Trading

- ### GET_ORDER
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

- ### GET_ORDERS
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

- ### GET_HISTORICAL_ORDERS
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

- ### DO_ORDER_SEND
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
  - `tp` - the absolute take-profit to use
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
    "data": {
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
==TODO more documentation==
