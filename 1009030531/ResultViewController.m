//
//  ResultViewController.m
//  1009030531
//
//  Created by hoang duyen on 12/01/05.
//  Copyright (c) 2012 tokushima university. All rights reserved.
//

#import "ResultViewController.h"

@implementation ResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setHidesBackButton:YES animated:YES];    
    
    //preparePlay
    NSString	*path = [[NSBundle mainBundle] pathForResource:@"tienkeu4" ofType:@"mp3"]; NSURL *url = [NSURL fileURLWithPath:path]; 
    AudioServicesCreateSystemSoundID((CFURLRef)url, &soundID);
    
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"dotien2" ofType:@"mp3"];
    theSound = [[AVAudioPlayer alloc ] initWithContentsOfURL:[NSURL fileURLWithPath:path1] error:NULL];
    [theSound prepareToPlay];
    
    //Use accelerometer
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.updateInterval = 0.02;
    accelerometer.delegate = self;
    
}

- (void)viewDidUnload
{
    [next release];
    next = nil;
    [leji release];
    leji = nil;
    [payment release];
    payment = nil;
    [glass release];
    glass = nil;
    [super viewDidUnload];
}

int count;

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    self.navigationItem.title = @"iPhoneを振って";

    float wx= glass.center.x + acceleration.x * 30;
    float wy= glass.center.y - acceleration.y * 30;
    
    
    
    if (wx < 125) {
        wx= 125 ; 
        AudioServicesPlaySystemSound(soundID);
    }
    if (wx > 195) {
        wx= 195 ;
        AudioServicesPlaySystemSound(soundID);
    }
    
    if (wy < 180) {
        wy= 180 ;
        AudioServicesPlaySystemSound(soundID);
    }
    
    if (wy > 245) {
        wy= 245 ;
    }
    glass.center = CGPointMake(wx, wy);
    
    //count が30になったらの処理    
    if (acceleration.x > 1 && acceleration.y > 0.5) {
        
        count++;
        NSLog(@"yeh = %d",count);
        
    }
    if (count > 30) {
        
        
        AudioServicesDisposeSystemSoundID(soundID);
        
        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(appearbutton:) userInfo:nil repeats:NO];
        
        NSLog(@"yeh = %d",count);
        [theSound play];
       // lixi.hidden = YES;
        //lixi123.hidden = NO;
        
        leji.hidden = NO;
        

        NSInteger kekka = arc4random()%10;
        payment.text = [NSString stringWithFormat:@"%f",12000 + kekka];
              
        count= 0;
        accelerometer.delegate = nil;
        
    }
    
    
}
-(void)appearbutton:(NSTimer *)timer{
    
    [self.navigationItem setHidesBackButton:NO animated:YES];
    
    next.hidden = NO;
    
}

- (IBAction)nextperson:(id)sender {
    
}

-(void)dealloc{
    [next release];
    [leji release];
    [payment release];
    [glass release];
    [super dealloc];
}

@end
