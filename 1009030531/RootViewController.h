//
//  RootViewController.h
//  1009030531
//
//  Created by hoang duyen on 12/01/04.
//  Copyright 2011 tokushima university. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController {

    IBOutlet UITextField *people;
    IBOutlet UITextField *payment;
}
-(IBAction)Pay :(id)sender;
@end
