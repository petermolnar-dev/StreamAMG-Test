//
//  PMOVideoDesriptorFactoryTests.m
//  StreamAMG-TestTests
//
//  Created by Peter Molnar on 20/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PMOVideoDescriptorFactory.h"

@interface PMOVideoDesriptorFactoryTests : XCTestCase

@end

@implementation PMOVideoDesriptorFactoryTests

- (void)testSuccesfullCreation {
    NSDictionary *videoSourceInfo = @{@"title": @"1st video in the list",
                                      @"thumbnail_url": @"http://thumbnailURL",
                                      @"video_url": @"http://open.http.staging-k9.streamuk.com/p/3000021/sp/300002100/playManifest/entryId/0_0ywhyahw/format/applehttp/protocol/http/a.m3u8",
                                      @"duration": @"1:24"};
    
    PMOVideoDescriptor *generatedDescriptor = [PMOVideoDescriptorFactory buildVideoDescriptorFromDictionary:videoSourceInfo];
    
    XCTAssertNotNil(generatedDescriptor);
    XCTAssertTrue([generatedDescriptor.title isEqualToString:@"1st video in the list"]);
    XCTAssertTrue([generatedDescriptor.videoUrlAsString isEqualToString:@"http://open.http.staging-k9.streamuk.com/p/3000021/sp/300002100/playManifest/entryId/0_0ywhyahw/format/applehttp/protocol/http/a.m3u8"]);
    XCTAssertTrue([generatedDescriptor.durationAsString isEqualToString:@"1:24"]);
}

- (void)testMissingMandatoryParameterDuration {
    NSDictionary *videoSourceInfo = @{@"title": @"1st video in the list",
                                      @"thumbnail_url": @"http://thumbnailURL",
                                      @"video_url": @"http://open.http.staging-k9.streamuk.com/p/3000021/sp/300002100/playManifest/entryId/0_0ywhyahw/format/applehttp/protocol/http/a.m3u8"};
    
    PMOVideoDescriptor *generatedDescriptor = [PMOVideoDescriptorFactory buildVideoDescriptorFromDictionary:videoSourceInfo];
    
    XCTAssertNil(generatedDescriptor);

}

- (void)testMissingMandatoryParameterVideoURL {
    NSDictionary *videoSourceInfo = @{@"thumbnail_url": @"http://thumbnailURL",
                                      @"video_url": @"http://open.http.staging-k9.streamuk.com/p/3000021/sp/300002100/playManifest/entryId/0_0ywhyahw/format/applehttp/protocol/http/a.m3u8",
                                      @"duration": @"1:24"};
    
    PMOVideoDescriptor *generatedDescriptor = [PMOVideoDescriptorFactory buildVideoDescriptorFromDictionary:videoSourceInfo];
    
    XCTAssertNil(generatedDescriptor);
    
}


- (void)testMissingMandatoryParameterTitle {
    NSDictionary *videoSourceInfo = @{@"title": @"1st video in the list",
                                      @"thumbnail_url": @"http://thumbnailURL",
                                      @"video_url": @"http://open.http.staging-k9.streamuk.com/p/3000021/sp/300002100/playManifest/entryId/0_0ywhyahw/format/applehttp/protocol/http/a.m3u8"};
    
    PMOVideoDescriptor *generatedDescriptor = [PMOVideoDescriptorFactory buildVideoDescriptorFromDictionary:videoSourceInfo];
    
    XCTAssertNil(generatedDescriptor);
    
}

@end
