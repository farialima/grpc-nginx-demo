This is a very simple example of setting up a Python gRPC server proxied by Nginx from scratch.

It is heavily inspired by [this tutorial](https://www.nginx.com/blog/deploying-nginx-plus-as-an-api-gateway-part-3-publishing-grpc-services/); on top of it, it includes setting up things over HTTPS. In fact, HTTPS/SSL infact the default, you can modify the project to _not_ use SSL, see below.

The HTTPS was set up at lmad (on stage.lmad.eu) but you can change it (grep for `stage.lmad.eu` in this project). The certificates have to be in a `../letsencrypt/etc` folder on the host (relative to this current file).

# Running it by default

This tutorial should contain everything you need. just run `docker compose up` and you should see the 3 containers go up, with the client-one outputting the result of its communication with the server.


# Running without SSL

This can run over HTTPS as well as HTTP. To disable HTTPS, Just:
 - edit nginx/grpc_gateway.conf and docker-compose.yml to point at port 80 instead of 443
 - comment out the ssl_* lines in nginx/grpc_gateway.conf
 - edit docker-compose.yml to use the original `route_guide_client.py` that uses an insecure_channel instead of the overwrite in `route_guide_client_overwrite.py`
To install the client locally on your machine, on Mac you'll need the following:

# Running the client locally (On Mac)

You will need to install the libs using pip; there is no need for GRPRC need for brew, it seems):

```
python3 -m venv .venv3
. .venv3/bin/activate
pip install grpcio google-api-python-client
```