//
//  PMOVideoDescriptor.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 20/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 Class for storing the data of the video description. Purely for data storage.
 */
@interface PMOVideoDescriptor : NSObject

/**
 Title of the video, mandatory.
 */
@property (copy, nonatomic, nonnull) NSString *title;

/**
 The url of the video stream, mandatory.
 */
@property (copy, nonatomic, nonnull) NSString *videoUrlAsString;

/**
 The duration of the video, mandatory.
 */
@property (copy, nonatomic, nonnull) NSString *durationAsString;


/**
 Thumbnail Image URL for the video, optional;
 */
@property (copy, nonatomic, nullable) NSString *thumbnailUrlAsString;

/**
 Thumbnail image of the video, optional.
 */
@property (strong, nonatomic, nullable) UIImage *thumbnailImage;




@end
