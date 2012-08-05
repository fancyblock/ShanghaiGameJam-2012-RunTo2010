//
//  TaskStartCutscene.m
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TaskStartCutscene.h"
#import "GlobalWork.h"


@implementation TaskStartCutscene


- (void)onBegin
{
    [[RenderCore sharedInstance] SetBGColorR:0.0f withG:0.0f withB:0.0f];
    
    m_cutscene01 = [[GraphicFactory sharedInstance] CreateSprite:@"cutscences_1.png"];
    [m_cutscene01 SetUVFrom:CGPointMake(0, 0) to:CGPointMake(1, 1)];
    [m_cutscene01 SetSize:CGPointMake(1000, 750)];
    
    m_cutscene02 = [[GraphicFactory sharedInstance] CreateSprite:@"cutscences_2.png"];
    [m_cutscene02 SetUVFrom:CGPointMake(0, 0) to:CGPointMake(1, 1)];
    [m_cutscene02 SetSize:CGPointMake(1000, 750)];
    
    m_cutscene03 = [[GraphicFactory sharedInstance] CreateSprite:@"cutscences_3.png"];
    [m_cutscene03 SetUVFrom:CGPointMake(0, 0) to:CGPointMake(1, 1)];
    [m_cutscene03 SetSize:CGPointMake(1000, 750)];
    
    m_state = 0;
    m_curPic = m_cutscene01;
    m_timer = 0.0f;
    m_alpha = 0.0f;
}

- (void)onEnd
{
    [m_cutscene01 release];
    [m_cutscene02 release];
    [m_cutscene03 release];
}

- (void)onFrame:(float)elapse
{
    m_timer += elapse;
    
    if( m_alpha <= 9.7f )
    {
        m_alpha += 0.1f;
    }
    else 
    {
        m_state++;
        
        if( m_state == 1 )
        {
            m_curPic = m_cutscene02;
        }
        if( m_state == 2 )
        {
            m_curPic = m_cutscene03;
        }
        if( m_state == 3 )
        {
            [self Stop];
            [[GlobalWork sharedInstance]._taskGame Start];
        }
        
        m_alpha = 0.0f;
    }
}

- (void)onDraw:(float)elapse
{
    [m_curPic SetColorR:1.0f andG:1.0f andB:1.0f andAlpha:m_alpha];
    [m_curPic Draw];
}


- (BOOL)onTouchEvent:(NSArray*)events
{
    //TODO 
    
    return NO; 
}

- (void)onDestory{}

@end
