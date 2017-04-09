//
//  CMAddSpaceViewController.m
//  TableViewDemo-1
//
//  Created by Da-Tou on 2015/9/10.
//  Copyright (c) 2015年 Da-Tou. All rights reserved.
//

#import "CMAddSpaceViewController.h"

@implementation CMAddSpaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *orionImage = [UIImage imageNamed:@"Orion.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:orionImage];
}

- (IBAction)cancelButton:(id)sender {
    [self.delegate didCancel];
}

- (IBAction)addButton:(UIButton *)sender {
    CMSpaceObject *newSpaceObject = [self returnNewSpaceObject];
    [self.delegate addSpaceObject:newSpaceObject];
}

- (CMSpaceObject *)returnNewSpaceObject
{
    CMSpaceObject *addedSpaceObject = [[CMSpaceObject alloc] init];
    addedSpaceObject.name = self.nameTextField.text;
    addedSpaceObject.nickname = self.nicknameTextField.text;
    addedSpaceObject.diameter = [self.diameterTextField.text floatValue];
    addedSpaceObject.temperature = [self.temperatureTextField.text floatValue];
    addedSpaceObject.numberofMoons = [self.numberofmoonssTextField.text intValue];
    addedSpaceObject.interestFact = self.interestingfactTextField.text;
    addedSpaceObject.spaceImage = [UIImage imageNamed:@"EinsteinRing.jpg"];
    
    return addedSpaceObject;
}


@end
