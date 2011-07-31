//
//  Cliente.m
//  AreaDeDescanso
//
//  Created by BKB on 29/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AsyncSocket.h"
#import "Cliente.h"
#import <UIKit/UIKit.h>

    



@implementation Cliente

/*
 This method creates the socket. Echo reuses this one socket throughout its life.
 Echo also sets up the input. While a command-line app is waiting for input, it
 is usually blocked; I make the input non-blocking so that the run-loop remains
 active.
 */
- (id)init
{
	self = [super init];
    
	// Create socket.
	NSLog (@"Creating socket.");
	socket = [[AsyncSocket alloc] initWithDelegate:self];
	return self;
}


/*
 I release allocated resources here, including the socket. The socket will close
 any connection before releasing itself, but it will not need to. I explicitly
 close any connections in the "quit" command handler.
 */
- (void)dealloc
{
	[socket release];
	[super dealloc];
}


/*
 Echo spends one second handling any run-loop activity (i.e. socket activity)
 and then comes up for air to check if any new commands have been entered and,
 if so, executing them. Wash, rinse, repeat.
 
 Note the use of the shouldExitLoop flag to control when the run-loop ends and
 the app quits. I could have just called exit(), but this allows the app to clean
 up after itself properly. You should use a similar technique if you create a
 thread for socket activity and processing.
 */
- (void)runLoop
{
    char estado[] = {0x02,0x00,0x00,0x01,0x00,0x0A,0x59,0x00,0x00,0x03};

    NSData * data = [NSData dataWithBytes:estado length:sizeof(estado)*sizeof(char)];
    
    [socket writeData: data withTimeout:-1 tag:0];
}

-(void) connectHost: (NSString *) host port: (UInt16) port
{
	@try
	{
		NSError *err;
		
		if ([socket connectToHost:host onPort:port error:&err])
			NSLog (@"Connecting to %@ port %u.", host, port);
		else
            //Pintar de color rojo el nombre
            
			NSLog (@"Couldn't connect to %@ port %u (%@).", host, port, err);
	}
	@catch (NSException *exception)
	{
		NSLog ([exception reason]);
	}	
}


/*
 This method simply abstracts the read-from-server operation. It is called
 from -onSocket:didReadData:withTag: to set up another read operation. If it did
 not set up another read operation, AsyncSocket would not do anything with any
 further packets from Echo Server.
 
 You should not use "\n" as a packet delimiter in your own code. I explain why
 in EchoServerMain.c.
 */
- (void)readFromServer
{
	NSData *newline = [@"\n" dataUsingEncoding:NSASCIIStringEncoding];
	[socket readDataToData:newline withTimeout:-1 tag:0];
}

#pragma mark AsyncSocket Delegate Methods


/*
 This will be called whenever AsyncSocket is about to disconnect. In Echo Server,
 it does not do anything other than report what went wrong (this delegate method
 is the only place to get that information), but in a more serious app, this is
 a good place to do disaster-recovery by getting partially-read data. This is
 not, however, a good place to do cleanup. The socket must still exist when this
 method returns.
 */
-(void) onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
	if (err != nil)
		NSLog (@"Socket will disconnect. Error domain %@, code %d (%@).",
			   [err domain], [err code], [err localizedDescription]);
	else
		NSLog (@"Socket will disconnect. No error.");
}


/*
 Normally, this is the place to release the socket and perform the appropriate
 housekeeping and notification. But I intend to re-use this same socket for
 other connections, so I do nothing.
 */
-(void) onSocketDidDisconnect:(AsyncSocket *)sock
{
	NSLog (@"Disconnected.");
}


/*
 This method is called when Echo has connected to Echo Server. I immediately
 wait for incoming data from the server, but I already have two write requests
 queued up (from -prepareHello), and will also be sending data when
 the user gives me some to send.
 */
-(void) onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port;
{
	NSLog (@"Connected to %@ %u.", host, port);
    //Pintar de color amarillo el nombre
	[self readFromServer];
}


/*
 This method is called when Echo has finished reading a packet from Echo Server.
 It prints it out and immediately calls -readFromServer, which will queue up a
 read operation, waiting for the next packet.
 	
 You'll note that I do not implement -onSocket:didWriteDataWithTag:. That is
 because Echo does not care about the data once it is transmitted. AsyncSocket
 will still send the data, but will not notify Echo when that it done.
 */
-(void) onSocket:(AsyncSocket *)sock didReadData:(NSData*)data withTag:(long)t
{
	NSString *str = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
	NSLog(@"%@", str );
	[str release];  
    [self readFromServer];
}


@end
