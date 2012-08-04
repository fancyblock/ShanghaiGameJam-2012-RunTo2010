//
//  TaskTitle.m
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TaskTitle.h"

@implementation TaskTitle


- (void)onBegin
{
    m_tunnel = [[TimeTunnel alloc] init];
    
    m_distance = 0.0f;
}


- (void)onEnd
{
    //TODO 
}


- (void)onFrame:(float)elapse
{
    [m_tunnel SetDistance:m_distance];
    
    m_distance+=elapse;
}


- (void)onDraw:(float)elapse
{
    [m_tunnel Draw];
}


- (BOOL)onTouchEvent:(NSArray*)events
{ 
    return NO;
}


- (void)onDestory
{
    //TODO
}


@end
