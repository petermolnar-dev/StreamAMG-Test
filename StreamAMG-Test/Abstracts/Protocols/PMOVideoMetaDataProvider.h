//
//  PMOVideoMetaDataProvider.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 23/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMOVideoDescriptor.h"


/**
 Protocol providing the functionality to feed and mainain the video metadata (title, duration, etc...).
 */
@protocol PMOVideoMetaDataProvider <NSObject>

- (NSDictionary *)metadataDictionaryAtIndex:(NSInteger)index;
- (void)addMetaDataFromDictionary:(NSDictionary *)metadataAsDictionary;
- (NSUInteger)metadataCount;
- (void)updateThumbnailImageforVideo:(NSString *)videoUrlAsString withThumbnailImage:(UIImage *)thumbnailImage;

@end
