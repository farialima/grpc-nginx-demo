

import sys
import os, sys
sys.path.append(os.path.dirname(__file__))

from route_guide_client import *

def run():
    with open('../../../etc/roots.pem', 'rb') as f:
        creds = grpc.ssl_channel_credentials(f.read())
    with grpc.secure_channel('stage.lmad.eu:443', creds) as channel:
        stub = route_guide_pb2_grpc.RouteGuideStub(channel)
        print("-------------- GetFeature --------------")
        guide_get_feature(stub)
        print("-------------- ListFeatures --------------")
        guide_list_features(stub)
        print("-------------- RecordRoute --------------")
        guide_record_route(stub)
        print("-------------- RouteChat --------------")
        guide_route_chat(stub)
                                                                                                        
if __name__ == '__main__':
    run()

