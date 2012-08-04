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

@interface TaskGame : Task
{
    TimeTunnel* m_tunnel;
    float m_distance;
    
    Player* m_player;
    MemoryItem* m_item;
}

@end
