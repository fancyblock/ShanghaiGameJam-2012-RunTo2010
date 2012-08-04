//
//  Model.m
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Model.h"

@implementation Model

@synthesize TEXTURE_INDEX;
@synthesize TEXTURE_NAME;


/**
 * @desc    init with size
 * @para    size
 * @return  none
 */
- (id)initWithVertexSize:(int)size
{
    [super init];
    
    // create the buffer
    m_vertexBuffer = (GLfloat*)malloc( size * COORD_PER_VERTEX * sizeof(GLfloat) );
    m_indexBuffer = (GLushort*)malloc( size * sizeof(GLushort) );
    m_textCoordBuffer = (GLfloat*)malloc( size * COORD_PER_UV * sizeof(GLfloat) );
    m_colorBuffer = (GLfloat*)malloc( size * COORD_PER_COLOR * sizeof(GLfloat) );
    m_normalBuffer = (GLfloat*)malloc( size * COORD_PER_NORMAL * sizeof(GLfloat) );
    
    //TODO
    
    return self;
}


/**
 * @desc    deconstructor
 * @para    none
 * @return  none
 */
- (void)dealloc
{
    //TODO 
    
    free( m_vertexBuffer );
    free( m_indexBuffer );
    free( m_textCoordBuffer );
    free( m_colorBuffer );
    free( m_normalBuffer );
    
    [super dealloc];
}


/**
 * @desc    render the model
 * @para    none
 * @return  none
 */
- (void)Render
{
    //TODO
}

@end
