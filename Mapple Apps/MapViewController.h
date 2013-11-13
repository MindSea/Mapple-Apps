//
//  MapViewController.h
//  Mapple Apps
//
//  Created by John Arnold on 11/13/2013.
//  Copyright (c) 2013 MindSea. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)addPin:(UILongPressGestureRecognizer *)sender;

@end
