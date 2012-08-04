//
//  TaskTitle.h
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HIFramework.h"
#import "TimeTunnel.h"

@interface TaskTitle : Task
{
    TimeTunnel* m_tunnel;
    float m_distance;
}


@end
