//
//  PMOVideoPlayerMainView.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 22/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMOVideoPlayerView.h"
#import "PMOVideoPlaybackControlsView.h"

/**
 The main view of the video playback. INcludes bot ht eview for the vifeo controls and the video.
 */
@interface PMOVideoPlayerMainView : UIView

@property (weak, nonatomic, nullable) PMOVideoPlayerView *videoPlayerView;
@property (weak, nonatomic, nullable) PMOVideoPlaybackControlsView *controlsView;

- (nonnull instancetype)initWithFrame:(CGRect)frame videoView:(nonnull PMOVideoPlayerView *)videoView controlsView:(nonnull PMOVideoPlaybackControlsView *)controlsView;

/**
 Updating the AVVideolayer filling mode and rectangle size depending on the orintetation.
 */
- (void)updateVideoViewFrameForOrintetion;

@end
