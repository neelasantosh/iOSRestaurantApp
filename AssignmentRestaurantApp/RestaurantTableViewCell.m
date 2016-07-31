//
//  RestaurantTableViewCell.m
//  AssignmentRestaurantApp
//
//  Created by Rajesh on 14/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "RestaurantTableViewCell.h"

@implementation RestaurantTableViewCell
@synthesize imageitemView,textQty,addButoon,removeButton,itemName,itemPrice,delegate,food,enableSwitch;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)add:(id)sender {
    [delegate increaseQty:food.itemId];
}

- (IBAction)remove:(id)sender {
    [delegate decreaseQty:food.itemId];
}


- (IBAction)enablebutton:(id)sender {
    if ([enableSwitch isOn]) {
        [addButoon setHidden:false];
        [textQty setHidden:false];
        [removeButton setHidden:false];
    }
    else{
        [addButoon setHidden:true];
        [textQty setHidden:true];
        [removeButton setHidden:true];

    }
}
@end
