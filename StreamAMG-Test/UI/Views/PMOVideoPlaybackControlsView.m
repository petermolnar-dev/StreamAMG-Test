//
//  PMOVideoPlaybackControlsView.m
//  StreamAMG-Test
//
//  Created by Peter Molnar on 22/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import "PMOVideoPlaybackControlsView.h"

@interface PMOVideoPlaybackControlsView()

@property (weak, nonatomic, nullable) id <PMOVideoControlReceiver> controlReceiver;

@property (strong, nonatomic, nonnull) UILabel *title;

@property (strong, nonatomic, nonnull) UIButton *previosButton;
@property (strong, nonatomic, nonnull) UIButton *playButton;
@property (strong, nonatomic, nonnull) UIButton *pauseButton;
@property (strong, nonatomic, nonnull) UIButton *nextButton;

@property (strong, nonatomic, nonnull) UILabel *currentTime;
@property (strong, nonatomic, nonnull) UILabel *durationTime;

@property (strong, nonatomic, nonnull) UIButton *closeButton;

@property (weak, nonatomic, nullable) id <PMOViewControllerDismissable> dismissableViewController;

@end

@implementation PMOVideoPlaybackControlsView

- (nonnull instancetype)initWithFrame:(CGRect)frame controlReceiver:(nonnull id <PMOVideoControlReceiver>)controlReceiver dismissableViewController:(nonnull id <PMOViewControllerDismissable> )dismissableViewController {
    self = [super initWithFrame:frame];
    
    if (self) {
        _controlReceiver = controlReceiver;
        _dismissableViewController = dismissableViewController;
        [self setupViews];
    }
    
    return self;
}


- (void)setupViews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.title];
    [self addSubview:self.previosButton];
    [self addSubview:self.playButton];
    [self addSubview:self.pauseButton];
    [self addSubview:self.nextButton];
    [self addSubview:self.currentTime];
    [self addSubview:self.durationTime];
    [self addSubview:self.closeButton];
    
    
}

#pragma mark - Accessors
- (UIButton *)previosButton {
    if (!_previosButton) {
        _previosButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 45, 45)];
        [_previosButton setImage:[UIImage imageNamed:@"rewind"] forState:UIControlStateNormal];
        [_previosButton addTarget:_controlReceiver action:@selector(playPreviousVideo) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _previosButton;
}


- (UIButton *)nextButton {
    if (!_nextButton) {
        _nextButton = [[UIButton alloc] initWithFrame:CGRectMake(145, 20, 45, 45)];
        [_nextButton setImage:[UIImage imageNamed:@"forward"] forState:UIControlStateNormal];
        [_nextButton addTarget:_controlReceiver action:@selector(playNextVideo) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _nextButton;
}

- (UIButton *)playButton {
    if (!_playButton) {
        _playButton = [[UIButton alloc] initWithFrame:CGRectMake(55, 20, 45, 45)];
        [_playButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [_playButton addTarget:_controlReceiver action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _playButton;
}

- (UIButton *)pauseButton {
    if (!_pauseButton) {
        _pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 20, 45, 45)];
        [_pauseButton setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
        [_pauseButton addTarget:_controlReceiver action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _pauseButton;
}

- (UIButton *)closeButton {
    if (!_closeButton) {
        _closeButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 30, 30, 30)];
        [_closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [_closeButton addTarget:_dismissableViewController action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _closeButton;
}


- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, self.frame.size.width, 20)];
        _title.text = @" Title:  ";
    }
    
    return _title;
}

- (UILabel *)durationTime {
    if (!_durationTime) {
        _durationTime = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 40, 60, 40, 20)];
        _durationTime.text = @"0:00";
    }
    
    return _durationTime;
}

- (UILabel *)currentTime {
    if (!_currentTime) {
        _currentTime = [[UILabel alloc] initWithFrame:CGRectMake(8, 60, 50, 20)];
        _currentTime.text = @"0:00";
    }
    
    return _currentTime;
}


#pragma mark - Public API

- (void)updateTitle:(NSString *)newTitle durationAsString:(NSString *)durationAsString {
    self.title.text = newTitle;
    [self.title setNeedsDisplay];
    self.durationTime.text = durationAsString;
    [self.durationTime setNeedsDisplay];
}

- (void)updateCurrentElapsedTimeWithString:(NSString *)elapsedTimeString {
    self.currentTime.text = elapsedTimeString;
    [self.currentTime setNeedsDisplay];
}

@end
