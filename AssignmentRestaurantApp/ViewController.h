//
//  ViewController.h
//  AssignmentRestaurantApp
//
//  Created by Rajesh on 14/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodItemCellDelegate.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,FoodItemCellDelegate>

@property (strong, nonatomic) IBOutlet UIButton *placeOrderButton;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)placeOrders:(id)sender;
@property NSMutableArray *arrayItems;
@end

