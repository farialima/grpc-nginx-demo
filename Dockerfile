FROM python
RUN pip install grpcio-tools
# could be v1.44.x or eval later :)
RUN git clone -b v1.14.x https://github.com/grpc/grpc

# to test the client through nginx
RUN sed -i "s|localhost:50051|nginx:50051|g" /grpc/examples/python/route_guide/route_guide_client.py

WORKDIR grpc/examples/python/route_guide
EXPOSE 50051
CMD ["python", "route_guide_server.py"]