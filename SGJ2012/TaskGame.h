//
//  TaskGame.h
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Task.h"
#import "HIFramework.h"
#import "Player.h"
#import "TimeTunnel.h"
#import "MemoryItem.h"

//#import "Bomb.h"
@class  Bomb;

#import <CoreMotion/CoreMotion.h>

#define STAGE1BGM @"BGM1.mp3"
#define STAGE2BGM @"BGM2.mp3"
#define STAGE3BGM @"BGM3.mp3"

#define STAGE1CYCLETIME 10
#define STAGE2CYCLETIME 20
#define STAGE3CYCLETIME 30

#define STAGE1 0
#define STAGE2 1
#define STAGE3 2

static NSArray*  backgroundPictures;

const static int stage1ItemCount = 2;
NSArray*  itemInStage1;
int  stage1ItemsTriggerTime[stage1ItemCount];

const static int stage2ItemCount = 2;
NSArray*  itemInStage2;
int  stage2ItemsTriggerTime[stage2ItemCount];

const static int stage3ItemCount = 2;
NSArray*  itemInStage3;
int  stage3ItemsTriggerTime[stage3ItemCount];


@interface TaskGame : Task
{
    int m_currStage;
    
    TimeTunnel* m_tunnel;
    float m_distance;
    
    
    Player* m_player;
    
    MemoryItem* m_item;

    
    Bomb* m_bomb;

    
    CMMotionManager* m_motionMgr;
    
    NSMutableArray* m_currItemArray;
    
    double m_timer;
    
    float m_delayTimer;
    BOOL m_stopMoving;
    BOOL m_setout;

}

- (void)nextStage;

- (void)removeItem:(MemoryItem*)item;

- (void) onbeginStage1;
- (void) onEndStage1;
- (void) onFrameStage1:(float)elapse;
- (void) onDrawStage1:(float)elapse;
- (void) handleEventStage1:(NSArray*) events;

- (void) onbeginStage2;
- (void) onEndStage2;
- (void) onFrameStage2:(float)elapse;
- (void) onDrawStage2:(float)elapse;
- (void) handleEventStage2:(NSArray*) events;


- (void) onbeginStage3;
- (void) onEndStage3;
- (void) onFrameStage3:(float)elapse;
- (void) onDrawStage3:(float)elapse;
- (void) handleEventStage3:(NSArray*) events;


@end
