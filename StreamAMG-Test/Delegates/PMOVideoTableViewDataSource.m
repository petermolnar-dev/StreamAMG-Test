//
//  PMOVideoTableViewDataSource.m
//  StreamAMG-Test
//
//  Created by Peter Molnar on 20/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import "PMOVideoTableViewDataSource.h"

@interface PMOVideoTableViewDataSource()
@property (strong, nonatomic, nullable) NSArray <PMOVideoDescriptor *> *videoDescriptors;
@end

@implementation PMOVideoTableViewDataSource

- (nullable instancetype)initWithVideoDescriptors:(nonnull NSArray <PMOVideoDescriptor *> *)videoDescriptors {
    self = [super init];
    
    if (self) {
        _videoDescriptors = videoDescriptors;
    }
    if (!videoDescriptors || [videoDescriptors count] == 0) {
        return nil;
    } else {
        return self;
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
     static NSString *cellIdentifier = @"VideoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    

#warning TODO: implement custom cell
    NSString *currTitle = [self.videoDescriptors objectAtIndex:indexPath.row].title;
    NSString *currDuration = [self.videoDescriptors objectAtIndex:indexPath.row].durationAsString;
    UIImage *currImage = [self.videoDescriptors objectAtIndex:indexPath.row].thumbnailImage;
    
    cell.textLabel.text = currTitle;
    cell.detailTextLabel.text = currDuration;
    if (currImage) {
        cell.imageView.image = currImage;
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_videoDescriptors count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
