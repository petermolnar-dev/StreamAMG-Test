//
//  ViewController.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 19/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import "PMOVideoPlayableItemProvider.h"
#import "PMOVideoMetaDataProvider.h"
#import "PMOViewControllerDismissable.h"


/**
 Viewcontroller to display the playing view of the app
 */
@interface PMOVideoPlayerViewController : UIViewController <PMOViewControllerDismissable>

@property (weak, nonatomic, nullable ) id <PMOVideoPlayableItemProvider> videoPlayableProvider;
@property (weak, nonatomic, nullable) id <PMOVideoMetaDataProvider> videoMetaDataProvider;

@end

