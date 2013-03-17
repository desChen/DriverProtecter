//
//  MapViewController.h
//  DriverProtecter
//
//  Created by abbylai on 西元13/3/17.
//  Copyright (c) 2013年 chunpinglai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic,retain) MKMapView *mapView1;

@end
