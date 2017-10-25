//
//  PMOVideoPlayerControlDelegate.m
//  StreamAMG-Test
//
//  Created by Peter Molnar on 23/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import "PMOVideoPlayerControlDelegate.h"

@interface PMOVideoPlayerControlDelegate()

@property (weak, nonatomic, nullable) AVPlayer *videoPlayer;
@property (weak, nonatomic, nullable) id <PMOVideoPlayableItemProvider> videoPlayableItemProvider;

@end


@implementation PMOVideoPlayerControlDelegate

@synthesize isPlaying = _isPlaying;

#pragma mark - Designated initializer

- (nonnull instancetype)initWithPlayer:(nonnull AVPlayer *)videoPlayer videoPlayableItemProvider:(nonnull id <PMOVideoPlayableItemProvider>)videoPlayableItemProvider {
    self = [super init];
    
    if (self) {
        _videoPlayer = videoPlayer;
        _videoPlayableItemProvider = videoPlayableItemProvider;
        _isPlaying = NO;
    }
    
    return self;
}

#pragma mark - Implementing the PMOVideoControlReceiver protocol

- (void)pause {
    self.isPlaying = NO;
    [self.videoPlayer pause];
}

- (void)play {
    self.isPlaying = YES;
    [self.videoPlayer play];
}

- (void)playVideoFromBeginning {
    [self.videoPlayer seekToTime:kCMTimeZero];
    [self play];
}

- (void)playNextVideo {
    AVPlayerItem *nextItem = [self.videoPlayableItemProvider nextPlayerItem];
    if (nextItem) {
        [self.videoPlayer replaceCurrentItemWithPlayerItem:nextItem];
        [self playVideoFromBeginning];
    } else {
        [self stop];
    }
}

- (void)playPreviousVideo {
    AVPlayerItem *previousItem = [self.videoPlayableItemProvider previousPlayerItem];
    if (previousItem) {
        [self.videoPlayer replaceCurrentItemWithPlayerItem:previousItem];
        [self playVideoFromBeginning];
    } else {
        [self stop];
    }

}

- (void)stop {
    self.isPlaying = NO;
    [self.videoPlayer replaceCurrentItemWithPlayerItem:nil];
}


@end
