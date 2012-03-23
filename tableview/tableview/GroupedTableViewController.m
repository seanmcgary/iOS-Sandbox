//
//  GroupedTableViewController.m
//  tableview
//
//  Created by Sean McGary on 3/23/12.
//  Copyright (c) 2012 RIT. All rights reserved.
//

#import "GroupedTableViewController.h"

@interface GroupedTableViewController ()

@end

@implementation GroupedTableViewController

@synthesize groups;
@synthesize tableView;
@synthesize cells;

- (id) init 
{
    
    NSArray *cells = [[NSArray alloc] initWithObjects:@"Newtex Archives", @"Newstex Premium Content", nil];
    
    NSArray *otherCells = [[NSArray alloc] initWithObjects:@"Cell1", @"Cell2", @"Cell3", nil];
    
    groups = [[NSArray alloc] initWithObjects:cells, otherCells, nil];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStyleGrouped];
    
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView reloadData];
    
    self.view = tableView;
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    self.title = @"Grouped Table Test";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,80,320,480) style:UITableViewStyleGrouped];
    
    tableView.delegate = self;
    
    self.view = tableView;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [groups count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
    
    NSArray *c = [groups objectAtIndex:section];
    
    return [c count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section is the region name -- get this from the region at the section index.
    
    return @"Section";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }

    NSArray *g = [groups objectAtIndex:indexPath.section];
    

    NSString *item = [g objectAtIndex:indexPath.row];
    
    cell.editing = YES;
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:CGRectMake(0,                                          0, 60, 43)];
    
    accessoryView.backgroundColor = [UIColor grayColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(5, 0, 50, 25);
    
    [btn setTitle:@"Test" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blueColor];
    
    [accessoryView addSubview:btn];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 60, 20)];
    label.text = @"A label";
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = UITextAlignmentCenter;
    
    UIFont *actualFont = [UIFont fontWithName:@"Helvetica" size:10];

    label.font = actualFont;
    
    [accessoryView addSubview:label];
    
    accessoryView.layer.cornerRadius = 5;
    accessoryView.layer.masksToBounds = YES;
    
    // setup the accessory buttons to the right
    cell.editingAccessoryView = accessoryView;    
    cell.accessoryView = accessoryView;
    
    [cell setAccessoryType:UIButtonTypeCustom];
    
    cell.textLabel.text = item;
    return cell;
}

@end
