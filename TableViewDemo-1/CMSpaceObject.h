//
//  CMSpaceObject.h
//  TableViewDemo-1
//
//  Created by Da-Tou on 2015/9/4.
//  Copyright (c) 2015年 Da-Tou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CMSpaceObject : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) float gravitationalForce;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLendth;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) int numberofMoons;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *interestFact;

@property (strong, nonatomic) UIImage *spaceImage;

- (id)initWithData: (NSDictionary *)data andImage: (UIImage *)image;

@end
