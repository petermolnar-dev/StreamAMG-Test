//
//  PMOVideoTableViewDataSource.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 20/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PMOVideoMetaDataProvider.h"


/**
 Custom datasource for the video table view
 */
@interface PMOVideoTableViewDataSource : NSObject  <UITableViewDataSource>


/**
 Custom designated initializer

 @param videoMetadataProvider : A nonnul instance, which conforms the PMOVideoMetaDataProvider protocol, and therefore can provide the data for the cells.
 @return fully initialized instance of the datasource
 */
- (nullable instancetype)initWithVideoMetadataProvider:(nonnull id <PMOVideoMetaDataProvider>)videoMetadataProvider NS_DESIGNATED_INITIALIZER;

/**
 Disabling the original initialiser
 */
- (nonnull instancetype)init NS_UNAVAILABLE;

@end
