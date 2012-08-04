//
//  TaskGame.m
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TaskGame.h"
#import "RenderCore.h"

#define SIDE_MOVE_SPEED 21

@implementation TaskGame

- (void)onBegin
{
    m_tunnel = [[TimeTunnel alloc] init];
    m_tunnel.MAX_DISTANCE = 60;
    m_distance = 0.0f;
    
    m_player = [[Player alloc] initWith:512 andY: 600];
    [m_player onBegin];
    
    m_item = [[MemoryItem alloc] initWithType:1 andStartPosX:0 startPosY:-0.25 startPosZ:-20 withSpeed:5 withPlayer:m_player];
    [m_item setAspect:(1.3333f) andFovy:atan(10.0f * (4.0f/3))];
    [m_item onBegin];
    //TODO
    
    // create the motion manager
    m_motionMgr = [[CMMotionManager alloc] init];
    [m_motionMgr setAccelerometerUpdateInterval:1.0f/30.0f];
    [m_motionMgr startAccelerometerUpdates];
}

- (void)onEnd
{
    //TODO
    [m_item onEnd];
    
    [m_player onEnd];
    
    [m_tunnel release];
    
    [m_motionMgr stopAccelerometerUpdates];
    [m_motionMgr release];
}

- (void)onFrame:(float)elapse
{
    m_tunnel.DISTANCE = m_distance;
    m_distance+=elapse;
    
    [m_item onUpdate:elapse];
    [m_player onFrame:elapse];
    
    // move the player to left or right by the accelerometer
    CMAccelerometerData *newestAccel = m_motionMgr.accelerometerData;
    double y = newestAccel.acceleration.y;
    if( [TaskManager sharedInstance].CUR_ORIENTATION == UIInterfaceOrientationLandscapeRight )
    {
        y = -y;
    }
    [m_player MoveSide:y*SIDE_MOVE_SPEED];
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
