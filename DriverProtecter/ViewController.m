//
//  ViewController.m
//  DriverProtecter
//
//  Created by abbylai on 西元13/3/17.
//  Copyright (c) 2013年 chunpinglai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)logInPressed:(id)sender {
    CameraViewController *nextViewController = [[CameraViewController alloc]initWithNibName:NULL bundle:NULL];
    [self.navigationController pushViewController:nextViewController animated:YES];
    nextViewController.navigationItem.title = @"Camera";
    nextViewController.navigationController.navigationBarHidden = NO;
    nextViewController.navigationItem.hidesBackButton = YES;
    [nextViewController release];
}

@end
