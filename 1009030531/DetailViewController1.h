//
//  DetailViewController1.h
//  1009030531
//
//  Created by hoang duyen on 11/12/06.
//  Copyright (c) 2011 tokushima university. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface DetailViewController1 : UIViewController<MFMailComposeViewControllerDelegate>{
//    IBOutlet UITextView *textView1;
//    IBOutlet UITextView *textView2;
    
    IBOutlet UIImageView *image;
    IBOutlet UIButton *send;
    
    IBOutlet UIButton *play;
   //  AVAudioPlayer *theSound;
    IBOutlet UILabel *message;
    
    NSDictionary *dvdData;
}

@property (nonatomic, retain) UIImageView *image;
@property (nonatomic, retain) UILabel *message;
@property (nonatomic, retain) UIButton *send;


- (id)initWithDvdData:(NSDictionary *)data nibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
-(IBAction)showPicker:(id)sender;
-(void)displayComposerSheet;
-(void)launchMailAppOnDevice;
@end

