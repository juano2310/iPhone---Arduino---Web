//
//  SerialConsoleViewController.m
//  SerialConsole
//
//  Created by Alasdair Allan on 14/07/2011.
//  Copyright 2011 University of Exeter. All rights reserved.
//

#import "RootController.h"

@implementation RootController

@synthesize button;

- (void)dealloc {
    [button release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)pushButton:(id)sender {
    txBuffer[0] = 1;
	int bytesWritten = [rscMgr write:txBuffer Length:1];
    NSLog( @"Wrote %d bytes to serial cable.", bytesWritten);
    
}


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	rscMgr = [[RscMgr alloc] init]; 
	[rscMgr setDelegate:self];
}

- (void)viewDidUnload {
    [self setButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - RscMgrDelegate methods

- (void) cableConnected:(NSString *)protocol {
    NSLog(@"Cable Connected: %@", protocol);
    [rscMgr setBaud:9600];
	[rscMgr open];    
    
}

- (void) cableDisconnected {
    NSLog(@"Cable disconnected");
	
}

- (void) portStatusChanged {
    NSLog(@"portStatusChanged");
    
}

- (void) readBytesAvailable:(UInt32)numBytes {
    NSLog(@"readBytesAvailable:");

}

- (BOOL) rscMessageReceived:(UInt8 *)msg TotalLength:(int)len {
    NSLog(@"rscMessageRecieved:TotalLength:");
    return FALSE;    

}

- (void) didReceivePortConfig {
    NSLog(@"didRecievePortConfig");

}

@end
