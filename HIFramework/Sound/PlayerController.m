//
//  PlayerController.m
//  HIFramework
//
//  Created by He jia bin on 7/19/12.
//  Copyright (c) 2012 FancyBlockGames. All rights reserved.
//

#import "PlayerController.h"

@implementation PlayerController

@synthesize LOOP_TIMES;


/* audioPlayerDidFinishPlaying:successfully: is called when a sound has finished playing. This method is NOT called if the Player is stopped due to an interruption. */
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)Player successfully:(BOOL)flag
{
    if( self.LOOP_TIMES < 0 )
    {
        [Player play];
    }
    else if( self.LOOP_TIMES == 0 )
    {
        return;
    }
    else if( self.LOOP_TIMES > 0 )
    {
        self.LOOP_TIMES--;
        
        [Player play];
    }
}


@end
