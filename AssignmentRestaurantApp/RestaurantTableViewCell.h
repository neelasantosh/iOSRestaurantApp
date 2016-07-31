//
//  RestaurantTableViewCell.h
//  AssignmentRestaurantApp
//
//  Created by Rajesh on 14/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodItems.h"
#import "FoodItemCellDelegate.h"

@interface RestaurantTableViewCell : UITableViewCell
- (IBAction)enablebutton:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageitemView;

@property (strong, nonatomic) IBOutlet UILabel *itemName;
@property (strong, nonatomic) IBOutlet UISwitch *enableSwitch;

@property (strong, nonatomic) IBOutlet UILabel *itemPrice;
@property (strong, nonatomic) IBOutlet UIButton *addButoon;


@property (strong, nonatomic) IBOutlet UIButton *removeButton;
@property (strong, nonatomic) IBOutlet UITextField *textQty;


- (IBAction)add:(id)sender;

- (IBAction)remove:(id)sender;

@property FoodItems *food;
@property id<FoodItemCellDelegate> delegate;
@end
