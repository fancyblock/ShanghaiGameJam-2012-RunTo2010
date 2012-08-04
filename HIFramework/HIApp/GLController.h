//
//  GLController.h
//  HIFramework
//
//  Created by He JiaBin on 12-6-30.
//  Copyright (c) 2012年 FancyBlockGames. All rights reserved.
//

#import <GLKit/GLKit.h>

@interface GLController : GLKViewController
{
    UIInterfaceOrientation m_curOrientation;
}

@property (nonatomic, readwrite) UIInterfaceOrientation CUR_ORIENTATION_SIDE1;
@property (nonatomic, readwrite) UIInterfaceOrientation CUR_ORIENTATION_SIDE2;

@property (nonatomic, readonly) UIInterfaceOrientation CURRENT_ORIENTATION;

@end
