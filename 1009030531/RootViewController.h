//
//  RootViewController.h
//  1009030531
//
//  Created by hoang duyen on 12/01/04.
//  Copyright 2011 tokushima university. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RuletModel.h"
#import "RuletModel+Helper.h"

@interface RootViewController : UIViewController {

    IBOutlet UITextField *peopleNumberField;
    IBOutlet UITextField *payment;
}

@property (nonatomic) RuletModel *rm;


- (IBAction)didFinishedEditingField:(id)sender;
-(IBAction)Pay :(id)sender;
@end
