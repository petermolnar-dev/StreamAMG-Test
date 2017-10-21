//
//  PMOSpinnableAbstract.m
//  StreamAMG-Test
//
//  Created by Peter Molnar on 21/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import "PMOSpinnableAbstractView.h"

@implementation PMOSpinnableAbstractView

@synthesize spinner = _spinner;

#pragma mark - Customized Init
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        _spinner = [[UIActivityIndicatorView alloc]
                            initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _spinner.color = [UIColor blackColor];
        _spinner.center = CGPointMake(self.bounds.size.width / 2,
                                              self.bounds.size.height / 2);
        _spinner.autoresizingMask =
        UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin |
        UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [self addSubview:_spinner];
    }
    
    return self;
}

#pragma mark - Implementing PMOSpinnable protocol
- (void)startSpinner {
        [self.spinner startAnimating];
}

- (void)stopSpinner {
    __weak typeof(self) weakSelf = self;
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [weakSelf.spinner stopAnimating];
        [weakSelf.spinner removeFromSuperview];
        [weakSelf.spinner removeFromSuperview];
    }];
}

@end
