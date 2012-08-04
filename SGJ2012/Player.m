//
//  Player.m
//  SGJ2012
//
//  Created by li jin on 12-8-4.
//  Copyright (c) 2012年 2k. All rights reserved.
//

#import "Player.h"

@implementation Player


- (id) initWith:(double)posX andY:(double)posY
{
    [super init];
    m_posX = posX;
    m_posY = posY;
    m_currState = invalid;
    return self;
}
 
// state invalid
- (void)beginInvalid
{}
- (void)endInvalid
{}
- (void)updateInvalid:(double)elapse
{}
- (void)handleEventInvalid:(NSArray *)events
{}

// state run
- (void)beginRun
{
    m_PlayerSprite = [[GraphicFactory sharedInstance ] CreateSprite:@"brown_bear.png"];
    [m_PlayerSprite SetUVFrom:CGPointMake(0, 0) to:CGPointMake(1, 1)];
    [m_PlayerSprite SetSize:CGPointMake(155, 219)];
    [m_PlayerSprite SetAnchor:CGPointMake(0.5, 0.5)];
}
- (void)endRun
{}
- (void)updateRun:(double)elapse
{}
- (void)drawRun
{
    
}
- (void)handleEventRun:(NSArray *)events
{
    if([events count] == 1)
    {
        TouchEvent* event = [events objectAtIndex:0];
        if( event.X < 512)
        {
            m_posX -= 10;
        }
        else 
        {
            m_posX += 10;
        }
    }
        
}

// state attack
- (void)beginAttack
{}
- (void)endAttack
{}
- (void)updateAttack:(double)elapse
{}
- (void)drawAttack
{}
- (void)handleEventAttack:(NSArray *)events
{}

// state attacked
- (void)beginAttacked
{}
- (void)endAttacked
{}
- (void)updateAttacked:(double)elapse
{}
- (void)drawAttacked
{}
- (void)handleEventAttacked:(NSArray *)events
{}

// state die
- (void)beginDie
{}
- (void)endDie
{}
- (void)updateDie:(double)elapse
{}
- (void)drawDie
{}
- (void)handleEventDie:(NSArray *)events
{}


- (void)onBegin
{
    [self transitStateTo:run];
    //TODO
}

- (void)onEnd
{
    //TODO
}

- (void)transitStateTo:(const int)nextState
{
    switch (m_currState) {
        case invalid:
            [self endInvalid];
            break;  
        
        case run:
            [self endRun];
            break;
        
        case attack:
            [self endAttack];
            break;
            
        case attacked:
            [self endAttacked];
            break;
            
        case die:
            [self endDie];
            break;
            
        default:
            break;
    }
    
    switch (nextState) {
            
        case run:
            [self beginRun];
            break;
            
        case attack:
            [self beginAttack];
            break;
            
        case attacked:
            [self beginAttacked];
            break;
            
        case die:
            [self beginDie];
            break;
            
        default:
            break;
    }
    
    m_currState = nextState;
}

- (void)onFrame:(double)elapse
{
    switch(m_currState)
    {
        case invalid:
            [self updateInvalid:elapse];
            break;
            
        case run:
            [self updateRun:elapse];
            break;
        
        case attack:
            [self updateAttack:elapse];
            break;
        
        case attacked:
            [self updateAttacked:elapse];
            break;
        
        case die:
            [self updateDie:elapse];
            break;
            
        default:
            break;
        
    }
    
    
    
}

- (void)onDraw:(double)elapse
{
    [m_PlayerSprite DrawAt:CGPointMake(m_posX, m_posY)];
    
}

- (BOOL)onTouchEvent:(NSArray*)events
{
    //TODO
    switch(m_currState)
    {
        case invalid:
            [self handleEventInvalid:events];
            break;
            
        case run:
            [self handleEventRun:events];
            break;
            
        case attack:
            [self handleEventAttack:events];
            break;
            
        case attacked:
            [self handleEventAttacked:events];
            break;
            
        case die:
            [self handleEventDie:events];
            break;
        default:
            break;
            
    }
    
    return NO; 
}

- (void)onDestroy
{}
@end
