//
//  MemoryItem.m
//  SGJ2012
//
//  Created by li jin on 12-8-4.
//  Copyright (c) 2012年 2k. All rights reserved.
//

#import "MemoryItem.h"

NSDictionary* typ2Item = NULL;


@implementation MemoryItem

- (id)initWithType:(int)type andStartPosX:(double)posX startPosY:(double)posY
{
    [super init];
    m_type = type;
    m_startPosX = posX;
    m_startPosY = posY;
    m_isAlive = YES;
    m_posX = posX;
    m_posY = posY;
    
    return self;
}

- (id)initWithType:(int)type andStartPosX:(double)posX startPosY:(double)posY startPosZ:(double)posZ
{
    [super init];
    m_type = type;
    
    m_pos3d = malloc(sizeof(Point3d));
    m_pos3d->x = posX;
    m_pos3d->y = posY;
    m_pos3d->z = posZ;
    
    m_isAlive = YES;
    m_posX = posX;
    m_posY = posY;
    
    return self;
}

- (void)setAspect:(double)aspect andFovy:(double)fovy
{
    m_aspect = aspect;
    m_fovy = fovy;
}

- (void)onBegin
{

    m_spite = [[GraphicFactory sharedInstance] CreateSprite:@"item_magic_stick"];
}

- (void)projection
{
   
    m_posX = -m_pos3d->x/(m_aspect * tan(m_fovy/2) * m_pos3d->z);
    m_posY = -m_pos3d->y/(tan(m_fovy/2)* m_pos3d->z);
    
}

- (void)onEnd
{
    free(m_pos3d);
    m_pos3d = NULL;
}

- (void)onDraw
{
    [m_spite DrawAt:CGPointMake(m_posX, m_posY)];
}

- (void)onUpdate:(double)elapse
{
    [self projection];
    
    m_pos3d->z += elapse * 10;
    
    if (m_pos3d->z > 0)
    {
        m_pos3d->z = -100;
    }
}

- (void)onAfterOneCycle
{}


@end
