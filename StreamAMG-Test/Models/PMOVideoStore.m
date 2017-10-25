//
//  PMOVideoStore.m
//  StreamAMG-Test
//
//  Created by Peter Molnar on 23/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import "PMOVideoStore.h"
#import "PMOVideoDescriptorFactory.h"

@interface PMOVideoStore()

@property (strong, nonatomic, nullable) NSMutableArray <PMOVideoDescriptor *> *videoMetadataArray;
@end

@implementation PMOVideoStore

@synthesize currentlyPlayingIndex = _currentlyPlayingIndex;

#pragma mark - Accessors
- (NSMutableArray <PMOVideoDescriptor *>*)videoMetadataArray {
    if (!_videoMetadataArray) {
        _videoMetadataArray = [[NSMutableArray alloc] init];
    }
    
    return _videoMetadataArray;
}

#pragma mark - implementing PMOVideoMetaDataProvider protocol
- (void)addMetaDataFromDictionary:(NSDictionary *)metadataAsDictionary {
    PMOVideoDescriptor *currentVideoDescriptor = [PMOVideoDescriptorFactory buildVideoDescriptorFromDictionary:metadataAsDictionary];
    [self.videoMetadataArray addObject:currentVideoDescriptor];
    
}

- (NSUInteger)metadataCount {
    return [self.videoMetadataArray count];
}

- (NSArray <PMOVideoDescriptor *>*)allMetaDataAsArray {
    return [self.videoMetadataArray copy];
}

- (NSDictionary *)metadataDictionaryAtIndex:(NSInteger)index {
    if (index < [self.videoMetadataArray count]) {
        PMOVideoDescriptor *descriptorAtIndex = [self.videoMetadataArray objectAtIndex:index];
        NSDictionary *metadataDictionary = @{@"title" : descriptorAtIndex.title,
                                             @"video_url" : descriptorAtIndex.videoUrlAsString,
                                             @"duration" : descriptorAtIndex.durationAsString,
                                             @"thumbnail_url" : descriptorAtIndex.thumbnailUrlAsString
                                             };
        return metadataDictionary;
    } else {
        return nil;
    }
    
}

#pragma mark - implementing PMOVideoMetaDataProvider protocol
- (AVPlayerItem *)playerItemAtIndex:(NSUInteger)index {
    if (index < [self metadataCount] )  {
        self.currentlyPlayingIndex = index;
        NSURL *url =[NSURL URLWithString:[self.videoMetadataArray objectAtIndex:index].videoUrlAsString];
        AVPlayerItem *currPlayerItem = [AVPlayerItem playerItemWithURL:url];
        
        return currPlayerItem;
    } else {
        return nil;
    }
}


- (nullable AVPlayerItem *)nextPlayerItem {
    ++self.currentlyPlayingIndex;
    if (self.currentlyPlayingIndex < [self metadataCount]) {
        return [self playerItemAtIndex:self.currentlyPlayingIndex];
    } else {
        return nil;
    }
}


- (nullable AVPlayerItem *)previousPlayerItem {
    --self.currentlyPlayingIndex;
    return [self playerItemAtIndex:self.currentlyPlayingIndex];
}

- (nullable AVPlayerItem *)currentlyPlayingItem {
    return [self playerItemAtIndex:self.currentlyPlayingIndex];
}

@end
