//
//  NetworkManager.m
//  CodingAssignment
//
//  Created by Gurpreet Singh on 21/2/18.
//  Copyright © 2018 GurpreetSingh. All rights reserved.
//

#import "NetworkManager.h"
#import "Reachability.h"
#import <UIKit/UIKit.h>


static NSString * const BaseURL = @"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json";
static NSString * const ErrorDomain = @"au.com.telstra";
static const CGFloat ErrorCode = -57;

@implementation NetworkManager

+ (void)fetchDataFromServerWithCompletion:(NetworkRequestCompletionHandler)completionBlock
{
    Reachability *internetReachability =[Reachability reachabilityForInternetConnection];
    NetworkStatus connectionStatus = [internetReachability currentReachabilityStatus];
    //check if internet is not available, return NSError object
    if (connectionStatus == NotReachable) {
        NSDictionary *userInfo = @{
                                    NSLocalizedDescriptionKey: NSLocalizedString(@"Internet connection appears to be offline.", nil),
                                   };
        NSError *error = [NSError errorWithDomain:ErrorDomain code:ErrorCode userInfo:userInfo];
        completionBlock(nil, error);
    } else {
        NSURL *URL = [NSURL URLWithString:BaseURL];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
        // Creates a session with the specified session configuration.
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
        [request setHTTPMethod:@"GET"];
        
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            
            if (error) {
                completionBlock(nil, error);
            }
            else {
                NSString *isoEncoding = [[NSString alloc] initWithData:data encoding:NSISOLatin1StringEncoding];
                NSData *utfEncoding = [isoEncoding dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:utfEncoding options:NSJSONReadingAllowFragments error:&error];
                completionBlock(jsonDict, error);
            }
        }];
        
        [dataTask resume];
    }
}

@end
