This is a very simple example of using a Python gRPC server proxied by Nginx

# Running without SSL

This can run over HTTPS as well as HTTP. To disable HTTPS, Just:
 - edit nginx/grpc_gateway.conf and docker-compose.yml to point at port 80 instead of 443
 - comment out the ssl_* lines in nginx/grpc_gateway.conf
 - edit docker-compose.yml to use the original `route_guide_client.py` that uses an insecure_channel instead of the overwrite in `route_guide_client_overwrite.py`
To install the client locally on your machine, on Mac you'll need the following:

# Running the client locally (On Mac)

You will need to install the libs, this is enough (no need for brew, it seems):

```
python3 -m venv .venv3
. .venv3/bin/activate
pip install grpcio google-api-python-client
```