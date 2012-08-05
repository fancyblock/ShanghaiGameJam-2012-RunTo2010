//
//  Bomb.h
//  SGJ2012
//
//  Created by li jin on 12-8-4.
//  Copyright (c) 2012年 2k. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HIFramework.h"
#include "Point3d.h"

@interface Bomb : NSObject
{
    Sprite* m_sprite;
    Point3d* m_pos3d;
    double m_posX;
    double m_posY;
    
    BOOL m_alive;
    double m_aspect;
    double m_fovy;
    double m_speed;
    
    double m_pinZ;
    
}

- (id)initWithPosX:(double)posX andPosY:(double)posY andPosZ:(double)posZ setAlive:(BOOL)isAlive;

- (void)setAspect:(double)aspect andFov:(double) fov;

- (void)onCreate;

- (void)onFrame:(double)elapse;

- (void)launch:(double)speed withX:(double)posX;

- (void)onDestroy;

- (void)disable;

- (void)projection;

- (void)onDraw;

- (Point3d*)getPoint3d;

- (BOOL)isAlive;
@end
