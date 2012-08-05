//
//  Player.m
//  SGJ2012
//
//  Created by li jin on 12-8-4.
//  Copyright (c) 2012年 2k. All rights reserved.
//

#import "Player.h"

const static int width = 155;
const static int length = 219;
const static double attackAnimaionInterval = 0.066;

@implementation Player


- (id) initWith:(double)posX andY:(double)posY
{
    [super init];
    m_posX = posX;
    m_posY = posY;
    m_currState = invalid;
    
    m_movieClip_run = [[GraphicFactory sharedInstance] CreateMovieClip:@"bear_animation.png" withInterval:0.06];
    [m_movieClip_run AddFrame:CGRectMake(0.197266, 0.294922, 0.148438, 0.234375) withAnchor:(CGPointMake(0.5, 0.3)) withSize:(CGPointMake(152, 240))];
    [m_movieClip_run AddFrame:CGRectMake(0.197266, 0.531250, 0.148438, 0.234375) withAnchor:(CGPointMake(0.5, 0.3)) withSize:(CGPointMake(152, 240))];
    [m_movieClip_run AddFrame:CGRectMake(0.347656, 0.294922, 0.148438, 0.234375) withAnchor:(CGPointMake(0.5, 0.3)) withSize:(CGPointMake(152, 240))];
    [m_movieClip_run AddFrame:CGRectMake(0.347656, 0.531250, 0.148438, 0.234375) withAnchor:(CGPointMake(0.5, 0.3)) withSize:(CGPointMake(152, 240))];
    
    
    m_movieClip_throw = [[GraphicFactory sharedInstance] CreateMovieClip:@"bear_animation.png" withInterval:attackAnimaionInterval];
    [m_movieClip_throw AddFrame:CGRectMake(0, 0, 0.148438, 0.234375) withAnchor:(CGPointMake(0.5, 0.3)) withSize:(CGPointMake(152, 240))];
    [m_movieClip_throw AddFrame:CGRectMake(0, 0.294922, 0.148438, 0.234375) withAnchor:(CGPointMake(0.5, 0.3)) withSize:(CGPointMake(152, 240))];
    [m_movieClip_throw AddFrame:CGRectMake(0, 0.589844, 0.148438, 0.234375) withAnchor:(CGPointMake(0.5, 0.3)) withSize:(CGPointMake(152, 240))];
    [m_movieClip_throw AddFrame:CGRectMake(0.197266, 0, 0.148438, 0.234375) withAnchor:(CGPointMake(0.5, 0.3)) withSize:(CGPointMake(152, 240))];
    // 5
    [m_movieClip_throw AddFrame:CGRectMake(0.394531, 0, 0.148438, 0.234375) withAnchor:(CGPointMake(0.5, 0.3)) withSize:(CGPointMake(152, 240))];
    
    // 6
    [m_movieClip_throw AddFrame:CGRectMake(0.591797, 0, 0.148438, 0.234375) withAnchor:(CGPointMake(0.5, 0.3)) withSize:(CGPointMake(152, 240))];
    
    // 7
    [m_movieClip_throw AddFrame:CGRectMake(0.789062, 0, 0.148438, 0.234375) withAnchor:(CGPointMake(0.5, 0.3)) withSize:(CGPointMake(152, 240))];

    
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
}
- (void)endRun
{}
- (void)updateRun:(double)elapse
{
    [m_movieClip_run Update:elapse];
}
- (void)drawRun
{
    [m_movieClip_run Draw];
    [m_movieClip_run SetPosition:CGPointMake(m_posX, m_posY)];
    
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


/**
 * @desc    move to left or right
 * @para    offset
 * @return  none
 */
- (void)MoveSide:(float)offset
{
    //TODO   player range limitation
    
    m_posX += offset;
    if (m_posX < width * 0.5)
    {
        m_posX = width * 0.5;
    }
    else if(m_posX > 1024 - width * 0.5)
    {
        m_posX = 1024 - width * 0.5;
    }
}

// state attack
- (void)beginAttack
{}
- (void)endAttack
{}
- (void)updateAttack:(double)elapse
{
    
    [m_movieClip_throw Update:elapse];
    
    m_animationTimer += 0.0333;
    
    if(m_animationTimer > 7 * attackAnimaionInterval)
    {
        m_animationTimer = 0;
        [self transitStateTo:run];
    }
}
- (void)drawAttack
{
    [m_movieClip_throw Draw];
    [m_movieClip_throw SetPosition:CGPointMake(m_posX, m_posY)];

}
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
    switch(m_currState)
    {
            
        case run:
            [self drawRun];
            break;
            
        case attack:
            [self drawAttack];
            break;
            
        case attacked:
            [self drawAttacked];
            break;
            
        case die:
            [self drawDie];
            break;
            
        default:
            break;
            
    }
    
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

- (void)onContactItem:(MemoryItem*) item
{}

- (double)getPositionX
{
    return m_posX;
    
}
@end
