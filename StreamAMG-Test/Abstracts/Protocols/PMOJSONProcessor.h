//
//  PMOJSONProcessor.h
//  GatherInterior
//
//  Created by Peter Molnar on 19/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PMOJSONProcessor <NSObject>

- (void)startDownloadingJSONWithCompletionHandler:(void(^_Nonnull)(BOOL success))completion;;

@end
