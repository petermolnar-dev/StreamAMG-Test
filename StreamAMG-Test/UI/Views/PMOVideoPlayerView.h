//
//  PMOMoviePlayerView.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 22/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>


/**
 The view of containing the video
 */
@interface PMOVideoPlayerView : UIView

@property (strong, nonatomic, nonnull) AVPlayer *player;


- (void)setPlayer:(nonnull AVPlayer *)player;
- (void)setVideoFillMode:(nonnull NSString *)fillMode;

@end
