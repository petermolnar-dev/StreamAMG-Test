//
//  PMOVideoPlaybackControlsView.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 22/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMOVideoControlReceiver.h"
#import "PMOViewControllerDismissable.h"


/**
 View containing the video control elements.
 */
@interface PMOVideoPlaybackControlsView : UIView


/**
 Custom Designated initializer, in order to inject the dependency for the control target.

 @param frame the frame for the controls view
 @param controlReceiver The target of the control events
 @param 
 @return a fully initialized instance.
 */
- (nonnull instancetype)initWithFrame:(CGRect)frame controlReceiver:(nonnull id <PMOVideoControlReceiver>)controlReceiver dismissableViewController:(nonnull id <PMOViewControllerDismissable>)dismissableViewController;


/**
 Public API to update the UI preiodically witht the elapsed time.

 @param elapsedTimeString elapsed time as string
 */
- (void)updateCurrentElapsedTimeWithString:(nonnull NSString *)elapsedTimeString;


/**
 Public API to update the UI with a new video static properties

 @param newTitle the title of the video
 @param durationAsString the duration of the video.
 */
- (void)updateTitle:(nonnull NSString *)newTitle durationAsString:(nonnull NSString *)durationAsString;

@end
