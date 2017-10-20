//
//  PMOVideoDescriptorFactory.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 20/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMOVideoDescriptor.h"

@interface PMOVideoDescriptorFactory : NSObject

/**
 Building a video descriptor instance.

 @param videoDetailsDictionary : dictionary of the descriptor values, coming from the parsed JSON
 @return nil or a fully initialised instance of a PMOVideoDescriptor
 */
+(nullable PMOVideoDescriptor *)buildVideoDescriptorFromDictionary:(nonnull NSDictionary *)videoDetailsDictionary;

@end
