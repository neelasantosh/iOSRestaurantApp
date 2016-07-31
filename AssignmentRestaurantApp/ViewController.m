//
//  ViewController.m
//  AssignmentRestaurantApp
//
//  Created by Rajesh on 14/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "ViewController.h"
#import "FoodItemCellDelegate.h"
#import "FoodItems.h"
#import "RestaurantTableViewCell.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize placeOrderButton,tableView,arrayItems;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    FoodItems *f1 = [[FoodItems alloc]init];
    f1.itemId =1;
    f1.quantity =0;
    f1.name = @"Pizza";
    f1.price = 50;
    f1.img = @"pizza.jpg";
    
    FoodItems *f2 = [[FoodItems alloc]init];
    f1.itemId =2;
    f1.quantity =0;
    f2.name = @"Burger";
    f2.price = 50;
    f2.img = @"burger.png";

    arrayItems = [[NSMutableArray alloc]initWithObjects:f1,f2, nil];
    
    UINib *nibForCell = [UINib nibWithNibName:@"RestaurantTableviewCell" bundle:nil];
    [tableView registerNib:nibForCell forCellReuseIdentifier:@"custom_cell"];
    
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//2.. decide no. of rows
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RestaurantTableViewCell *imgCell = [tableView
    dequeueReusableCellWithIdentifier:@"custom_cell" forIndexPath:indexPath];
    
    //get account object for current index path
    FoodItems *items = [arrayItems objectAtIndex:indexPath.row];
    
    imgCell.itemName.text = items.name;
    imgCell.itemPrice.text = [NSString stringWithFormat:@"%d",items.price];
    imgCell.textQty.text = [NSString stringWithFormat:@"%d",items.quantity];
    UIImage *img = [UIImage imageNamed:items.img];
    imgCell.imageitemView.image = img;
    
    imgCell.food=items;
    imgCell.delegate = self;
    return imgCell;
}

-(void)increaseQty:(int)itemId
{
    NSLog(@"Check :  %d" , itemId);
    for (int i = 0; i < [arrayItems count]; i++) {
        FoodItems *item = [arrayItems objectAtIndex:i];
        if(item.itemId == itemId)
        {
            item.quantity = item.quantity + 1;
            NSLog(@"Qty :  %d" , item.quantity);
            [tableView reloadData];
            break;
        }
    }
}

-(void)decreaseQty:(int)itemId
{
    NSLog(@"Check :  %d" , itemId);
    for (int i = 0; i < [arrayItems count]; i++) {
        FoodItems *item = [arrayItems objectAtIndex:i];
        if(item.itemId == itemId)
        {
            if (item.quantity > 0) {
                item.quantity = item.quantity - 1;
                NSLog(@"Qty :  %d" , item.quantity);
                [tableView reloadData];
            }
            break;
        }
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)placeOrders:(id)sender {
    float totalAmount = 0;
    NSString *msg;
    for (int i = 0; i < [arrayItems count]; i++) {
        FoodItems *item = [arrayItems objectAtIndex:i];
        totalAmount += item.price * item.quantity;
    }
    if (totalAmount > 0) {
        msg= [NSString stringWithFormat:@"Total Amount : %0.2f",totalAmount];
    }
    else
    {
        msg = [NSString stringWithFormat:@"No Item Selected"];
    }
    
    UIAlertView *alertPlaceOrder  = [[UIAlertView alloc]initWithTitle:@"Order Status" message:msg delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"Place Order", nil];
    alertPlaceOrder.tag = 1;
    [alertPlaceOrder show];
}

@end
