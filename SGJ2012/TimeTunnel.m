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

#define TUNNEL_DEFAULT_LEN  25


#import "TimeTunnel.h"


@interface TimeTunnel(private)

- (void)createModel;
- (void)createBox:(float)width andHeight:(float)height andLenght:(float)length;
- (void)setInitUV;
- (void)setFarAlpha:(float)alpha;
- (void)setUOffset:(float)offset;

@end

@implementation TimeTunnel

@synthesize MAX_DISTANCE;


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
 * @desc    deconstructor
 * @para    none
 * @return  none
 */
- (void)dealloc
{
    [m_model release];
    
    [super dealloc];
}


/**
 * @desc    render
 * @para    none
 * @return  none
 */
- (void)Draw
{
    [m_model Draw];
}


/**
 * @desc    getter & setter of the distance
 */
- (void)setDISTANCE:(float)distance
{
    float val = distance;
    
    if( val > MAX_DISTANCE )
    {
        val = MAX_DISTANCE;
    }
    
    m_curDistance = val;
    
    [self setUOffset:val];
    
    // close to the exit
    float percent = self.TRAVEL_PERCENT;
    if( percent > 0.9f )
    {
        [self createBox:20 andHeight:15 andLenght:TUNNEL_DEFAULT_LEN*((1.0f-percent)/0.1f)];
    }
    
}

- (float)DISTANCE
{
    return m_curDistance;
}


/**
 * @desc    return the percent of the travel
 */
- (float)TRAVEL_PERCENT
{
    return m_curDistance/self.MAX_DISTANCE;
}


/**
 * @desc    set to the exit
 * @para    none
 * @return  none
 */
- (void)SetToExit
{
    m_curDistance = 0.9f * MAX_DISTANCE;
}


/**
 * @desc    set texture
 * @para    imgName
 * @return  none
 */
- (void)SetTexture:(NSString*)imgName
{
    if( [[RenderCore sharedInstance] IsTextureExist:imgName] == NO )
    {
        [[RenderCore sharedInstance] CreateTexture:imgName];
    }
    
    TextureInfo* texInfo = [[RenderCore sharedInstance] GetTextureInfo:imgName];
    m_model.TEXTURE_INDEX = texInfo.INDEX;
    m_model.TEXTURE_NAME = imgName;
}


//--------------------------- private functions ---------------------------


// create model
- (void)createModel
{
    m_model = [[GraphicFactory sharedInstance] CreateModel:@"timetunnel.png" withVertexCount:24];
    
    [self createBox:20 andHeight:15 andLenght:TUNNEL_DEFAULT_LEN];
    [self setInitUV];
    [self setFarAlpha:0.1f];
    [self setUOffset:0];
}


// create tunnel box
- (void)createBox:(float)width andHeight:(float)height andLenght:(float)length
{
    float halfWid = width / 2.0f;
    float halfHei = height / 2.0f;
    
    // left wall
    m_model.VERTEX_BUFFER[0] = -halfWid;
    m_model.VERTEX_BUFFER[1] = halfHei;
    m_model.VERTEX_BUFFER[2] = 0;
    
    m_model.VERTEX_BUFFER[3] = -halfWid;     
    m_model.VERTEX_BUFFER[4] = -halfHei;    
    m_model.VERTEX_BUFFER[5] = 0;
    
    m_model.VERTEX_BUFFER[6] = -halfWid;        
    m_model.VERTEX_BUFFER[7] = -halfHei;    
    m_model.VERTEX_BUFFER[8] = -length;
    
    m_model.VERTEX_BUFFER[9] = -halfWid;    
    m_model.VERTEX_BUFFER[10] = halfHei;    
    m_model.VERTEX_BUFFER[11] = 0;
    
    m_model.VERTEX_BUFFER[12] = -halfWid;   
    m_model.VERTEX_BUFFER[13] = -halfHei;   
    m_model.VERTEX_BUFFER[14] = -length;
    
    m_model.VERTEX_BUFFER[15] = -halfWid;      
    m_model.VERTEX_BUFFER[16] = halfHei;    
    m_model.VERTEX_BUFFER[17] = -length;
    
    // top wall
    m_model.VERTEX_BUFFER[18] = halfWid;   
    m_model.VERTEX_BUFFER[19] = halfHei;     
    m_model.VERTEX_BUFFER[20] = 0;           
    
    m_model.VERTEX_BUFFER[21] = -halfWid;    
    m_model.VERTEX_BUFFER[22] = halfHei;    
    m_model.VERTEX_BUFFER[23] = 0;
    
    m_model.VERTEX_BUFFER[24] = -halfWid;  
    m_model.VERTEX_BUFFER[25] = halfHei;   
    m_model.VERTEX_BUFFER[26] = -length;
    
    m_model.VERTEX_BUFFER[27] = halfWid;  
    m_model.VERTEX_BUFFER[28] = halfHei;   
    m_model.VERTEX_BUFFER[29] = 0;
    
    m_model.VERTEX_BUFFER[30] = -halfWid; 
    m_model.VERTEX_BUFFER[31] = halfHei; 
    m_model.VERTEX_BUFFER[32] = -length;
    
    m_model.VERTEX_BUFFER[33] = halfWid;  
    m_model.VERTEX_BUFFER[34] = halfHei; 
    m_model.VERTEX_BUFFER[35] = -length;
    
    // right wall
    m_model.VERTEX_BUFFER[36] = halfWid; 
    m_model.VERTEX_BUFFER[37] = -halfHei;  
    m_model.VERTEX_BUFFER[38] = 0;           
    
    m_model.VERTEX_BUFFER[39] = halfWid; 
    m_model.VERTEX_BUFFER[40] = halfHei;  
    m_model.VERTEX_BUFFER[41] = 0;
    
    m_model.VERTEX_BUFFER[42] = halfWid;   
    m_model.VERTEX_BUFFER[43] = halfHei;  
    m_model.VERTEX_BUFFER[44] = -length;
    
    m_model.VERTEX_BUFFER[45] = halfWid;  
    m_model.VERTEX_BUFFER[46] = -halfHei;
    m_model.VERTEX_BUFFER[47] = 0;
    
    m_model.VERTEX_BUFFER[48] = halfWid;
    m_model.VERTEX_BUFFER[49] = halfHei;
    m_model.VERTEX_BUFFER[50] = -length;
    
    m_model.VERTEX_BUFFER[51] = halfWid;  
    m_model.VERTEX_BUFFER[52] = -halfHei;  
    m_model.VERTEX_BUFFER[53] = -length;
    
    // floor
    m_model.VERTEX_BUFFER[54] = -halfWid;  
    m_model.VERTEX_BUFFER[55] = -halfHei;  
    m_model.VERTEX_BUFFER[56] = 0;
    
    m_model.VERTEX_BUFFER[57] = halfWid; 
    m_model.VERTEX_BUFFER[58] = -halfHei; 
    m_model.VERTEX_BUFFER[59] = 0;
    
    m_model.VERTEX_BUFFER[60] = halfWid; 
    m_model.VERTEX_BUFFER[61] = -halfHei;  
    m_model.VERTEX_BUFFER[62] = -length;
    
    m_model.VERTEX_BUFFER[63] = -halfWid;  
    m_model.VERTEX_BUFFER[64] = -halfHei; 
    m_model.VERTEX_BUFFER[65] = 0;
    
    m_model.VERTEX_BUFFER[66] = halfWid;  
    m_model.VERTEX_BUFFER[67] = -halfHei; 
    m_model.VERTEX_BUFFER[68] = -length;
    
    m_model.VERTEX_BUFFER[69] = -halfWid;  
    m_model.VERTEX_BUFFER[70] = -halfHei;
    m_model.VERTEX_BUFFER[71] = -length;
}


// set the init uv
- (void)setInitUV
{
    m_model.UV_BUFFER[1] = 0.0f;
    m_model.UV_BUFFER[3] = 0.25f;
    m_model.UV_BUFFER[5] = 0.25f;
    m_model.UV_BUFFER[7] = 0.0f;
    m_model.UV_BUFFER[9] = 0.25f;
    m_model.UV_BUFFER[11] = 0.0f;
    
    m_model.UV_BUFFER[13] = 0.25f;
    m_model.UV_BUFFER[15] = 0.5f;
    m_model.UV_BUFFER[17] = 0.5f;
    m_model.UV_BUFFER[19] = 0.25f;
    m_model.UV_BUFFER[21] = 0.5f;
    m_model.UV_BUFFER[23] = 0.25f;
    
    m_model.UV_BUFFER[25] = 0.5f;
    m_model.UV_BUFFER[27] = 0.75f;
    m_model.UV_BUFFER[29] = 0.75f;
    m_model.UV_BUFFER[31] = 0.5f;
    m_model.UV_BUFFER[33] = 0.75f;
    m_model.UV_BUFFER[35] = 0.5f;
    
    m_model.UV_BUFFER[37] = 0.75f;
    m_model.UV_BUFFER[39] = 1.0f;
    m_model.UV_BUFFER[41] = 1.0f;
    m_model.UV_BUFFER[43] = 0.75f;
    m_model.UV_BUFFER[45] = 1.0f;
    m_model.UV_BUFFER[47] = 0.75f;
}


// set far alpha
- (void)setFarAlpha:(float)alpha
{
    m_model.COLOR_BUFFER[11] = alpha;
    m_model.COLOR_BUFFER[19] = alpha;
    m_model.COLOR_BUFFER[23] = alpha;
    
    m_model.COLOR_BUFFER[35] = alpha;
    m_model.COLOR_BUFFER[43] = alpha;
    m_model.COLOR_BUFFER[47] = alpha;
    
    m_model.COLOR_BUFFER[59] = alpha;
    m_model.COLOR_BUFFER[67] = alpha;
    m_model.COLOR_BUFFER[71] = alpha;
    
    m_model.COLOR_BUFFER[83] = alpha;
    m_model.COLOR_BUFFER[91] = alpha;
    m_model.COLOR_BUFFER[95] = alpha;

}


// set u offset
- (void)setUOffset:(float)offset
{
    m_model.UV_BUFFER[0] = 0.0f + offset;
    m_model.UV_BUFFER[2] = 0.0f + offset;
    m_model.UV_BUFFER[4] = 1.0f + offset;
    m_model.UV_BUFFER[6] = 0.0f + offset;
    m_model.UV_BUFFER[8] = 1.0f + offset;
    m_model.UV_BUFFER[10] = 1.0f + offset;
    
    m_model.UV_BUFFER[12] = 0.0f + offset;
    m_model.UV_BUFFER[14] = 0.0f + offset;
    m_model.UV_BUFFER[16] = 1.0f + offset;
    m_model.UV_BUFFER[18] = 0.0f + offset;
    m_model.UV_BUFFER[20] = 1.0f + offset;
    m_model.UV_BUFFER[22] = 1.0f + offset;
    
    m_model.UV_BUFFER[24] = 0.0f + offset;
    m_model.UV_BUFFER[26] = 0.0f + offset;
    m_model.UV_BUFFER[28] = 1.0f + offset;
    m_model.UV_BUFFER[30] = 0.0f + offset;
    m_model.UV_BUFFER[32] = 1.0f + offset;
    m_model.UV_BUFFER[34] = 1.0f + offset;
    
    m_model.UV_BUFFER[36] = 0.0f + offset;
    m_model.UV_BUFFER[38] = 0.0f + offset;
    m_model.UV_BUFFER[40] = 1.0f + offset;
    m_model.UV_BUFFER[42] = 0.0f + offset;
    m_model.UV_BUFFER[44] = 1.0f + offset;
    m_model.UV_BUFFER[46] = 1.0f + offset;
}


@end
