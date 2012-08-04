//
//  TaskGame.m
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TaskGame.h"
#import "RenderCore.h"

@implementation TaskGame

- (void)onBegin
{
    //TODO
    m_player = [[Player alloc] initWith:512 andY: 600];
    [m_player onBegin];
}

- (void)onEnd
{
    //TODO
    [m_player onEnd];
}

- (void)onFrame:(float)elapse
{
    //TODO
    [m_player onFrame:elapse];
}

- (void)onDraw:(float)elapse
{
    //TODO
    [m_player onDraw:elapse];
}

- (BOOL)onTouchEvent:(NSArray*)events
{
    //TODO
    [m_player onTouchEvent:events];
    return NO; 
}

- (void)onDestory
{
    //TODO
    [m_player onDestroy];
    
}

@end
