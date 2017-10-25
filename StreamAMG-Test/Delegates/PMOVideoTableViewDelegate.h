//
//  PMOVideoTableViewDelegate.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 21/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PMOVideoPlayableItemProvider.h"
#import "PMOVideoMetaDataProvider.h"

@interface PMOVideoTableViewDelegate : NSObject <UITableViewDelegate>

/**
 Custom designated initializer
 
 @param playableItemProvider  A nonnul instance of a class, which implements the PMOVideoPlayableItemProvider protocol, by giving back AVPlayerITems at a given index.
 @param metadataProvider  A nonnul instance of a class, which implements the PMOVideoMetaDataProvider protocol, by giving back the video informations at a given index.
 @param targetViewController : The viewcontroller, where the presentViewcontroller will be executed, in order to present the videoplayer viewcontroller modaly.
 @return fully initialized instance of the datasource
 */
- (nullable instancetype)initWithVideoPlayableItemProvider:(nonnull id <PMOVideoPlayableItemProvider>)playableItemProvider metadataProvider:(nonnull id <PMOVideoMetaDataProvider>)metadataProvider targetViewController:(nonnull UIViewController *)targetViewController  NS_DESIGNATED_INITIALIZER;

/**
 Disabling the original initialiser
 */
- (nonnull instancetype)init NS_UNAVAILABLE;

@end
