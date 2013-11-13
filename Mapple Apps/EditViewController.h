//
//  EditViewController.h
//  Mapple Apps
//
//  Created by John Arnold on 11/13/2013.
//  Copyright (c) 2013 MindSea. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@interface EditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (nonatomic, strong) MKPointAnnotation *annotation;

@end
