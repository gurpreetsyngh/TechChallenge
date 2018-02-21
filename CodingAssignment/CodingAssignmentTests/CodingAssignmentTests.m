//
//  CodingAssignmentTests.m
//  CodingAssignmentTests
//
//  Created by Gurpreet Singh on 21/2/18.
//  Copyright © 2018 GurpreetSingh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NetworkManager.h"
#import "DataManager.h"
#import "NSDictionary+Utils.h"
#import "Fact.h"


@interface CodingAssignmentTests : XCTestCase

@end

@implementation CodingAssignmentTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDataManager {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Network Manager"];
    
    [DataManager getFacts:^(NSString * _Nullable title, NSArray * _Nullable data, NSError * _Nullable error) {
        if (error) {
            XCTAssertEqualObjects(error.localizedDescription, @"Internet connection appears to be offline.");
            [expectation fulfill];
        } else {
            XCTAssertNotNil(title);
            XCTAssertNotNil(data);
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:30 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"failed");
        }
    }];
}

- (void)testFactModel {
    
    NSArray *facts = [Fact initWithArray:[[self readLocalJSON] arrayForKey:@"rows"]];
    Fact *fact = facts.firstObject;
    XCTAssertEqualObjects(fact.title,@"Beavers");
    XCTAssertEqualObjects(fact.imageURL,@"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg");
    
}

- (NSDictionary *)readLocalJSON {
    NSString *filePath = [[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingPathComponent:@"mock.json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *jsonDict =  [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    return jsonDict;
}

@end
