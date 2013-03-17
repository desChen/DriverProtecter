//
//  MapViewController.m
//  DriverProtecter
//
//  Created by abbylai on 西元13/3/17.
//  Copyright (c) 2013年 chunpinglai. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView1;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationController.navigationBarHidden = NO;
        
        mapView1 = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 416)];
        mapView1.delegate = self;
        mapView1.mapType = MKMapTypeStandard;
        mapView1.scrollEnabled = YES;
        mapView1.zoomEnabled = YES;
        mapView1.showsUserLocation = YES;
        
        MKCoordinateRegion theRegion;
        //-------------add Target-------------
        CLLocationCoordinate2D theCenter;
        theCenter.latitude = 25.078217;
        theCenter.longitude = 121.58162;
        theRegion.center=theCenter;
        
        MKPointAnnotation *ann = [[MKPointAnnotation alloc]init];
        ann.coordinate = theCenter;
        [ann setTitle:@"flower's home"];
        [ann setSubtitle:@"台北市xxxxxxx號"];
        [mapView1 addAnnotation:ann];
        //--------------------------
        MKCoordinateSpan theSpan;
        theSpan.latitudeDelta = 0.009;
        theSpan.longitudeDelta = 0.009;
        theRegion.span = theSpan;
        [mapView1 setRegion:theRegion animated:YES];
        [self.view addSubview:mapView1];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id < MKAnnotation >)annotation {
    if (annotation == mapView.userLocation) {
        return nil;
    }
    MKPinAnnotationView *view = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"temp"]autorelease];
    UIButton *tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tempButton.frame = CGRectMake(0, 0, 29, 29);
    [tempButton setBackgroundImage:[UIImage imageNamed:@"car.png"] forState:UIControlStateNormal];
    tempButton.backgroundColor = [UIColor clearColor];
    [tempButton addTarget:self action:@selector(routePressed:) forControlEvents:UIControlEventTouchUpInside];
    view.leftCalloutAccessoryView = tempButton;
    //view.pinColor = MKPinAnnotationColorPurple;
    view.animatesDrop = YES;
    view.canShowCallout = YES;
    return view;
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay {
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolylineView *lineview=[[[MKPolylineView alloc] initWithOverlay:overlay] autorelease];
        lineview.strokeColor=[[UIColor blueColor] colorWithAlphaComponent:0.3];
        lineview.lineWidth=10.0;
        return lineview;
    }
    return nil;
}

@end
