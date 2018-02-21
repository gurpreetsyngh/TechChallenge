//
//  NetworkManager.h
//  CodingAssignment
//
//  Created by Gurpreet Singh on 21/2/18.
//  Copyright © 2018 GurpreetSingh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NetworkRequestCompletionHandler)(NSDictionary *response, NSError *error);

@interface NetworkManager : NSObject

/*
 * fetchDataFromServerWithCompletion: will make call to specified url.
 * @param: block returns either dictionary or error
 */
+ (void)fetchDataFromServerWithCompletion:(NetworkRequestCompletionHandler)completionBlock;

@end
