//
//  MemoryItem.m
//  SGJ2012
//
//  Created by li jin on 12-8-4.
//  Copyright (c) 2012年 2k. All rights reserved.
//

#import "MemoryItem.h"
#import "Player.h"
#include <time.h>

NSDictionary* typ2Item = NULL;

const int width = 155;
const int length = 219;

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
    m_alive = YES;
    
    return self;
}

- (id)initWithType:(int)type andStartPosX:(double)posX startPosY:(double)posY
startPosZ:(double)posZ withSpeed:(double)speed withPlayer:(Player*) player;
{
    [super init];
    m_type = type;
    
    m_pos3d = malloc(sizeof(Point3d));
    m_pos3d->x = posX;
    m_pos3d->y = posY;
    m_pos3d->z = posZ;
    
    m_alive = YES;
    m_posX = posX;
    m_posY = posY;
    m_speed = speed;
    
    m_player = player;
    
    return self;
}

- (void)setAspect:(double)aspect andFovy:(double)fovy
{
    m_aspect = aspect;
    m_fovy = fovy;
}

- (void)onBegin
{

    m_spite = [[GraphicFactory sharedInstance] CreateSprite:@"brown_bear.png"];
    [m_spite SetUVFrom:CGPointMake(0, 0) to:CGPointMake(1, 1)];
    [m_spite SetSize:CGPointMake(155, 219)];
    [m_spite SetAnchor:CGPointMake(0.5, 0.1)];
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
    if( m_pos3d->z < 0 && m_alive)
        [m_spite DrawAt:CGPointMake((m_posX + 0.5) * 1024, 768 - (m_posY + 0.5) * 768)];
}

- (double)canCollide:(double)x1 with:(double)y1 with:(double)z1 with:(double)x2 with:(double)y2 with:(double)z2
{
    double t_distanceSqure = (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1);
    if (sqrt(t_distanceSqure)< 0.2)
        return YES;
    else
        return NO;
}

- (void)onUpdate:(double)elapse
{
    [self projection];
    
    srand(time(NULL));
        
    double absZ = m_pos3d->z;
    
    if (absZ < 0)
        absZ = - absZ;
    
    [m_spite SetSize:CGPointMake(width/absZ, length/absZ)];
    
    m_pos3d->z += elapse * m_speed;
    
    if (m_pos3d->z > 0)
    {
        m_pos3d->z = -20;
    }
    else 
    {
        double t_zDistance = abs(m_pos3d->z);
        
        
        if (t_zDistance < 0.4)
        {
            double playerX = [m_player getPositionX];
            
            // we need a small edge value to test whether item contact player
            if (abs( playerX - (m_posX + 0.5) * 1024) < width * 0.8)
                [m_player onContactItem:self];
        }
    }
    
   
    if (m_bomb != NULL)
    {
        Point3d* t_bombPos3d = [m_bomb getPoint3d];
        if([self canCollide:m_pos3d->x with:m_pos3d->y with:m_pos3d->z with:t_bombPos3d->x with:t_bombPos3d->y with:t_bombPos3d->z])
        {
            //collid with bomb!
            m_alive = NO;
            [m_bomb disable];
        }
    }
    
    if(!m_alive)
    { 
        m_cooldownTimer += 0.0333;
        if (m_cooldownTimer > 3)
        {   
            double r = random()%100;
            double randomX = r/100;
            double negativeFlg = random() % 2;
            
            if (negativeFlg != 0)
            {
                randomX = -randomX;
            }
            m_alive = YES;
            m_pos3d->z = -20;
            m_pos3d->x = randomX;
            m_cooldownTimer = 0;
        
        }
    }
}

- (void)onAfterOneCycle
{}

- (void)setBomb:(Bomb*)bomb
{
    m_bomb = bomb;
}
- (void)disable
{
    m_alive = NO;
}
@end
