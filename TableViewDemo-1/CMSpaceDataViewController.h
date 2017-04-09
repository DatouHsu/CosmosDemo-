//
//  CMSpaceDataViewController.h
//  TableViewDemo-1
//
//  Created by Da-Tou on 2015/9/6.
//  Copyright (c) 2015年 Da-Tou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMSpaceObject.h"

@interface CMSpaceDataViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) CMSpaceObject *spaceObject;

@end
