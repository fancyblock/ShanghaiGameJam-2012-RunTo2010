//
//  TimeTunnel.m
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#define WALL0_UN    0.0f
#define WALL0_UF    1.0f

#define WALL1_UN    0.0f
#define WALL1_UF    1.0f

#define WALL2_UN    0.0f
#define WALL2_UF    1.0f

#define FLOOR_UN    0.0f
#define FLOOR_UF    1.0f


#import "TimeTunnel.h"

@interface TimeTunnel(private)

- (void)createModel;
- (void)createBox:(float)width andHeight:(float)height andLenght:(float)length;
- (void)setFarAlpha:(float)alpha;
- (void)setUOffset:(float)offset;

@end

@implementation TimeTunnel



/**
 * @desc    constructor
 * @para    none
 * @return  none
 */
- (id)init
{
    [super init];
    
    [self createModel];
    
    return self;
}


/**
 * @desc    render
 * @para    none
 * @return  none
 */
- (void)Draw
{
    [m_leftWall Draw];
    [m_rightWall Draw];
    [m_ceil Draw];
    [m_floor Draw];
}


/**
 * @desc    set the distance
 * @para    distance
 * @return  none
 */
- (void)SetDistance:(float)distance
{    
    [self setUOffset:distance];
}


//--------------------------- private functions ---------------------------


// create model
- (void)createModel
{
    m_leftWall = [[GraphicFactory sharedInstance] CreateModel:@"wall01.png" withVertexCount:6];
    m_rightWall = [[GraphicFactory sharedInstance] CreateModel:@"wall02.png" withVertexCount:6];
    m_ceil = [[GraphicFactory sharedInstance] CreateModel:@"wall03.png" withVertexCount:6];
    m_floor = [[GraphicFactory sharedInstance] CreateModel:@"floor.png" withVertexCount:6];
    
    [self createBox:20 andHeight:15 andLenght:10];
    [self setFarAlpha:0.1f];
    [self setUOffset:0];
}


// create tunnel box
- (void)createBox:(float)width andHeight:(float)height andLenght:(float)length
{
    float halfWid = width / 2.0f;
    float halfHei = height / 2.0f;
    
    // left wall
    m_leftWall.VERTEX_BUFFER[0] = -halfWid;
    m_leftWall.VERTEX_BUFFER[1] = halfHei;
    m_leftWall.VERTEX_BUFFER[2] = 0;
    
    m_leftWall.VERTEX_BUFFER[3] = -halfWid;     
    m_leftWall.VERTEX_BUFFER[4] = -halfHei;    
    m_leftWall.VERTEX_BUFFER[5] = 0;
    
    m_leftWall.VERTEX_BUFFER[6] = -halfWid;        
    m_leftWall.VERTEX_BUFFER[7] = -halfHei;    
    m_leftWall.VERTEX_BUFFER[8] = -length;
    
    m_leftWall.VERTEX_BUFFER[9] = -halfWid;    
    m_leftWall.VERTEX_BUFFER[10] = halfHei;    
    m_leftWall.VERTEX_BUFFER[11] = 0;
    
    m_leftWall.VERTEX_BUFFER[12] = -halfWid;   
    m_leftWall.VERTEX_BUFFER[13] = -halfHei;   
    m_leftWall.VERTEX_BUFFER[14] = -length;
    
    m_leftWall.VERTEX_BUFFER[15] = -halfWid;      
    m_leftWall.VERTEX_BUFFER[16] = halfHei;    
    m_leftWall.VERTEX_BUFFER[17] = -length;
    
    // top wall
    m_ceil.VERTEX_BUFFER[0] = halfWid;   
    m_ceil.VERTEX_BUFFER[1] = halfHei;     
    m_ceil.VERTEX_BUFFER[2] = 0;           
    
    m_ceil.VERTEX_BUFFER[3] = -halfWid;    
    m_ceil.VERTEX_BUFFER[4] = halfHei;    
    m_ceil.VERTEX_BUFFER[5] = 0;
    
    m_ceil.VERTEX_BUFFER[6] = -halfWid;  
    m_ceil.VERTEX_BUFFER[7] = halfHei;   
    m_ceil.VERTEX_BUFFER[8] = -length;
    
    m_ceil.VERTEX_BUFFER[9] = halfWid;  
    m_ceil.VERTEX_BUFFER[10] = halfHei;   
    m_ceil.VERTEX_BUFFER[11] = 0;
    
    m_ceil.VERTEX_BUFFER[12] = -halfWid; 
    m_ceil.VERTEX_BUFFER[13] = halfHei; 
    m_ceil.VERTEX_BUFFER[14] = -length;
    
    m_ceil.VERTEX_BUFFER[15] = halfWid;  
    m_ceil.VERTEX_BUFFER[16] = halfHei; 
    m_ceil.VERTEX_BUFFER[17] = -length;
    
    // right wall
    m_rightWall.VERTEX_BUFFER[0] = halfWid; 
    m_rightWall.VERTEX_BUFFER[1] = -halfHei;  
    m_rightWall.VERTEX_BUFFER[2] = 0;           
    
    m_rightWall.VERTEX_BUFFER[3] = halfWid; 
    m_rightWall.VERTEX_BUFFER[4] = halfHei;  
    m_rightWall.VERTEX_BUFFER[5] = 0;
    
    m_rightWall.VERTEX_BUFFER[6] = halfWid;   
    m_rightWall.VERTEX_BUFFER[7] = halfHei;  
    m_rightWall.VERTEX_BUFFER[8] = -length;
    
    m_rightWall.VERTEX_BUFFER[9] = halfWid;  
    m_rightWall.VERTEX_BUFFER[10] = -halfHei;
    m_rightWall.VERTEX_BUFFER[11] = 0;
    
    m_rightWall.VERTEX_BUFFER[12] = halfWid;
    m_rightWall.VERTEX_BUFFER[13] = halfHei;
    m_rightWall.VERTEX_BUFFER[14] = -length;
    
    m_rightWall.VERTEX_BUFFER[15] = halfWid;  
    m_rightWall.VERTEX_BUFFER[16] = -halfHei;  
    m_rightWall.VERTEX_BUFFER[17] = -length;
    
    // floor
    m_floor.VERTEX_BUFFER[0] = -halfWid;  
    m_floor.VERTEX_BUFFER[1] = -halfHei;  
    m_floor.VERTEX_BUFFER[2] = 0;
    
    m_floor.VERTEX_BUFFER[3] = halfWid; 
    m_floor.VERTEX_BUFFER[4] = -halfHei; 
    m_floor.VERTEX_BUFFER[5] = 0;
    
    m_floor.VERTEX_BUFFER[6] = halfWid; 
    m_floor.VERTEX_BUFFER[7] = -halfHei;  
    m_floor.VERTEX_BUFFER[8] = -length;
    
    m_floor.VERTEX_BUFFER[9] = -halfWid;  
    m_floor.VERTEX_BUFFER[10] = -halfHei; 
    m_floor.VERTEX_BUFFER[11] = 0;
    
    m_floor.VERTEX_BUFFER[12] = halfWid;  
    m_floor.VERTEX_BUFFER[13] = -halfHei; 
    m_floor.VERTEX_BUFFER[14] = -length;
    
    m_floor.VERTEX_BUFFER[15] = -halfWid;  
    m_floor.VERTEX_BUFFER[16] = -halfHei;
    m_floor.VERTEX_BUFFER[17] = -length;
    
    m_leftWall.UV_BUFFER[1] = 0.0f;
    m_leftWall.UV_BUFFER[3] = 1.0f;
    m_leftWall.UV_BUFFER[5] = 1.0f;
    m_leftWall.UV_BUFFER[7] = 0.0f;
    m_leftWall.UV_BUFFER[9] = 1.0f;
    m_leftWall.UV_BUFFER[11] = 0.0f;
    
    m_ceil.UV_BUFFER[1] = 0.0f;
    m_ceil.UV_BUFFER[3] = 1.0f;
    m_ceil.UV_BUFFER[5] = 1.0f;
    m_ceil.UV_BUFFER[7] = 0.0f;
    m_ceil.UV_BUFFER[9] = 1.0f;
    m_ceil.UV_BUFFER[11] = 0.0f;
    
    m_rightWall.UV_BUFFER[1] = 0.0f;
    m_rightWall.UV_BUFFER[3] = 1.0f;
    m_rightWall.UV_BUFFER[5] = 1.0f;
    m_rightWall.UV_BUFFER[7] = 0.0f;
    m_rightWall.UV_BUFFER[9] = 1.0f;
    m_rightWall.UV_BUFFER[11] = 0.0f;
    
    m_floor.UV_BUFFER[1] = 0.0f;
    m_floor.UV_BUFFER[3] = 1.0f;
    m_floor.UV_BUFFER[5] = 1.0f;
    m_floor.UV_BUFFER[7] = 0.0f;
    m_floor.UV_BUFFER[9] = 1.0f;
    m_floor.UV_BUFFER[11] = 0.0f;
    
}


// set far alpha
- (void)setFarAlpha:(float)alpha
{
    m_leftWall.COLOR_BUFFER[11] = alpha;
    m_leftWall.COLOR_BUFFER[19] = alpha;
    m_leftWall.COLOR_BUFFER[23] = alpha;
    
    m_ceil.COLOR_BUFFER[11] = alpha;
    m_ceil.COLOR_BUFFER[19] = alpha;
    m_ceil.COLOR_BUFFER[23] = alpha;
    
    m_rightWall.COLOR_BUFFER[11] = alpha;
    m_rightWall.COLOR_BUFFER[19] = alpha;
    m_rightWall.COLOR_BUFFER[23] = alpha;
    
    m_floor.COLOR_BUFFER[11] = alpha;
    m_floor.COLOR_BUFFER[19] = alpha;
    m_floor.COLOR_BUFFER[23] = alpha;

}


// set u offset
- (void)setUOffset:(float)offset
{
    m_leftWall.UV_BUFFER[0] = 0.0f + offset;
    m_leftWall.UV_BUFFER[2] = 0.0f + offset;
    m_leftWall.UV_BUFFER[4] = 1.0f + offset;
    m_leftWall.UV_BUFFER[6] = 0.0f + offset;
    m_leftWall.UV_BUFFER[8] = 1.0f + offset;
    m_leftWall.UV_BUFFER[10] = 1.0f + offset;
    
    m_ceil.UV_BUFFER[0] = 0.0f + offset;
    m_ceil.UV_BUFFER[2] = 0.0f + offset;
    m_ceil.UV_BUFFER[4] = 1.0f + offset;
    m_ceil.UV_BUFFER[6] = 0.0f + offset;
    m_ceil.UV_BUFFER[8] = 1.0f + offset;
    m_ceil.UV_BUFFER[10] = 1.0f + offset;
    
    m_rightWall.UV_BUFFER[0] = 0.0f + offset;
    m_rightWall.UV_BUFFER[2] = 0.0f + offset;
    m_rightWall.UV_BUFFER[4] = 1.0f + offset;
    m_rightWall.UV_BUFFER[6] = 0.0f + offset;
    m_rightWall.UV_BUFFER[8] = 1.0f + offset;
    m_rightWall.UV_BUFFER[10] = 1.0f + offset;
    
    m_floor.UV_BUFFER[0] = 0.0f + offset;
    m_floor.UV_BUFFER[2] = 0.0f + offset;
    m_floor.UV_BUFFER[4] = 1.0f + offset;
    m_floor.UV_BUFFER[6] = 0.0f + offset;
    m_floor.UV_BUFFER[8] = 1.0f + offset;
    m_floor.UV_BUFFER[10] = 1.0f + offset;
}


@end
