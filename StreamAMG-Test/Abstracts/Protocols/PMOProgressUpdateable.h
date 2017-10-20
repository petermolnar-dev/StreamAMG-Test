//
//  PMOProgressUpdateable.h
//  GatherInterior
//
//  Created by Peter Molnar on 18/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PMOProgressUpdateable <NSObject>

- (void)updateProgressWithValue:(float)value;
- (void)updateProgressLabelWith:(NSString *)text;

@end
