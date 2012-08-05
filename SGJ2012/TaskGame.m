//
//  TaskGame.m
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TaskGame.h"
#import "RenderCore.h"
#import "Bomb.h"


#define SIDE_MOVE_SPEED 21


@implementation TaskGame

- (void)onBegin
{
    backgroundPictures = [NSArray arrayWithObjects: @"stage1.png", @"stage2.png", @"stage3.png", nil];
    
    itemInStage1 = [NSArray arrayWithObjects: @"item_sparklers.png", @"item_house.png", nil];
    stage1ItemsTriggerTime[0] = 9;
    stage1ItemsTriggerTime[1] = 7;
     
    itemInStage2 = [NSArray arrayWithObjects: @"item_dress.png", @"item_camera.png", nil];
    stage2ItemsTriggerTime[0] = 10;
    stage2ItemsTriggerTime[1] = 18;
    
    itemInStage3 = [NSArray arrayWithObjects: @"item_frog.png", @"item_sparklers.png", nil];
    stage3ItemsTriggerTime[0] = 15;
    stage3ItemsTriggerTime[1] = 25;

    m_currItemArray = [[NSMutableArray alloc] init];
    
    m_tunnel = [[TimeTunnel alloc] init];
    m_tunnel.MAX_DISTANCE = 60;
    m_distance = 0.0f;
    
    m_player = [[Player alloc] initWith:512 andY: 600];
    [m_player onBegin];
    
    m_bomb = [[Bomb alloc] initWithPosX:0 andPosY:-0.25 andPosZ: -2 setAlive:NO];
    [m_bomb setAspect:1.3333f andFov:atan(10.0f * (4.0f/3))];
    
    [m_bomb onCreate];
    
      //TODO
    
    // create the motion manager
    m_motionMgr = [[CMMotionManager alloc] init];
    [m_motionMgr setAccelerometerUpdateInterval:1.0f/30.0f];
    [m_motionMgr startAccelerometerUpdates];
    
    m_currStage = 0;
    
    [self nextStage];
}


- (void)nextStage
{
    switch(m_currStage)
    {
        case 1:
            [self onEndStage1];
            break;
        case 2:
            [self onEndStage2];
            break;
        case 3:
            [self onEndStage3];
            break;
    }
    switch(m_currStage + 1)
    {
        case 1:
            [self onbeginStage1];
            break;
        case 2:
            [self onbeginStage2];
            break;
        
        case 3:
            [self onbeginStage3];
            break;
    }
    
    m_currStage += 1;
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
    m_distance+= (elapse * 0.6f);
    
    [m_bomb onFrame:elapse];
    [m_player onFrame:elapse];
    
    // move the player to left or right by the accelerometer
    CMAccelerometerData *newestAccel = m_motionMgr.accelerometerData;
    double y = newestAccel.acceleration.y;
    if( [TaskManager sharedInstance].CUR_ORIENTATION == UIInterfaceOrientationLandscapeRight )
    {
        y = -y;
    }
    [m_player MoveSide:y*SIDE_MOVE_SPEED];
    
    switch(m_currStage)
    {
        case 1:
            [self onFrameStage1:elapse];
            break;
        case 2:
            [self onFrameStage2:elapse];
            break;
        case 3:
            [self onFrameStage3:elapse];
            break;
    }
    
    for (int i = 0; i < m_currItemArray.count; i++)
    {
        MemoryItem* t_item = [m_currItemArray objectAtIndex:i];
        [t_item onUpdate:elapse];
    }
    
    m_timer += 0.03333;
    
}

- (void)onDraw:(float)elapse
{
    [m_tunnel Draw];
    
    [m_player onDraw:elapse];
    
    [m_bomb onDraw];
    
    [m_item onDraw];
    
    switch(m_currStage)
    {
        case 1:
            [self onDrawStage1:elapse];
            break;
        case 2:
            [self onDrawStage2:elapse];
            break;
        case 3:
            [self onDrawStage3:elapse];
            break;
    }
    
    for (int i = 0; i < m_currItemArray.count; i++)
    {
        MemoryItem* t_item = [m_currItemArray objectAtIndex:i];
        [t_item onDraw];
    }

}

- (BOOL)onTouchEvent:(NSArray*)events
{
    //TODO
    [m_player onTouchEvent:events];

    
    switch(m_currStage)
    {
        case 1:
            [self handleEventStage1:events];
            break;
        case 2:
            [self handleEventStage2:events];
            break;
        case 3:
            [self handleEventStage3:events];
            break;
    }

    return NO; 
}

- (void)onDestory
{
    //TODO
    
    [m_bomb onDestroy];
    
    [m_player onDestroy];
    
}

- (void)removeItem:(MemoryItem*)item
{
    for (int i = 0; i < m_currItemArray.count; i++)
    {
        MemoryItem* t_item = [m_currItemArray objectAtIndex:i];
        if(t_item == item)
        {
            [t_item onEnd];
            [m_currItemArray removeObject:t_item];
        }
    }

}


- (void)onbeginStage1
{
    for(int i = 0; i < itemInStage1.count; i++)
    {
        NSString* t_fileName = [itemInStage1 objectAtIndex:i];
        MemoryItem* t_item = [[MemoryItem alloc] initWithType:1 andStartPosX:0 startPosY:-0.25 startPosZ:-20 withSpeed:5 withPlayer:m_player with: t_fileName];
        
        [t_item setAspect:(1.3333f) andFovy:atan(10.0f * (4.0f/3))];
        
        [t_item setTriggerTime:stage1ItemsTriggerTime[i]];
        
        [t_item setBomb:m_bomb];
        
        [t_item setObserver:self];
        
        [m_currItemArray addObject:t_item];
    }
}


- (void)onFrameStage1:(float)elapse
{
    for (int i = 0; i < m_currItemArray.count; i++)
    {
        MemoryItem* t_item = [m_currItemArray objectAtIndex:i];
        if(![t_item isAlive])
        {
            if(m_timer > stage1ItemsTriggerTime[i])
            {
                [t_item enable];
            }
        }
    }

    if (m_timer > STAGE1CYCLETIME)
        m_timer = 0;
}

- (void)onDrawStage1:(float)elapse
{
   
}

- (void)handleEventStage1:(NSArray *)events
{
    [m_bomb launch:10 withX: [m_player getPositionX]];
    
    [m_player transitStateTo:attack];
}

@end
