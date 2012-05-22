//
//  ResultViewController.h
//  1009030531
//
//  Created by hoang duyen on 12/01/05.
//  Copyright (c) 2012 tokushima university. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <AVFoundation/AVFoundation.h>
#include <AudioToolbox/AudioToolbox.h>


@interface ResultViewController : UIViewController<UIAccelerometerDelegate>{

    IBOutlet UIImageView *glass;
    
    IBOutlet UIImageView *leji;
    IBOutlet UIButton *next;
    IBOutlet UILabel *payment;
    
    AVAudioPlayer *theSound;
    SystemSoundID soundID;    
}
-(void)appearbutton:(NSTimer *)timer;
- (IBAction)nextperson:(id)sender;

@end
