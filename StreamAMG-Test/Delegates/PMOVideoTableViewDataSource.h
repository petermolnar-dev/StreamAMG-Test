//
//  PMOVideoTableViewDataSource.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 20/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PMOVideoDescriptor.h"


/**
 Custom datasource for the video table view
 */
@interface PMOVideoTableViewDataSource : NSObject  <UITableViewDataSource>


/**
 Custom designated initializer

 @param videoDescriptors : A nonnul Array of the previously built video descriptor list.
 @return fully initialized instance of the datasource
 */
- (nullable instancetype)initWithVideoDescriptors:(nonnull NSArray <PMOVideoDescriptor *> *)videoDescriptors NS_DESIGNATED_INITIALIZER;

/**
 Disabling the original initialiser
 */
- (nonnull instancetype)init NS_UNAVAILABLE;

@end
