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
    Model* m_leftWall;
    Model* m_rightWall;
    Model* m_ceil;
    Model* m_floor;
}

- (void)Draw;
- (void)SetDistance:(float)distance;

@end
