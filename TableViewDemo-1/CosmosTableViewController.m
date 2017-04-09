//
//  CosmosTableViewController.m
//  TableViewDemo-1
//
//  Created by Da-Tou on 2015/9/3.
//  Copyright (c) 2015年 Da-Tou. All rights reserved.
//

#import "CosmosTableViewController.h"
#import "AstronomicalData.h"
#import "CMSpaceObject.h"
#import "CMSpaceImageViewController.h"
#import "CMSpaceDataViewController.h"

@implementation CosmosTableViewController
#define  ADDED_SPACEOBJECTS_KEY @"Added Space Objects Array"


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (NSMutableDictionary *planetData in[AstronomicalData allKnownPlanets]) {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        CMSpaceObject *planet = [[CMSpaceObject alloc] initWithData:planetData andImage: [UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
    }
    
    NSArray *myPlanetsAsPropertyLists = [[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_SPACEOBJECTS_KEY];
    for (NSDictionary *dictionary in myPlanetsAsPropertyLists) {
        CMSpaceObject *spaceObject = [self spaceObjectForDictionary:dictionary];
        [self.addedSpaceObjects addObject:spaceObject];
    }
    
    [_tableView setBackgroundView:nil];
    _tableView.backgroundColor = [UIColor blackColor];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //cell.backgroundColor = [UIColor blackColor];
}

#pragma Lazy initialization
    //lazy installation, 不想每次執行都要重新建立新的array, 也避免預設的值消失.
- (NSMutableArray *)planets
{
    if (!_planets) {
        _planets = [[NSMutableArray alloc] init];
    }
    return _planets;
}

- (NSMutableArray *)addedSpaceObjects
{
    if (!_addedSpaceObjects) {
        _addedSpaceObjects = [[NSMutableArray alloc] init];
    }
    return _addedSpaceObjects;
}

#pragma UITableView data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([self.addedSpaceObjects count]) {
        return 2;   //如果新增的話就回傳2
    }
    else
    {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return [self.addedSpaceObjects count]; //如果現在在section 1的話
    }
    else
    {
        return [self.planets count];  //不是在section 1 也就是說在section 0的部分
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.section == 1) {
        //Use new Space object to customize our cell.
        //手動新增的cell在這裡設計顯示的樣子.否則無法輸出正確的樣式
        CMSpaceObject *planet = [self.addedSpaceObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    }
    else
    {
        CMSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    }

    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //NSLog(@"%@", sender); //UItableCell's type, id could be any object.
    
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        if ([segue.destinationViewController isKindOfClass:[CMSpaceImageViewController class]]) {
            CMSpaceImageViewController *nextViewController = segue.destinationViewController;
            NSIndexPath *path = [self.tableView indexPathForSelectedRow]; //another way is give the sender to tableView function by use "indexPathForCell".
            CMSpaceObject *selectedObject;
            
            if (path.section == 0) {
                selectedObject = [self.planets objectAtIndex:path.row];
            }
            else if (path.section == 1)
            {
                selectedObject = self.addedSpaceObjects[path.row];
            }
            
            nextViewController.spaceObject = selectedObject;
            //don not set the UI, like "imageView.image = spaceImage". because the UI element aren't not available to us in the prepareForSegue method. they only available after that ViewController presented on the screen.
        }
    }
    
    if ([sender isKindOfClass:[NSIndexPath class]]) {
        if ([segue.destinationViewController isKindOfClass:[CMSpaceDataViewController class]]) {
            CMSpaceDataViewController *targetViewcontroller = segue.destinationViewController;
            
            NSIndexPath *path = sender;
            CMSpaceObject *selectObject;
            
            if (path.section == 0) {
                selectObject = [self.planets objectAtIndex:path.row];
            }
            else if (path.section == 1)
            {
                selectObject = self.addedSpaceObjects[path.row];
            }
            targetViewcontroller.spaceObject = selectObject;
        }
    }
    
    if ([segue.destinationViewController isKindOfClass:[CMAddSpaceViewController class]]) {
        CMAddSpaceViewController *addSpaceVC = segue.destinationViewController;
        addSpaceVC.delegate = self;
    }
}

#pragma Segue in code.

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"Accessory button is working properly %li", (long)indexPath.row);
    
    [self performSegueWithIdentifier:@"Space Data" sender:indexPath];
}

#pragma CMAddSpaceObjectViewControllweDelegate

- (void)addSpaceObject:(CMSpaceObject *)spaceObject
{
    [self.addedSpaceObjects addObject:spaceObject];
    
    //Save to NSUserDefaults here
    NSMutableArray *spaceObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_SPACEOBJECTS_KEY] mutableCopy];
    //mutableCopy: in order to transform it from an NSArray to an NSMutableArray.
    if (!spaceObjectsAsPropertyLists) {
        spaceObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    }
    [spaceObjectsAsPropertyLists addObject:[self spaceObjectAsAPropertyList:spaceObject]];
    [[NSUserDefaults standardUserDefaults] setObject:spaceObjectsAsPropertyLists forKey:ADDED_SPACEOBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize]; //save the mutableArray that we have just added.
    
    //NSLog(@"addSpaceObject");
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData]; //不然tableview 不知道我們有新增資訊 也就不會顯示出來
}

- (void)didCancel
{
    NSLog(@"didCancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma Helper Methods

- (NSDictionary *)spaceObjectAsAPropertyList:(CMSpaceObject *)spaceObject
{
    NSData *imageData = UIImagePNGRepresentation(spaceObject.spaceImage);//因為圖檔本身太龐大, 所以先轉成nsdata在存進dictionary裡
    
    NSDictionary *dictionary = @{PLANET_NAME : spaceObject.name, PLANET_GRAVITY : @(spaceObject.gravitationalForce), PLANET_DIAMETER : @(spaceObject.diameter), PLANET_YEAR_LENGTH : @(spaceObject.yearLendth), PLANET_DAY_LENGTH : @(spaceObject.dayLength), PLANET_TEMPERATURE : @(spaceObject.temperature), PLANET_NUMBER_OF_MOONS : @(spaceObject.numberofMoons), PLANET_NICKNAME : spaceObject.nickname, PLANET_INTERESTING_FACT : spaceObject.interestFact, PLANET_IMAGE : imageData};
    
    return dictionary;
}

- (CMSpaceObject *)spaceObjectForDictionary: (NSDictionary *)dictionary
{
    NSData *dataForImage = dictionary[PLANET_IMAGE];
    UIImage *spaceObjectImage = [UIImage imageWithData:dataForImage];
    CMSpaceObject *spaceObject = [[CMSpaceObject alloc] initWithData:dictionary andImage:spaceObjectImage];
    return spaceObject;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) return YES;
    else return NO;
    //return No if you do not want the specified item to be editable.
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //Delete the row from the data source
        [self.addedSpaceObjects removeObjectAtIndex:indexPath.row];
        NSMutableArray *newSavedSpaceObjectData = [[NSMutableArray alloc] init];
        //刪掉檔案之後 要另外save a new spaceobject for NSUserDefaults.
        for (CMSpaceObject *spaceObject in self.addedSpaceObjects)
        {
            [newSavedSpaceObjectData addObject:[self spaceObjectAsAPropertyList:spaceObject]];
        }
        [[NSUserDefaults standardUserDefaults] setObject:newSavedSpaceObjectData forKey:ADDED_SPACEOBJECTS_KEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end



