//
//  Player.h
//  SGJ2012
//
//  Created by li jin on 12-8-4.
//  Copyright (c) 2012年 2k. All rights reserved.
//

#import "Task.h"
#import "HIFramework.h"

#define invalid 0
#define run 1
#define attack 2
#define attacked  3
#define die 4

@interface Player : NSObject
{
    int m_currState;
    Sprite* m_PlayerSprite;
    double m_posX;
    double m_posY;
}

- (id) initWith:(double)posX andY:(double)posY;

- (void) transitStateTo:(const int)nextState;

- (void) beginInvalid;
- (void) endInvalid;
- (void) updateInvalid:(double)elapse;
- (void) handleEventInvalid:(NSArray*)events;

- (void) beginRun;
- (void) endRun;
- (void) updateRun:(double) elapse;
- (void) drawRun;
- (void) handleEventRun:(NSArray*)events;

- (void) beginAttack;
- (void) endAttack;
- (void) updateAttack:(double) elapse;
- (void) drawAttack;
- (void) handleEventAttack:(NSArray*)events;

- (void) beginAttacked;
- (void) endAttacked;
- (void) updateAttacked:(double) elapse;
- (void) drawAttacked;
- (void) handleEventAttacked:(NSArray*)events;

- (void) beginDie;
- (void) endDie;
- (void) updateDie:(double) elapse;
- (void) drawDie;
- (void) handleEventDie:(NSArray*)events;

- (void) onBegin;
- (void) onEnd;
- (void) onDraw:(double)elapse;
- (void) onFrame:(double)elapse;
- (BOOL) onTouchEvent:(NSArray*)events;
- (void) onDestroy;

@end
