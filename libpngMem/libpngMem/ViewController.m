//
//  ViewController.m
//  libpngMem
//
//  Created by Fakhir Shaheen on 02/12/2014.
//  Copyright (c) 2014 Fakhir Shaheen. All rights reserved.
//

#import "ViewController.h"

#import "GLView.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    
    int width = rect.size.width;
    int height = rect.size.height;
    float contentScaleFactor = 1.0f;
    
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        
        contentScaleFactor = [[UIScreen mainScreen] scale];
    }
    
    _glView = [[GLView alloc] initWithFrame:CGRectMake(0, 0, width*contentScaleFactor, height*contentScaleFactor)];
    _glView.contentScaleFactor = contentScaleFactor;
    _glView.contentMode = UIViewContentModeScaleToFill;
    self.view = _glView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
