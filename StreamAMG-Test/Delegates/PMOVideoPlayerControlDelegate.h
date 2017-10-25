//
//  PMOVideoPlayerControlDelegate.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 23/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVKit/AVKit.h>
#import "PMOVideoControlReceiver.h"
#import "PMOVideoPlayableItemProvider.h"

/**
 Delegate class to handling the playback controls.
 */
@interface PMOVideoPlayerControlDelegate : NSObject <PMOVideoControlReceiver>

/**
 Setting up the designated initialiser

 @param videoPlayer An already initilized videplayer reference
 @return return a fully initialised delegate instance.
 */
- (nonnull instancetype)initWithPlayer:(nonnull AVPlayer *)videoPlayer videoPlayableItemProvider:(nonnull id <PMOVideoPlayableItemProvider>)videoPlayableItemProvider NS_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init NS_UNAVAILABLE;


/**
 Helper function, to start the very first video
 */
- (void)playVideoFromBeginning;

@end
