//
//  CameraViewController.h
//  DriverProtecter
//
//  Created by abbylai on 西元13/3/17.
//  Copyright (c) 2013年 chunpinglai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface CameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (retain, nonatomic) IBOutlet UIImageView *imageView1;
- (IBAction)showCameraPressed:(id)sender;

- (IBAction)takePicPressed:(id)sender;
- (IBAction)mapPressed:(id)sender;
@end
