//
//  PMODownloader.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 21/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 Simple NSURLSession wrapper
 */
@interface PMODownloader : NSObject
- (void)downloadDataFromURL:(nonnull NSURL *)url completionHander:(void(^_Nonnull)(BOOL success, NSData * _Nullable downloadedData, NSError * _Nullable error))callback;
@end
