//
//  PMOVideoTableViewDataSourceTests.m
//  StreamAMG-TestTests
//
//  Created by Peter Molnar on 20/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PMOVideoTableViewDataSource.h"
#import "PMOVideoDescriptorFactory.h"

@interface PMOVideoTableViewDataSourceTests : XCTestCase

@end

@implementation PMOVideoTableViewDataSourceTests

- (void)testInitWithEmptyList {
    NSArray <PMOVideoDescriptor *> *descriptorList = @[];
    
    PMOVideoTableViewDataSource *newSource = [[PMOVideoTableViewDataSource alloc] initWithVideoDescriptors:descriptorList];

    XCTAssertNil(newSource);
}

- (void)testInitWithValidList {
    
    NSMutableArray <PMOVideoDescriptor *> *descriptorList = [[NSMutableArray alloc] init];
    UITableView *mockTableView = [[UITableView alloc] init];
    
    NSArray *mockJSONArrayData = @[@{
        @"title": @"1st video in the list",
        @"thumbnail_url": @"",
        @"video_url": @"http://open.http.staging-k9.streamuk.com/p/3000021/sp/300002100/playManifest/entryId/0_0ywhyahw/format/applehttp/protocol/http/a.m3u8",
        @"duration": @"1:24"
    },
                                   @{
                                       @"title": @"2nd video in the list",
                                       @"thumbnail_url": @"",
                                       @"video_url": @"http://open.http.staging-k9.streamuk.com/p/3000021/sp/300002100/playManifest/entryId/0_bse7sb83/format/applehttp/protocol/http/a.m3u8",
                                       @"duration": @"1:07"
                                   }];
    
    for (NSDictionary *currentVideoData in mockJSONArrayData) {
        [descriptorList addObject:[PMOVideoDescriptorFactory buildVideoDescriptorFromDictionary:currentVideoData]];
    }
    
    PMOVideoTableViewDataSource *newSource = [[PMOVideoTableViewDataSource alloc] initWithVideoDescriptors:descriptorList];
    
    XCTAssertNotNil(newSource);
    XCTAssert([newSource tableView:mockTableView numberOfRowsInSection:1] == 2);
    XCTAssert([newSource numberOfSectionsInTableView:mockTableView] == 1);

}

@end
