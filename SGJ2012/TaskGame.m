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
    m_spr = [[GraphicFactory sharedInstance] CreateSprite:@"wall01.png"];
    [m_spr SetUVFrom:CGPointMake(0, 0) to:CGPointMake(1, 1)];
    [m_spr SetSize:CGPointMake(100, 100)];
    
    //TODO
}

- (void)onEnd
{
    //TODO
}

- (void)onFrame:(float)elapse
{
    //TODO
}

- (void)onDraw:(float)elapse
{
    [m_spr DrawAt:CGPointMake(100, 200)];
    
    //TODO
}

- (BOOL)onTouchEvent:(NSArray*)events
{
    //TODO
    
    return NO; 
}

- (void)onDestory
{
    //TODO
}

@end
