//
//  PMOVideoListViewController.m
//  StreamAMG-Test
//
//  Created by Peter Molnar on 20/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import "PMOVideoListViewController.h"
#import "PMOVideoTableViewDataSource.h"
#import "PMOVideoDescriptorFactory.h"
#import "PMODownloader.h"
#import "PMOAfterSplashView.h"

@interface PMOVideoListViewController ()

@property (strong, nullable, nonatomic) PMOAfterSplashView *afterSplashView;

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
    
    PMODownloader *downloader = [[PMODownloader alloc] init];
    NSMutableArray *videoArray = [[NSMutableArray alloc] init];
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
                for (NSDictionary *videoDictionary  in JSONData) {
                    PMOVideoDescriptor *currentVideoDescriptor = [PMOVideoDescriptorFactory buildVideoDescriptorFromDictionary:videoDictionary];
                    [videoArray addObject:currentVideoDescriptor];
                }
                [weakSelf initializeTableViewWithData:videoArray];
            } else {
                NSLog(@"Error during parsing the JSON: %@", jsonError.localizedDescription);
            }
#warning TODO: Implement fallback view with retry
            [weakSelf.afterSplashView stopSpinner];
        }
    }];
    

}


#pragma mark - Accessors
- (PMOAfterSplashView *)afterSplashView {
    if (!_afterSplashView) {
        _afterSplashView = [[PMOAfterSplashView alloc] initWithFrame:self.view.frame];
    }
    return _afterSplashView;
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - Implementing protocols

- (void)initializeTableViewWithData:(NSArray *)tableData  {
    self.videoTableViewDataSource = [[PMOVideoTableViewDataSource alloc] initWithVideoDescriptors:tableData];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.videoTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        self.videoTableView.dataSource = self.videoTableViewDataSource;
        [self.view addSubview:self.videoTableView];
        [self.videoTableView reloadData];
    }];
    
}



@end
