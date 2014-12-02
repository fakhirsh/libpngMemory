//
//  GLView.h
//  WordGame
//
//  Created by Fakhir Shaheen on 24/10/2014.
//  Copyright (c) 2014 Fakhir Shaheen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>

#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>

@interface GLView : UIView
{
    EAGLContext * _glContext;
    float _timeStamp;
}

- (void) drawView: (CADisplayLink*) displayLink;
//- (void) didRotate: (NSNotification*) notification;

@end

