//
//  ViewController.m
//  StreamAMG-Test
//
//  Created by Peter Molnar on 19/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // grab a local URL to our video
    NSURL *videoURL = [NSURL URLWithString:@"http://open.http.staging-k9.streamuk.com/p/3000021/sp/300002100/playManifest/entryId/0_0ywhyahw/format/applehttp/protocol/http/a.m3u8"];
//    AVURLAsset *sourceAsset = [AVURLAsset URLAssetWithURL:videoURL options:nil];
//    CMTime duration = sourceAsset.duration;

    // create an AVPlayer
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    
    // create a player view controller
    AVPlayerViewController *controller = [[AVPlayerViewController alloc]init];
    controller.player = player;
    [player play];
    
    // show the view controller
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    controller.view.frame = self.view.frame;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
