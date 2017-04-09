//
//  CMSpaceImageViewController.m
//  TableViewDemo-1
//
//  Created by Da-Tou on 2015/9/6.
//  Copyright (c) 2015年 Da-Tou. All rights reserved.
//

#import "CMSpaceImageViewController.h"

@implementation CMSpaceImageViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] initWithImage:self.spaceObject.spaceImage];
    
    self.scrollView.contentSize = self.imageView.frame.size;
    [self.scrollView addSubview:self.imageView];
    self.scrollView.delegate = self; //Register me, specifically this view controller to listen the events from my scrollView.
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.3;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView; //Which view want to scroll.
}


@end
