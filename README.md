# MetaTrader 4 Server
Provides a remote interface and high-level API for MetaTrader 4 via ZeroMQ sockets.\
See [API](docs/api.md) for supported operations.

![Diagram 1](diagram_1.png)

## Installation
Copy the contents of the [metatrader4](metatrader4) folder into your MetaTrader 4 profile directory, merging the 
folder contents.  Compile [ZeroMQ_Server.mq4](metatrader4/MQL4/Scripts/ZeroMQ_Server.mq4) using MetaEditor.
Start MetaTrader 4 and add the `ZeroMQ Server` script to any chart (chart symbol does not matter).  The server starts 
listening for requests on its `REP` socket and responds synchronously to `REQ` requests from a client.

## Configuration
The default transport/port is `TCP/28282` but is configurable in the script parameters popup in the MetaTrader terminal,
along with other parameters such as socket timeouts.  Configure port forwarding as necessary.

## Usage
Typical client usage:

1. Create a ZeroMQ context and a `REQ` socket with appropriate send/receive timeouts and options.
1. Connect the `REQ` socket to the server's `REP` socket. 
1. Perform the following sequence any number of times:
    1. Construct an [API](docs/api.md) request.
    1. Send the request to the `REQ` socket.
    1. Receive a JSON-formatted string response from the `REQ` socket.
1. Close the socket connection and destroy the ZeroMQ context.

It is recommended to use one of the following client libraries to abstract away these details:
- [Python client](https://github.com/CoeJoder/metatrader4-client-python)
- Java client (coming soon)

## Limitations
The `REQ-REP` architecture enforces a strict request-response cycle and may deadlock if connection is lost.  The `REQ`
sockets in the client libraries linked above set the `ZMQ_REQ_RELAXED` and `ZMQ_REQ_CORRELATE` options to achieve some 
amount of robustness.  However, it's still recommended that the connecting client and MetaTrader 4 
instance be on the same computer, or at least on the same local-area network.  If a response is dropped, the client
may want to catch the exception and check whether or not the operation was successful.

## Development
If you want to make changes to the server implementation, it's useful to setup a local dev environment.  See 
[dev](docs/dev.md) for details.
