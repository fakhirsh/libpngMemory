//
//  GLView.m
//  WordGame
//
//  Created by Fakhir Shaheen on 24/10/2014.
//  Copyright (c) 2014 Fakhir Shaheen. All rights reserved.
//


#import "GLView.h"
#import "MyCode/GLDemo.h"

@implementation GLView

+ (Class) layerClass
{
    return [CAEAGLLayer class];
}

- (id) initWithFrame: (CGRect) frame
{
    
    if (self = [super initWithFrame:frame])
    {
        CAEAGLLayer * eaglLayer = (CAEAGLLayer *) super.layer;
        eaglLayer.opaque = true;
        _glContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
        
        if (!_glContext || ![EAGLContext setCurrentContext:_glContext]) {
            //[self release];
            return nil;
        }
        
        // Initialization code...
        GLuint frameBuffer, renderBuffer;
        
        glGenFramebuffers(1, &frameBuffer);
        glBindFramebuffer(GL_FRAMEBUFFER, frameBuffer);
        
        glGenRenderbuffers(1, &renderBuffer);
        glBindRenderbuffer(GL_RENDERBUFFER, renderBuffer);
        
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, renderBuffer);
        
        [_glContext renderbufferStorage:GL_RENDERBUFFER fromDrawable:eaglLayer];
        
        int screenWidth = -1, screnHeight = -1;
        glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, &screenWidth);
        glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, &screnHeight);
        
        // Get bundle root directory.
        NSString * bundlePath = [[NSBundle mainBundle] resourcePath];
        const char *cpath = [bundlePath fileSystemRepresentation];
        
        setupGraphics(screenWidth, screnHeight, cpath);
        
        
        
        CADisplayLink * displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(drawView:)];
        [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    }
    
    return self;
}

- (void) drawView :(CADisplayLink*) displayLink
{
    
    renderFrame();
    
    [_glContext presentRenderbuffer:GL_RENDERBUFFER];
}

- (void) dealloc
{
    if ([EAGLContext currentContext] == _glContext)
    {
        [EAGLContext setCurrentContext:nil];
    }
    //[_glContext release];
    //[super dealloc];
}


@end