//
//  PMOSpinnable.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 21/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PMOSpinnable <NSObject>

/**
 Reference to the spinner view
 */
@property (strong, nonnull, nonatomic) UIActivityIndicatorView *spinner;


/**
 Starting and stopping the spinner
 */
- (void)startSpinner;
- (void)stopSpinner;

@end
