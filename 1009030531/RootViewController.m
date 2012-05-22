//
//  RootViewController.m
//  1009030531
//
//  Created by hoang duyen on 11/08/12.
//  Copyright 2011 tokushima university. All rights reserved.
//

#import "RootViewController.h"
#import "ResultViewController.h"
#import "LixiTableViewController.h"
#import "RuletModel.h"
#import "RuletModel+Helper.h"

@implementation RootViewController

- (void)viewDidLoad
{
    RuletModel *rm = [[RuletModel alloc] init];
    [rm createDummyPrice:10034];
    [rm createDummyPerson:3];
    
    NSLog(@"person num is %i",[[rm people] count]);
    NSLog(@"price is %i",rm.price);
    [rm setPerPriceToProperty:rm.people with:rm.price];

    
    
    int index =0;
    for (NSMutableDictionary *p in rm.people ){
        
        int t = [[p objectForKey:@"price"] intValue];
         index += 1;
        
        NSLog(@"person_%i is %i",index,t);
        NSLog(@"offset is %i",rm.offSet);

        
    }


    

    
    
    
    //UIBarbutton set title "back"
    UIBarButtonItem *backbtn=[[UIBarButtonItem alloc] init];
    backbtn.title=@"Back";
    self.navigationItem.backBarButtonItem = backbtn;
    [backbtn release];
}

- (IBAction)Pay:(id)sender{
	ResultViewController *abc = [[ResultViewController alloc] initWithNibName:@"ResultViewController" 
                                                 bundle:nil];
	[self.navigationController pushViewController:abc animated:YES];
	[abc release];
}



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [people release];
    people = nil;
    [payment release];
    payment = nil;
    [super viewDidUnload];
    
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
}

- (void)dealloc
{
    [people release];
    [payment release];
    [super dealloc];
}

@end
