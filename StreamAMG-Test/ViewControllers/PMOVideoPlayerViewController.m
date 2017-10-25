//
//  ViewController.m
//  StreamAMG-Test
//
//  Created by Peter Molnar on 19/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import "PMOVideoPlayerViewController.h"
#import "PMOVideoPlayerMainView.h"
#import "PMOVideoPlayerControlDelegate.h"

static void *VideoMediaChangedObservation = &VideoMediaChangedObservation;


@interface PMOVideoPlayerViewController ()

@property (strong, nonatomic, nonnull) PMOVideoPlayerControlDelegate *playerControlDelegate;
@property (strong, nonatomic, nonnull) PMOVideoPlayerView *videoPlayerView;
@property (strong, nonatomic, nonnull) PMOVideoPlaybackControlsView *playbackControlsView;
@property (strong, nonatomic, nonnull) AVPlayer *moviePlayer;

@property (strong, nonatomic, nonnull) id timeObserver;

@property (strong, nonatomic, nonnull) PMOVideoPlayerMainView *videoPlayerMainView;

@end

@implementation PMOVideoPlayerViewController

#pragma mark - ViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
    [self addCurrentTimeObserver];
    
    [self setupPlayerObservers];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.playerControlDelegate play];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.playerControlDelegate pause];
}

#pragma mark - Custom helpers
- (void)setup {
    self.moviePlayer = [AVPlayer playerWithPlayerItem:[self.videoPlayableProvider currentlyPlayingItem]];
    self.playerControlDelegate = [[PMOVideoPlayerControlDelegate alloc] initWithPlayer:self.moviePlayer videoPlayableItemProvider:self.videoPlayableProvider];
    self.videoPlayerView = [[PMOVideoPlayerView alloc] init];
    self.videoPlayerView.player = self.moviePlayer;
    [self.videoPlayerView setVideoFillMode:AVLayerVideoGravityResizeAspect];
    
    self.playbackControlsView = [[PMOVideoPlaybackControlsView alloc] initWithFrame:self.view.frame controlReceiver:self.playerControlDelegate dismissableViewController:self];
    NSDictionary *videoMetadataDictinonary = [self.videoMetaDataProvider metadataDictionaryAtIndex:self.videoPlayableProvider.currentlyPlayingIndex];
    
    [self.playbackControlsView updateTitle:[videoMetadataDictinonary objectForKey:@"title"] durationAsString:[videoMetadataDictinonary objectForKey:@"duration"]];
    self.videoPlayerMainView = [[PMOVideoPlayerMainView alloc] initWithFrame:self.view.frame videoView:self.videoPlayerView controlsView:self.playbackControlsView ];
    self.view = self.videoPlayerMainView;
}


- (NSString *)getStringFromCMTime:(CMTime)time
{
    Float64 currentSeconds = CMTimeGetSeconds(time);
    int mins = currentSeconds/60.0;
    int secs = fmodf(currentSeconds, 60.0);
    NSString *minsString = mins < 10 ? [NSString stringWithFormat:@"0%d", mins] : [NSString stringWithFormat:@"%d", mins];
    NSString *secsString = secs < 10 ? [NSString stringWithFormat:@"0%d", secs] : [NSString stringWithFormat:@"%d", secs];
    return [NSString stringWithFormat:@"%@:%@", minsString, secsString];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self.videoPlayerMainView updateVideoViewFrameForOrintetion];
        
    }];
    
}

#pragma mark - Observer helpers

- (void)addCurrentTimeObserver {
    CMTime interval = CMTimeMake(33, 1000);
    __weak __typeof(self) weakself = self;
    
    self.timeObserver = [self.moviePlayer addPeriodicTimeObserverForInterval:interval queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSString *playbackTime = [weakself getStringFromCMTime:weakself.moviePlayer.currentTime];
        [weakself.playbackControlsView updateCurrentElapsedTimeWithString:playbackTime];
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context == VideoMediaChangedObservation) {
        NSUInteger newIndex = [[change objectForKey:@"new"] integerValue];
        NSDictionary *videoMetadataDictinonary = [self.videoMetaDataProvider metadataDictionaryAtIndex:newIndex];
        [self.playbackControlsView updateTitle:[videoMetadataDictinonary objectForKey:@"title"] durationAsString:[videoMetadataDictinonary objectForKey:@"duration"]];
    }
    
}

- (void)setupPlayerObservers {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:[_moviePlayer currentItem]];
    [self.playerControlDelegate addObserver:self forKeyPath:@"videoPlayableItemProvider.currentlyPlayingIndex" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:VideoMediaChangedObservation];
}

#pragma mark - implementing PMOViewControllerDismissable protocol

- (void)dismiss {
    
    [self dismissViewControllerAnimated:self completion:nil];
    
}

- (void)playerItemDidReachEnd:(NSNotification *) notification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:[_moviePlayer currentItem]];
    [self.playerControlDelegate playNextVideo];
    if ([_moviePlayer currentItem]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:[_moviePlayer currentItem]];
    } else {
        // This was the last video
        [self.videoPlayerMainView.videoPlayerView setBackgroundColor:[UIColor whiteColor]];
    }
}

#pragma mark - Dealloc cleanup
- (void)dealloc {
    [self.moviePlayer removeTimeObserver:self.timeObserver];
    [self.playerControlDelegate removeObserver:self forKeyPath:@"videoPlayableItemProvider.currentlyPlayingIndex"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
