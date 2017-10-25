//
//  PMOVideoControlReceiver.h
//  StreamAMG-Test
//
//  Created by Peter Molnar on 22/10/2017.
//  Copyright © 2017 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PMOVideoControlReceiver <NSObject>


/**
 Protocol to provide the vide player control events.
 */
@property (unsafe_unretained, nonatomic) BOOL isPlaying;

- (void)play;
- (void)pause;
- (void)playNextVideo;
- (void)playPreviousVideo;


@end
