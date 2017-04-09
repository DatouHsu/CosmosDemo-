//
//  CosmosTableViewController.h
//  TableViewDemo-1
//
//  Created by Da-Tou on 2015/9/3.
//  Copyright (c) 2015年 Da-Tou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMAddSpaceViewController.h"

@interface CosmosTableViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,CMAddSpaceObjectViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *planets;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *addedSpaceObjects;

@end
