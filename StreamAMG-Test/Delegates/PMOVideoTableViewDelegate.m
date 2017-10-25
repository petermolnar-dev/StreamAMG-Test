//
//  PMOVideoTableViewDelegate.m
//  StreamAMG-Test
//
//  Created by Peter Molnar on 21/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import "PMOVideoTableViewDelegate.h"
#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import "PMOVideoPlayerViewController.h"

@interface PMOVideoTableViewDelegate()

@property (weak, nonatomic, nullable) id <PMOVideoPlayableItemProvider> playableItemProvider;
@property (weak, nonatomic, nullable) id <PMOVideoMetaDataProvider> metadataProvider;
@property (weak, nonatomic, nullable) UIViewController *targetViewController;

@end

@implementation PMOVideoTableViewDelegate 

#pragma mark - Designated initializer
- (nullable instancetype)initWithVideoPlayableItemProvider:(nonnull id <PMOVideoPlayableItemProvider>)playableItemProvider metadataProvider:(nonnull id <PMOVideoMetaDataProvider>)metadataProvider targetViewController:(nonnull UIViewController *)targetViewController {
    self = [super init];
    
    if (self) {
        _playableItemProvider = playableItemProvider;
        _targetViewController = targetViewController;
        _metadataProvider = metadataProvider;
    }
    if (!_playableItemProvider || [_playableItemProvider metadataCount] == 0) {
        return nil;
    } else {
        return self;
    }
}

#pragma mark - Implementing the UITableViewDelegate Protocol
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    PMOVideoPlayerViewController *playerViewController = [[PMOVideoPlayerViewController alloc] init];
    [self.playableItemProvider setCurrentlyPlayingIndex:indexPath.row];
    playerViewController.videoPlayableProvider = self.playableItemProvider;
    playerViewController.videoMetaDataProvider = self.metadataProvider;
    [self.targetViewController presentViewController:playerViewController animated:YES completion:nil];
    playerViewController.view.frame = self.targetViewController.view.frame;

}


- (void)skipToNextItemForPlayerViewController:(AVPlayerViewController *)playerViewController {
    NSLog(@"Skip to next");
}

@end
