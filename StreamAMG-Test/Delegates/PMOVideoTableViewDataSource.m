//
//  PMOVideoTableViewDataSource.m
//  StreamAMG-Test
//
//  Created by Peter Molnar on 20/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import "PMOVideoTableViewDataSource.h"


@interface PMOVideoTableViewDataSource()
@property (weak, nonatomic, nullable) id <PMOVideoMetaDataProvider> videoMetaDataProvider;
@end

@implementation PMOVideoTableViewDataSource

#pragma mark - Designated initializer
- (nullable instancetype)initWithVideoMetadataProvider:(nonnull id <PMOVideoMetaDataProvider>)videoMetadataProvider {
    self = [super init];
    
    if (self) {
        _videoMetaDataProvider = videoMetadataProvider;
    }
    if (!videoMetadataProvider || [videoMetadataProvider metadataCount] == 0) {
        return nil;
    } else {
        return self;
    }
}

#pragma mark - Implementing the UITableViewDatasource protocol
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"VideoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];

    NSDictionary *currentMetaItem = [self.videoMetaDataProvider metadataDictionaryAtIndex:indexPath.row];
    NSString *currTitle = [currentMetaItem objectForKey:@"title"];
    NSString *currDuration = [currentMetaItem objectForKey:@"duration"];
    UIImage *currImage = [currentMetaItem objectForKey:@"thumbnailImage"];
    if (!currImage) {
        currImage = [UIImage imageNamed:@"streamamg-logo"];
    } 
    
    cell.textLabel.text = currTitle;
    cell.detailTextLabel.text = currDuration;

    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;

    if (currImage) {
        cell.imageView.image = [self imageWithImage:currImage scaledToSize:CGSizeMake(30, 30)];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.videoMetaDataProvider metadataCount];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - Helper functions
- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
