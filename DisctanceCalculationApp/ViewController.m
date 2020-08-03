//
//  ViewController.m
//  DisctanceCalculationApp
//
//  Created by Rajdeep Singh Dhingra on 03/08/20.
//  Copyright © 2020 Rajdeep Singh Dhingra. All rights reserved.
//

#import "ViewController.h"
#import "DistanceGetter/DGDistanceRequest.h"

@interface ViewController ()

@property (nonatomic) DGDistanceRequest *req;

@property (weak, nonatomic) IBOutlet UITextField *startLocation;

@property (weak, nonatomic) IBOutlet UITextField *endLocationA;
@property (weak, nonatomic) IBOutlet UILabel *distanceA;

@property (weak, nonatomic) IBOutlet UITextField *endLocationB;
@property (weak, nonatomic) IBOutlet UILabel *distanceB;

@property (weak, nonatomic) IBOutlet UITextField *endLocationC;
@property (weak, nonatomic) IBOutlet UILabel *distanceC;

@property (weak, nonatomic) IBOutlet UITextField *endLocationD;
@property (weak, nonatomic) IBOutlet UILabel *distanceD;


@property (weak, nonatomic) IBOutlet UISegmentedControl *unitSelector;

@property (weak, nonatomic) IBOutlet UIButton *calculateButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)calculatebuttonTapped:(id)sender {
    
    self.calculateButton.enabled = NO;
    
    self.req = [DGDistanceRequest alloc];
    NSString *start = self.startLocation.text;
    NSString *distA = self.endLocationA.text;
    NSString *distB = self.endLocationB.text;
    NSString *distC = self.endLocationC.text;
    NSString *distD = self.endLocationD.text;
    
    self.req = [self.req initWithLocationDescriptions:@[distA,distB,distC,distD] sourceDescription:start];
    __weak ViewController *weakself = self;
    self.req.callback = ^void(NSArray *dist)
    {
        ViewController *strongself = weakself;
        if(!strongself)
            return;
        NSNull *badresult = [NSNull null];
        if(dist[0]!=badresult)
        {
            double d = [dist[0] doubleValue];
            NSString *unit = @"meters";
            if(strongself.unitSelector.selectedSegmentIndex==1)
            {
                d = d/1000.0;
                unit = @"kms";
            }
            else if(strongself.unitSelector.selectedSegmentIndex==2)
            {
                d = d/1609.34;
                unit = @"miles";
            }
            strongself.distanceA.text = [NSString stringWithFormat:@"%.2f %@",d,unit];
        }
        else
            strongself.distanceA.text = @"Error";
        if(dist[1]!=badresult)
        {
            double d = [dist[1] doubleValue];
            NSString *unit = @"meters";
            if(strongself.unitSelector.selectedSegmentIndex==1)
            {
                d = d/1000.0;
                unit = @"kms";
            }
            else if(strongself.unitSelector.selectedSegmentIndex==2)
            {
                d = d/1609.34;
                unit = @"miles";
            }
            strongself.distanceB.text = [NSString stringWithFormat:@"%.2f %@",d,unit];
        }
        else
            strongself.distanceB.text = @"Error";
        if(dist[2]!=badresult)
        {
            double d = [dist[2] doubleValue];
            NSString *unit = @"meters";
            if(strongself.unitSelector.selectedSegmentIndex==1)
            {
                d = d/1000.0;
                unit = @"kms";
            }
            else if(strongself.unitSelector.selectedSegmentIndex==2)
            {
                d = d/1609.34;
                unit = @"miles";
            }
            strongself.distanceC.text = [NSString stringWithFormat:@"%.2f %@",d,unit];
        }
        else
            strongself.distanceC.text = @"Error";
        if(dist[3]!=badresult)
        {
            double d = [dist[3] doubleValue];
            NSString *unit = @"meters";
            if(strongself.unitSelector.selectedSegmentIndex==1)
            {
                d = d/1000.0;
                unit = @"kms";
            }
            else if(strongself.unitSelector.selectedSegmentIndex==2)
            {
                d = d/1609.34;
                unit = @"miles";
            }
            strongself.distanceD.text = [NSString stringWithFormat:@"%.2f %@",d,unit];
        }
        else
            strongself.distanceD.text = @"Error";
        strongself.req = nil;
        strongself.calculateButton.enabled=YES;
    };
    [self.req start];
}

@end
