//
//  PMODownloader.m
//  CommunicationReFactory
//
//  Created by Peter Molnar on 03/11/2016.
//  Copyright © 2016 Peter Molnar. All rights reserved.
//

#import "PMODownloader.h"

@implementation PMODownloader


#pragma mark - Public API / Protocol implementation
- (void)downloadDataFromURL:(nonnull NSURL *)url completionHander:(void(^_Nonnull)(BOOL success, NSData * _Nullable downloadedData, NSError * _Nullable error))callback {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      if (error) {
                                          callback(false, data, error);
                                      } else {
                                          callback(true, data, error);
                                      }
                                  }];
    [task resume];
    
}



@end
