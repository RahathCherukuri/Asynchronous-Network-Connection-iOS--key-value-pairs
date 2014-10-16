//
//  Network.m
//
//  Created by rahath on 9/19/14.
//  Copyright (c) 2014 Green. All rights reserved.
//

#import "Network.h"

@implementation Network

-(void)postValues
{
    NSString *username = @"user1"
    
    NSString * password = @"password1";
    
    NSString *path = @"http://www.abc.com/def";

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];

    NSString * post = [NSString stringWithFormat:@"&username=%@&password=%@",username,password];
        
    //Set the values for the object of NSMutableURLRequest
    [request setURL:[NSURL URLWithString:path]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[post dataUsingEncoding:NSUTF8StringEncoding]];
    
    //Create a connection
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    if(conn)
    {
        NSLog(@"Connection Successful");
    }
    else
    {
        NSLog(@"Connection could not be made");
    }

    [conn start];
}

//Callback method that states that the connection request has successfully been executed.
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Succesfull connectionDidFinishLoading method...");

}

//Callback method that states that there is some error in the connection
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error variable
    
    //If there is no internet connectivity. if u want to do anything specific u can do below.
    if(error.code== -1009)
    {
        NSLog(@"There is no internet connectivity");
    }
    else
    {
        NSLog(@"Some connection error.");
    }

    NSLog(@"didFailWithError");
}

//Callback method that gives the response code.
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received
    NSLog(@"didReceiveResponse Method...");
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    NSInteger responseStatusCode = [httpResponse statusCode];
    NSLog(@"Response Code: %li",(long)responseStatusCode);

    
}

// Callback method that gets called when we get the data from the server.
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)d
{
    NSLog(@"didReceiveData Method...");
    NSString * str = [[NSString alloc]initWithData:d encoding:NSUTF8StringEncoding];
    NSLog(@"Recieved Data= %@",str);

}


@end
