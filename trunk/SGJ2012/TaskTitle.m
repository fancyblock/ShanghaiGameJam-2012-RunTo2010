//
//  TaskTitle.m
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TaskTitle.h"
#import "GlobalWork.h"

@implementation TaskTitle


- (void)onBegin
{
    m_bg = [[GraphicFactory sharedInstance] CreateSprite:@"menu01.png"];
    [m_bg SetUVFrom:CGPointMake(0, 0) to:CGPointMake(1.0f, 0.75f)];
    [m_bg SetSize:CGPointMake(1024, 768)];
    
    m_btnStart = [[GUIButton alloc] initWithRes:@"menu01.png"];
    [m_btnStart SetCallback:self];
    [m_btnStart SetUpUVFrom:CGPointMake(0.0, 0.755f) to:CGPointMake( 0.5f, 0.995f)];
    [m_btnStart SetDownUVFrom:CGPointMake(0.5f, 0.755f) to:CGPointMake(0.995f, 0.995f)];
    [m_btnStart SetDisableUVFrom:CGPointMake(0.5f, 0.755f) to:CGPointMake(0.995f, 0.995f)];
    [m_btnStart SetRegion:CGRectMake(20, 390, 512, 256)];
    
    [[UIManager sharedInstance] AddToRoot:m_btnStart];
    
    // init the sound
    [GlobalWork sharedInstance]._bgm01 = [[SoundManager sharedInstance] LoadSound:@"BGM1.mp3"];
    [GlobalWork sharedInstance]._bgm02 = [[SoundManager sharedInstance] LoadSound:@"BGM2.mp3"];
    [GlobalWork sharedInstance]._bgm03 = [[SoundManager sharedInstance] LoadSound:@"BGM3.mp3"];
    [GlobalWork sharedInstance]._seHit = [[SoundManager sharedInstance] LoadSound:@"hit.wav"];
    
}


- (void)onEnd
{
    [m_bg release];
    
    [m_btnStart SetParent:nil];
    [m_btnStart release];
}


- (void)onFrame:(float)elapse
{
    //TODO
}


- (void)onDraw:(float)elapse
{
    [m_bg DrawAt:CGPointMake(0, 0)];
}


- (BOOL)onTouchEvent:(NSArray*)events
{ 
    return NO;
}


- (void)onDestory
{
    //TODO
}


- (void)onButtonClick:(GUIButton*)btn
{
    if( btn == m_btnStart )
    {
        [self Stop];
        [[GlobalWork sharedInstance]._taskGame Start];
    }
}

- (void)onButtonDown:(GUIButton*)btn{};

- (void)onButtonUp:(GUIButton*)btn{};


@end
