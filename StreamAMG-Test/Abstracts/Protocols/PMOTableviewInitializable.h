//
//  PMOTableviewInitializable.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 20/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PMOTableviewInitializable <NSObject>


/**
 Mandatory properties of the class, which implements this protocol.
 */
@property(null_resettable, nonatomic,strong) UIView *view;
@property (strong, nonatomic, nullable) UITableView *videoTableView;
@property (strong, nonatomic, nonnull) id <UITableViewDelegate> videoTableViewDelegate;
@property (strong, nonatomic, nonnull) id <UITableViewDataSource> videoTableViewDataSource;

/**
 Initialize the table view and the data. This method should be called on the object, which contains the tableview.

 @param tableData An Array of the table datasource elements.
 */
- (void)initializeTableViewWithData:(nonnull NSArray *)tableData;

@end
