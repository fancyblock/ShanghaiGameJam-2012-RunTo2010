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

@property (nonatomic, retain)Task* _taskGame;

+ (GlobalWork*)sharedInstance;

@end
