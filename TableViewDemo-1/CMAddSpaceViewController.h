//
//  CMAddSpaceViewController.h
//  TableViewDemo-1
//
//  Created by Da-Tou on 2015/9/10.
//  Copyright (c) 2015年 Da-Tou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMSpaceObject.h"

@protocol CMAddSpaceObjectViewControllerDelegate <NSObject>

@required

- (void)addSpaceObject:(CMSpaceObject *)spaceObject;
- (void)didCancel;

@end

@interface CMAddSpaceViewController : UIViewController

@property (weak, nonatomic) id <CMAddSpaceObjectViewControllerDelegate> delegate;
//why use weak: because we wanna retain cycles. and be noted that if we creat delegate properties, we're gonna declare them as weak. So that we'll be able to propertly deallocate objects when we need to.

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberofmoonssTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestingfactTextField;
- (IBAction)cancelButton:(UIButton *)sender;
- (IBAction)addButton:(UIButton *)sender;

@end
