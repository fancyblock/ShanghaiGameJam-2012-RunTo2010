//
//  Bomb.m
//  SGJ2012
//
//  Created by li jin on 12-8-4.
//  Copyright (c) 2012年 2k. All rights reserved.
//

#import "Bomb.h"
#import "HIFramework.h"

static const int width = 152;
static const int length = 163;


@implementation Bomb



- (id)initWithPosX:(double)posX andPosY:(double)posY andPosZ:(double)posZ setAlive:(BOOL)isAlive
{
    [super init];
    m_pos3d = malloc(sizeof(Point3d));
    m_pos3d->x = posX;
    m_pos3d->y = posY;
    m_pos3d->z = posZ;
    m_alive = isAlive;

    m_pinZ = posZ;
    return self;
}

- (void)onCreate;
{
    m_sprite = [[GraphicFactory sharedInstance] CreateSprite:@"item_sparklers.png"];
    [m_sprite SetUVFrom:CGPointMake(0, 0) to:CGPointMake(1, 1)];
    [m_sprite SetSize:CGPointMake(width, length)];
}

- (void)setAspect:(double)aspect andFov:(double) fov
{
    m_aspect = aspect;
    m_fovy = fov;
}

- (void)onFrame:(double)elapse
{
    [self projection];
    
    
    if (m_alive)
    {
        m_pos3d->z = m_pos3d->z - m_speed * elapse;
        
        double absZ = m_pos3d->z;
        
        if (absZ < 0)
            absZ = - absZ;
        
        [m_sprite SetSize:CGPointMake(width/absZ, length/absZ)];
        
        
        if(m_pos3d->z < -30)
        {
            [self disable];
        }
    }
}

- (void)launch:(double)speed withX:(double)posX
{
   if (! m_alive)
   {
       m_alive = YES;
       m_speed = speed;
       double xRatio = (posX - 512)/512;
       m_pos3d->x = xRatio;
   }
}

- (void)disable
{
    m_alive = NO;
    m_pos3d->z = m_pinZ;
}

- (void)projection
{
    
    m_posX = -m_pos3d->x/(m_aspect * tan(m_fovy/2) * m_pos3d->z);
    m_posY = -m_pos3d->y/(tan(m_fovy/2)* m_pos3d->z);
    
}

- (void)onDraw
{
    if (m_alive)
     [m_sprite DrawAt:CGPointMake((m_posX + 0.5) * 1024, 768 - (m_posY + 0.5) * 768)];
}

- (void)onDestroy
{
    free(m_pos3d);
    m_pos3d = NULL;
}

- (Point3d*)getPoint3d
{
    return m_pos3d;
}
@end
