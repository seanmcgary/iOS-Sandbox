//
//  GroupedTableViewController.h
//  tableview
//
//  Created by Sean McGary on 3/23/12.
//  Copyright (c) 2012 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface GroupedTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *groups;
@property (strong, nonatomic) NSArray *cells;
@property (strong, nonatomic) UITableView *tableView;

- (id) init;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
