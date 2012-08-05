//
//  GlobalWork.m
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GlobalWork.h"

@implementation GlobalWork

static GlobalWork* m_instance = nil;

@synthesize _taskGame;
@synthesize _taskTitle;
@synthesize _taskEndCutscene;
@synthesize _taskStartCutscene;

@synthesize _bgm01;
@synthesize _bgm02;
@synthesize _bgm03;
@synthesize _seHit;

@synthesize _seDie;
@synthesize _seBomb;
@synthesize _seStep1;
@synthesize _seStep2;
@synthesize _seKumahit;
@synthesize _seEnemyUpgrade;


/**
 * @desc    return the singleton
 * @para    none
 * @return  none
 */
+ (GlobalWork*)sharedInstance
{
    if( m_instance == nil )
    {
        m_instance = [[GlobalWork alloc] init];
    }
    
    return m_instance;
}

@end
