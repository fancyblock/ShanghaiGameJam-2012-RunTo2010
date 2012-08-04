//
//  Model.m
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Model.h"
#import "RenderCore.h"


@implementation Model

@synthesize TEXTURE_INDEX;
@synthesize TEXTURE_NAME;

@synthesize VERTEX_BUFFER = m_vertexBuffer;
@synthesize UV_BUFFER = m_textCoordBuffer;
@synthesize COLOR_BUFFER = m_colorBuffer;
@synthesize NORMAL_BUFFER = m_normalBuffer;


/**
 * @desc    init with size
 * @para    vertex number
 * @return  none
 */
- (id)initWithVertexNum:(int)num
{
    [super init];
    
    // create the buffer
    m_vertexBuffer = (GLfloat*)malloc( num * COORD_PER_VERTEX * sizeof(GLfloat) );
    m_indexBuffer = (GLushort*)malloc( num * sizeof(GLushort) );
    m_textCoordBuffer = (GLfloat*)malloc( num * COORD_PER_UV * sizeof(GLfloat) );
    m_colorBuffer = (GLfloat*)malloc( num * COORD_PER_COLOR * sizeof(GLfloat) );
    m_normalBuffer = (GLfloat*)malloc( num * COORD_PER_NORMAL * sizeof(GLfloat) );
    
    m_vertexNum = num;
    
    // set the index
    for( int i = 0; i < num; i++ )
    {
        m_indexBuffer[i] = i;
        m_colorBuffer[i*4] = 1.0f;
        m_colorBuffer[i*4+1] = 1.0f;
        m_colorBuffer[i*4+2] = 1.0f;
        m_colorBuffer[i*4+3] = 1.0f;
    }
    
    return self;
}


/**
 * @desc    deconstructor
 * @para    none
 * @return  none
 */
- (void)dealloc
{
    free( m_vertexBuffer );
    free( m_indexBuffer );
    free( m_textCoordBuffer );
    free( m_colorBuffer );
    free( m_normalBuffer );
    
    [super dealloc];
}


/**
 * @desc    add to render
 * @para    none
 * @return  none
 */
- (void)Draw
{
    [[RenderCore sharedInstance] AddModel:self];
}


/**
 * @desc    render the model
 * @para    none
 * @return  none
 */
- (void)Render
{
    glVertexPointer( COORD_PER_VERTEX, GL_FLOAT, 0, m_vertexBuffer );
    glTexCoordPointer( COORD_PER_UV, GL_FLOAT, 0, m_textCoordBuffer );
    glColorPointer( COORD_PER_COLOR, GL_FLOAT, 0, m_colorBuffer );
    
    // ---- NOT USE ----
    //glNormalPointer( COORD_PER_NORMAL, 0, m_normalBuffer );
    // ----- TEMP -----
    
    glDrawElements( GL_TRIANGLES, m_vertexNum, GL_UNSIGNED_SHORT, (GLvoid*)m_indexBuffer );
}

@end
