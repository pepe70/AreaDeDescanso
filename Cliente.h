//
//  Cliente.h
//  AreaDeDescanso
//
//  Created by BKB on 29/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//



@class AsyncSocket;

@interface Cliente : NSObject {

        AsyncSocket *socket;
}
    -(id)init;
    -(void)dealloc;
    -(void)runLoop;
    -(void)connectHost: (NSString *) host port: (UInt16) port;
    -(void)readFromServer;
    -(void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err;
    -(void)onSocketDidDisconnect:(AsyncSocket *)sock;
    -(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port;
    -(void)onSocket:(AsyncSocket *)sock didReadData:(NSData*)data withTag:(long)t;

@end
    
