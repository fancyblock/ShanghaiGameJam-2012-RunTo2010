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
