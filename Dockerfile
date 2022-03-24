FROM python
RUN pip install grpcio-tools

# We only use the files in grpc/examples/python/route_guide,
# but there isn't a simple way to pull only a subfolder from github,
# so this takes everything
RUN git clone -b v1.14.x https://github.com/grpc/grpc

RUN sed -i "s|localhost:50051|stage.lmad.eu:443|g" /grpc/examples/python/route_guide/route_guide_client.py
# this will overwrite the run() with a secure version
COPY ./route_guide_client_overwrite.py /grpc/examples/python/route_guide/
WORKDIR grpc/examples/python/route_guide
