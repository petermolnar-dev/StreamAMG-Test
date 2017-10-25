//
//  PMOVideoStore.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 23/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMOVideoMetaDataProvider.h"
#import "PMOVideoPlayableItemProvider.h"


/**
 The main storage of the videos and their metadata
 */
@interface PMOVideoStore : NSObject <PMOVideoMetaDataProvider, PMOVideoPlayableItemProvider>

@end
