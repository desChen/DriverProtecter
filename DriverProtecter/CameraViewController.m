//
//  CameraViewController.m
//  DriverProtecter
//
//  Created by abbylai on 西元13/3/17.
//  Copyright (c) 2013年 chunpinglai. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController
@synthesize imageView1;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showCameraPressed:(id)sender {
    UIImagePickerController *useCamara = [[UIImagePickerController alloc]init];
    useCamara.delegate = self;
    useCamara.sourceType = UIImagePickerControllerSourceTypeCamera;
    useCamara.navigationBarHidden = NO;
    useCamara.wantsFullScreenLayout = NO;
    [useCamara setCameraOverlayView:self.view];
    [self presentViewController:useCamara animated:YES completion:nil];
}

- (IBAction)takePicPressed:(id)sender {
//    UIImageWriteToSavedPhotosAlbum(image1, self, nil, nil);
    NSLog(@"Image written to photo album");
    
    UIGraphicsBeginImageContext(imageView1.bounds.size);
    [imageView1.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage =  UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(viewImage, nil , nil , nil );
}

- (IBAction)mapPressed:(id)sender {
    MapViewController *toMapViewController = [[MapViewController alloc]initWithNibName:NULL bundle:NULL];
    toMapViewController.navigationItem.title = @"Map";
    [self.navigationController pushViewController:toMapViewController animated:YES];
    [toMapViewController release];
}

@end
