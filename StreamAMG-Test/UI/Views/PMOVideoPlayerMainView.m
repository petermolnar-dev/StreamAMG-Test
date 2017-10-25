//
//  PMOVideoPlayerMainView.m
//  StreamAMG-Test
//
//  Created by Peter Molnar on 22/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import "PMOVideoPlayerMainView.h"

@implementation PMOVideoPlayerMainView

#pragma mark - Initializer
- (nonnull instancetype)initWithFrame:(CGRect)frame videoView:(nonnull PMOVideoPlayerView *)videoView controlsView:(nonnull PMOVideoPlaybackControlsView *)controlsView; {
    self = [super initWithFrame:frame];
    if (self) {
        _videoPlayerView = videoView;
        [_videoPlayerView.layer setFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - 80)];
        
        [self addSubview:_videoPlayerView];
        
        _controlsView = controlsView;
        [_controlsView setFrame:CGRectMake(0, self.bounds.size.height - 80, self.bounds.size.width,  80)];
        [self insertSubview:_controlsView aboveSubview:_videoPlayerView];
    }
    return self;
}


#pragma mark - Public API
- (void)updateVideoViewFrameForOrintetion {
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        [_videoPlayerView setFrame:[UIScreen mainScreen].bounds];
        [self.videoPlayerView setVideoFillMode:AVLayerVideoGravityResizeAspectFill];
        [UIView animateWithDuration:0.5 animations:^{
            [self.controlsView setAlpha:0.0];
        }];
       
    } else {
        [_videoPlayerView.layer setFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - 80)];
        [self.videoPlayerView setVideoFillMode:AVLayerVideoGravityResizeAspect];
        [UIView animateWithDuration:0.5 animations:^{
            [self.controlsView setAlpha:1.0];
        }];
    }
}

@end
