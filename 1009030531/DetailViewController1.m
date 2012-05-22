//
//  DetailViewController1.m
//  1009030531
//
//  Created by hoang duyen on 11/12/06.
//  Copyright (c) 2011 tokushima university. All rights reserved.
//

#import "DetailViewController1.h"

@implementation DetailViewController1

@synthesize image,send,message;

    
- (id)initWithDvdData:(NSDictionary *)data nibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        dvdData = data;
    }
    return self;

}

- (void)viewDidLoad {
    image.image = [UIImage imageNamed:[dvdData valueForKey:@"sub1"]];
    
    [super viewDidLoad];
    
}
//send somthing
-(IBAction)showPicker:(id)sender
{
    int indextag;
    indextag = [sender tag];
    
    NSLog(@"indextag = %d",indextag);
	Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
	{
		// We must always check whether the current device is configured for sending emails
		if ([mailClass canSendMail])
		{
			[self displayComposerSheet];
		}
		else
		{
			[self launchMailAppOnDevice];
		}
	}
	else
	{
		[self launchMailAppOnDevice];
	}
}


#pragma mark -
#pragma mark Compose Mail

// Displays an email composition interface inside the application. Populates all the Mail fields. 
-(void)displayComposerSheet 
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:@"Happy new year 2012 !"];
	
    
	// Set up recipients
    //  NSArray *toRecipients = [NSArray arrayWithObject:@" "]; 
    
	NSArray *toRecipients = [NSArray arrayWithObject:@"happy@example.com"]; 
	NSArray *ccRecipients = [NSArray arrayWithObjects:@"new@example.com", @"year@example.com", nil]; 
	NSArray *bccRecipients = [NSArray arrayWithObject:@"2012@example.com"]; 
	
	[picker setToRecipients:toRecipients];
    [picker setCcRecipients:ccRecipients];	
    [picker setBccRecipients:bccRecipients];
	
	// Attach an image to the email
    
    NSString *path = [[NSBundle mainBundle] pathForResource:[dvdData valueForKey:@"sub1"] ofType:@"png"];
    NSData *myData = [NSData dataWithContentsOfFile:path];
	[picker addAttachmentData:myData mimeType:@"image/png" fileName:[dvdData valueForKey:@"sub1"]];
	
    
	// Fill out the email body text
	NSString *emailBody = @"CHÚC MỪNG NĂM MỚI 2012!";
	[picker setMessageBody:emailBody isHTML:NO];
	
	[self presentModalViewController:picker animated:YES];
    [picker release];
}





// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
	message.hidden = NO;
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
			message.text = @"Result: canceled";
			break;
		case MFMailComposeResultSaved:
			message.text = @"Result: saved";
			break;
		case MFMailComposeResultSent:
			message.text = @"Result: sent";
			break;
		case MFMailComposeResultFailed:
			message.text = @"Result: failed";
			break;
		default:
			message.text = @"Result: not sent";
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark Workaround

// Launches the Mail application on the device.
-(void)launchMailAppOnDevice
{
	NSString *recipients = @"mailto:happy@example.com?cc=new@example.com,year@example.com&subject=Happy new year 2012 !";
	NSString *body = @"&body= Happy new year!";
	
	NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}


#pragma mark -
#pragma mark Unload views

- (void)viewDidUnload 
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.message = nil;
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc 
{
    [message release];
	[super dealloc];
}

@end
