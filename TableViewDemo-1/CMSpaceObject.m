//
//  CMSpaceObject.m
//  TableViewDemo-1
//
//  Created by Da-Tou on 2015/9/4.
//  Copyright (c) 2015年 Da-Tou. All rights reserved.
//

#import "CMSpaceObject.h"
#import "AstronomicalData.h"

@implementation CMSpaceObject

- (id)init
{
    self = [self initWithData:nil andImage:nil];
    return self;
}

- (id)initWithData:(NSDictionary *)data andImage:(UIImage *)image
{
    self = [super init];
    
    self.name = data[PLANET_NAME];
    self.gravitationalForce = [data[PLANET_GRAVITY] floatValue]; //將值從NSNumber轉成float
    self.diameter = [data[PLANET_DIAMETER] floatValue];
    self.yearLendth = [data[PLANET_YEAR_LENGTH] floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH] floatValue];
    self.temperature = [data[PLANET_TEMPERATURE] floatValue];
    self.numberofMoons = [data[PLANET_NUMBER_OF_MOONS] intValue];
    self.nickname = data[PLANET_NICKNAME];
    self.interestFact = data[PLANET_INTERESTING_FACT];
    
    self.spaceImage = image;
    
    return self;
}



@end
