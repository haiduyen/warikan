//
//  LixiTableViewController.m
//  1009030531
//
//  Created by hoang duyen on 12/01/05.
//  Copyright (c) 2012 tokushima university. All rights reserved.
//

#import "LixiTableViewController.h"
#import "DetailViewController1.h"

@implementation LixiTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"base1.png"]];
    self.tableView.backgroundColor = [UIColor clearColor];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

//Data１1.plist のデーターを読み込む
- (void)viewWillAppear:(BOOL)animated
{
    dao =[[Item alloc]initWithLibraryName:@"Data1"];
    self.title =@"Lixi2012";
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow]animated:YES];    
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source
//セクション数を決める
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//セクションの行数を決める
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [dao libraryCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [[dao libraryItemAtIndex:indexPath.row]valueForKey:@"sub2"]; 
    //cell.textLabel.textColor = [UIColor blackColor];
    //cell.textLabel.alightment = 
    [[cell textLabel] setTextAlignment:UITextAlignmentRight];
    //セルに矢印をつける
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
        //セルにイメージを追加
    UIImage *image = [UIImage imageNamed:[[dao libraryItemAtIndex:indexPath.row]valueForKey:@"sub3"]];
    cell.imageView.image = image;
    
    return cell;
}


#pragma mark - Table view delegate
//セルが選択されたら、DetailViewControllerの画面へ移る

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    DetailViewController1 *controller = [[DetailViewController1 alloc]
                                         initWithDvdData:[dao libraryItemAtIndex:indexPath.row]
                                         nibName:@"DetailViewController1" bundle:[NSBundle mainBundle]];
    
    controller.title = [[dao libraryItemAtIndex:indexPath.row] valueForKey:@"sub2"];
    
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
    
}

@end
