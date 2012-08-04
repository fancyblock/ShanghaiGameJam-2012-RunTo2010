//
//  Model.h
//  SGJ2012
//
//  Created by He JiaBin on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Model : NSObject
{
    GLfloat* m_vertexBuffer;
    GLfloat* m_textCoordBuffer;
    GLushort* m_indexBuffer;
    GLfloat* m_colorBuffer;
    GLfloat* m_normalBuffer;
    
    int m_vertexNum;
}

@property (nonatomic, readwrite) int TEXTURE_INDEX;
@property (nonatomic, retain) NSString* TEXTURE_NAME;

@property (nonatomic, readwrite) GLfloat* VERTEX_BUFFER;
@property (nonatomic, readwrite) GLfloat* UV_BUFFER;
@property (nonatomic, readwrite) GLfloat* COLOR_BUFFER;
@property (nonatomic, readwrite) GLfloat* NORMAL_BUFFER;


- (id)initWithVertexNum:(int)num;

- (void)Render;

- (void)Draw;

@end
