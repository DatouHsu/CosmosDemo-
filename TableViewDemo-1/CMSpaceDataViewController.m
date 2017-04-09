//
//  CMSpaceDataViewController.m
//  TableViewDemo-1
//
//  Created by Da-Tou on 2015/9/6.
//  Copyright (c) 2015年 Da-Tou. All rights reserved.
//

#import "CMSpaceDataViewController.h"

@implementation CMSpaceDataViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //When each time you load "a" row into your tableView, this method gets called.
    
    static NSString *CellIdentifier = @"DataCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //每執行一個row 會進入一個case. 從0開始.
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Nickname :";
            cell.detailTextLabel.text = self.spaceObject.nickname;
            break;
        case 1:
            cell.textLabel.text = @"Diameter (km) :";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.diameter];
            break;
        case 2:
            cell.textLabel.text = @"Gravitational Force :";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.gravitationalForce];
            break;
        case 3:
            cell.textLabel.text = @"Length of a Year (days) :";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.yearLendth];
            break;
        case 4:
            cell.textLabel.text = @"Length of a Day (hours) :";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.dayLength];
            break;
        case 5:
            cell.textLabel.text = @"Temperature (celsius) :";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.temperature];
            break;
        case 6:
            cell.textLabel.text = @"Number of Moons :";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", self.spaceObject.numberofMoons];
            break;
        case 7:
            cell.textLabel.text = @"Interesting Fact :";
            cell.detailTextLabel.text = self.spaceObject.interestFact;
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}


@end
