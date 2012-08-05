//
//  TimeTunnel.h
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HIFramework.h"

@interface TimeTunnel : NSObject
{
    Model* m_model;
    
    float m_curDistance;
    int m_curBGM;
}

@property (nonatomic, readwrite) float DISTANCE;
@property (nonatomic, readonly) float TRAVEL_PERCENT;
@property (nonatomic, readwrite) float MAX_DISTANCE;

- (void)Draw;
- (void)SetTexture:(NSString*)imgName;
- (void)SetToExit;

@end
