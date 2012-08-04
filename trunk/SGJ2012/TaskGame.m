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
    
    m_item = [[MemoryItem alloc] initWithType:1 andStartPosX:0 startPosY:-0.25 startPosZ:-20 withSpeed:5 withPlayer:m_player];
    [m_item setAspect:(1.3333f) andFovy:atan(10.0f * (4.0f/3))];
    [m_item onBegin];
    //TODO
}

- (void)onEnd
{
    //TODO
    [m_item onEnd];
    
    [m_player onEnd];
    
    [m_tunnel release];
}

- (void)onFrame:(float)elapse
{
    m_tunnel.DISTANCE = m_distance;
    m_distance+=elapse;
    
    [m_item onUpdate:elapse];
    [m_player onFrame:elapse];
}

- (void)onDraw:(float)elapse
{
    [m_tunnel Draw];
    
    [m_player onDraw:elapse];
    
    [m_item onDraw];
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
