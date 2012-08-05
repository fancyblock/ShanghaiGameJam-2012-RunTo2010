//
//  TaskStartCutscene.h
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HIFramework.h"

@interface TaskStartCutscene : Task
{
    Sprite* m_cutscene01;
    Sprite* m_cutscene02;
    Sprite* m_cutscene03;
    Sprite* m_cutscene04;
    
    Sprite* m_curPic;
    
    int m_state;
    float m_timer;
    float m_alpha;
}

@end
