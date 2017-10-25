//
//  PMOVideoListViewController.m
//  StreamAMG-Test
//
//  Created by Peter Molnar on 20/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import "PMOVideoListViewController.h"
#import "PMOVideoTableViewDataSource.h"
#import "PMOVideoTableViewDelegate.h"
#import "PMODownloader.h"
#import "PMOAfterSplashView.h"
#import "PMOVideoStore.h"


@interface PMOVideoListViewController ()

@property (strong, nonatomic, nullable) PMOAfterSplashView *afterSplashView;
@property (strong, nonatomic, nonnull) PMOVideoStore *videoStore;
@end

@implementation PMOVideoListViewController

@synthesize videoTableViewDelegate = _videoTableViewDelegate;
@synthesize videoTableView = _videoTableView;
@synthesize videoTableViewDataSource = _videoTableViewDataSource;

#pragma mark - View Controller lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view  addSubview:self.afterSplashView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!self.videoTableView) {
    
    PMODownloader *downloader = [[PMODownloader alloc] init];
    NSURL *downloadUrl = [NSURL URLWithString:@"https://demo.petermolnar.hu/streamamg.json"];
    
    __weak typeof(self) weakSelf = self;
    [self.afterSplashView startSpinner];
    [downloader downloadDataFromURL:downloadUrl completionHander:^(BOOL success, NSData * _Nullable downloadedData, NSError * _Nullable error) {
        if (success) {
            NSError *jsonError;
            NSArray *JSONData = [NSJSONSerialization JSONObjectWithData:downloadedData
                                                                options:0
                                                                  error:&jsonError];
            if (!jsonError) {
                // Build the list of downloadable items.
                for (NSDictionary *currentMetaData in JSONData) {
                    [weakSelf.videoStore addMetaDataFromDictionary:currentMetaData];
                }
                [weakSelf initializeTableView];
            } else {
                NSLog(@"Error during parsing the JSON: %@", jsonError.localizedDescription);
            }
#warning TODO: Implement fallback view with retry
            [weakSelf.afterSplashView stopSpinner];
        }
    }];
    }

}


#pragma mark - Accessors
- (PMOAfterSplashView *)afterSplashView {
    if (!_afterSplashView) {
        _afterSplashView = [[PMOAfterSplashView alloc] initWithFrame:self.view.frame];
        _afterSplashView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _afterSplashView;
}


- (PMOVideoStore *)videoStore {
    if (!_videoStore) {
        _videoStore = [[PMOVideoStore alloc] init];
    }
    
    return _videoStore;
}
#pragma mark - Implementing protocols

- (void)initializeTableView {
    self.videoTableViewDataSource = [[PMOVideoTableViewDataSource alloc] initWithVideoMetadataProvider:self.videoStore];
    self.videoTableViewDelegate = [[PMOVideoTableViewDelegate alloc] initWithVideoPlayableItemProvider:self.videoStore metadataProvider:self.videoStore targetViewController:self];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.videoTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        self.videoTableView.dataSource = self.videoTableViewDataSource;
        self.videoTableView.delegate = self.videoTableViewDelegate;
        [self.view addSubview:self.videoTableView];
        self.videoTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.videoTableView reloadData];
    }];
    
}



@end
