//
//  TimeTunnel.h
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HIFramework.h"

#define MAX_DISTANCE    60

@interface TimeTunnel : NSObject
{
    Model* m_model;
    
    float m_curDistance;
}

@property (nonatomic, readwrite) float DISTANCE;
@property (nonatomic, readonly) float TRAVEL_PERCENT;

- (void)Draw;

@end
