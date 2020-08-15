# MetaTrader 4 Server
Provides a remote interface and high-level API for MetaTrader 4 via ZeroMQ sockets.

![Diagram 1](diagram_1.png)

## Installation
Copy the contents of the [metatrader4](metatrader4) folder into your MetaTrader 4 profile directory, merging the 
folder contents.
Start MetaTrader 4 and add the `ZeroMQ Bridge EA` to any chart (chart symbol does not matter).

## Configuration
Once the EA is installed into a chart, the server listens for requests on the `PULL` socket and sends responses to the
`PUSH` socket.  Ports are configurable in the MetaTrader terminal.  Configure port forwarding in any firewalls as 
necessary.

The client `PUSH` socket connects to the server `PULL` port (default: TCP 28281).\
The client `PULL` socket connects to the server `PUSH` port (default: TCP 28282).

## Usage
Typical client request cycle:

  1. Construct an [API](docs/api.md) request.
  1. Send it to the local PUSH socket.
  1. Poll the local PULL socket until a response is received.

It is recommended to use one of the following client libraries to abstract away these details:
- [Python 3 Client](https://github.com/CoeJoder/metatrader4-client-python)
- Java Client (coming soon)

## Development
If you want to make changes to the server endpoints, it's useful to setup a local dev environment.  See 
[dev](docs/dev.md) for details.
