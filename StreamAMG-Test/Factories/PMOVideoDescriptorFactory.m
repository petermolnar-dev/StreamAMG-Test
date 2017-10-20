//
//  PMOVideoDescriptorFactory.m
//  StreamAMG-Test
//
//  Created by Peter Molnar on 20/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import "PMOVideoDescriptorFactory.h"

@implementation PMOVideoDescriptorFactory

+ (PMOVideoDescriptor *)buildVideoDescriptorFromDictionary:(NSDictionary *)videoDetailsDictionary {

    NSString *title = [videoDetailsDictionary valueForKey:@"title"];
    NSString *videoUrlAsString = [videoDetailsDictionary valueForKey:@"video_url"];
    NSString *durationAsString = [videoDetailsDictionary valueForKey:@"duration"];
    NSString *thumbnailUrlAsString = [videoDetailsDictionary valueForKey:@"thumbnail_url"];
    
    // Basic data null validation
    if (title && videoUrlAsString && durationAsString) {
        PMOVideoDescriptor *videoDescriptor = [[PMOVideoDescriptor alloc] init];
        videoDescriptor.title = title;
        videoDescriptor.videoUrlAsString = videoUrlAsString;
        videoDescriptor.durationAsString = durationAsString;
        videoDescriptor.thumbnailUrlAsString = thumbnailUrlAsString;
        
        return videoDescriptor;
    } else {
        return nil;
    }
}

@end
