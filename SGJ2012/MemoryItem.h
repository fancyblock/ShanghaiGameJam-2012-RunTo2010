//
//  MemoryItem.h
//  SGJ2012
//
//  Created by li jin on 12-8-4.
//  Copyright (c) 2012年 2k. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HIFramework.h"
#include "Point3d.h"

@class Player;
@class Bomb;

#define ITEM_CELLPHONE @"item_cellphone.png"
#define ITEM_DIAMOND_RING @"item_diamond_ring.png"
#define ITEM_MAGIC_STICK @"item_magic_stick.png"




@interface MemoryItem : NSObject
{
    Sprite* m_spite;
    double m_posX, m_posY;
    double m_startPosX, m_startPosY;
    Point3d* m_pos3d;
    
    int m_type;
    int m_cycleCount;
    BOOL m_isAlive;
    
    double m_speed;
    
    // for projection
    double m_aspect;
    double m_fovy;
    
    Player* m_player;
    Bomb* m_bomb;
    BOOL m_alive;
    
    double m_cooldownTimer;
}

- (id)initWithType:(int)type andStartPosX: (double)posX startPosY:(double)posY;

- (id)initWithType:(int)type andStartPosX:(double)posX startPosY:(double)posY
         startPosZ:(double)posZ withSpeed:(double)speed withPlayer:(Player*)player;

- (void)setAspect:(double) aspect andFovy:(double)fovy;

- (void)onBegin;

- (void)onDraw;

- (void)onUpdate:(double)elapse;

- (void)onEnd;

- (void)onAfterOneCycle;

- (void)projection;

- (void)setBomb:(Bomb*)bomb;

- (void)disable;

- (double)canCollide:(double)x1 with:(double)y1 with:(double)z1 with:(double)x2 with:(double)y2 with:(double)z2;

@end
