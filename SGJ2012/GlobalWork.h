//
//  GlobalWork.h
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../HIFramework/HIFramework.h"

@interface GlobalWork : NSObject

@property (nonatomic, retain)Task* _taskTitle;
@property (nonatomic, retain)Task* _taskStartCutscene;
@property (nonatomic, retain)Task* _taskGame;
@property (nonatomic, retain)Task* _taskEndCutscene;

@property (nonatomic, readwrite) int _bgm01;
@property (nonatomic, readwrite) int _bgm02;
@property (nonatomic, readwrite) int _bgm03;

@property (nonatomic, readwrite) int _seHit;
@property (nonatomic, readwrite) int _seBomb;
@property (nonatomic, readwrite) int _seDie;
@property (nonatomic, readwrite) int _seStep1;
@property (nonatomic, readwrite) int _seStep2;
@property (nonatomic, readwrite) int _seKumahit;
@property (nonatomic, readwrite) int _seEnemyUpgrade;

+ (GlobalWork*)sharedInstance;

@end
