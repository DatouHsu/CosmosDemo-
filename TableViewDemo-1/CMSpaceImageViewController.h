//
//  CMSpaceImageViewController.h
//  TableViewDemo-1
//
//  Created by Da-Tou on 2015/9/6.
//  Copyright (c) 2015年 Da-Tou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMSpaceObject.h"

@interface CMSpaceImageViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) CMSpaceObject *spaceObject;

@end
