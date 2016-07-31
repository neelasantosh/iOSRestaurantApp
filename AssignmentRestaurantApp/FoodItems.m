//
//  FoodItems.m
//  AssignmentRestaurantApp
//
//  Created by Rajesh on 14/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "FoodItems.h"

@implementation FoodItems
@synthesize price,name,quantity,itemId;

 -(NSString *)description
{
    NSString *str = [NSString stringWithFormat:@"%d,%@,%d",price,name,quantity];
    return str;
}
@end
