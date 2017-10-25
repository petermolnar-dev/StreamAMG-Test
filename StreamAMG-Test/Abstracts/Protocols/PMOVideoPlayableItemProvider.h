//
//  PMOVideoPlayableItemProvider.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 23/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVKit/AVKit.h>

@protocol PMOVideoPlayableItemProvider <NSObject>

/**
 Protocol providing the functionality to feed the AVVideoPlayer class with the AVPlayerItems from the video storage.
 */
@property (unsafe_unretained, nonatomic) NSUInteger currentlyPlayingIndex;

- (nonnull AVPlayerItem *)playerItemAtIndex:(NSUInteger)index;
- (nullable AVPlayerItem *)currentlyPlayingItem;
- (nullable AVPlayerItem *)previousPlayerItem;
- (nullable AVPlayerItem *)nextPlayerItem;
- (NSUInteger)metadataCount;

@end
