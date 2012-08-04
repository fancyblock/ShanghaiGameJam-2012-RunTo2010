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
    m_tunnel = [[TimeTunnel alloc] init];
    m_distance = 0.0f;
    
    m_player = [[Player alloc] initWith:512 andY: 600];
    [m_player onBegin];
    
    //TODO
}

- (void)onEnd
{
    //TODO
    [m_player onEnd];
    
    [m_tunnel release];
}

- (void)onFrame:(float)elapse
{
    [m_tunnel SetDistance:m_distance];
    m_distance+=elapse;
    
    [m_player onFrame:elapse];
}

- (void)onDraw:(float)elapse
{
    [m_tunnel Draw];
    
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
