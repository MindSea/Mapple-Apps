//
//  MapViewController.m
//  Mapple Apps
//
//  Created by John Arnold on 11/13/2013.
//  Copyright (c) 2013 MindSea. All rights reserved.
//

#import "MapViewController.h"
#import "EditViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

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
	// Do any additional setup after loading the view.
    
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"editPin"]) {
        
        MKAnnotationView *annotationView = sender;
        EditViewController *controller = segue.destinationViewController;
        controller.annotation = annotationView.annotation;
    }
    
}

- (IBAction)addPin:(UILongPressGestureRecognizer *)sender {
    
    // Long press goes to UIGestureRecognizerStateBegan when the duration has expired, but the user hasn't let go yet.
    // For most gesture recognizers you'll want to use UIGestureRecognizerStateRecognized.
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        // Find the location of the long press and convert it to a map coordinate.
        CGPoint location = [sender locationOfTouch:0 inView:self.mapView];
        CLLocationCoordinate2D coordinate = [self.mapView convertPoint:location toCoordinateFromView:self.mapView];
        
        // Create an annotation from the coordinate and add it to the map.
        MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
        point.coordinate = coordinate;
        point.title = @"Dropped Pin";
        point.subtitle = @"Ain't it cool?";
        [self.mapView addAnnotation:point];
    }

}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    // We only take care of the view for point annotations, not other kinds (like the user location annotation).
    if ([annotation isKindOfClass:[MKPointAnnotation class]]) {
        
        MKPinAnnotationView *pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Pin"];
        pinView.pinColor = MKPinAnnotationColorPurple;
        pinView.animatesDrop = YES;
        pinView.canShowCallout = YES;
        [pinView setSelected:YES animated:YES];
        
        // Create a button that will be used to edit the pin.
        UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinView.rightCalloutAccessoryView = button;
        
        return pinView;
    }
    
    return nil;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    [self performSegueWithIdentifier:@"editPin" sender:view];
}

@end
