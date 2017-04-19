//
//  ViewController.m
//  FSLineChart
//
//  Created by JHH on 2017. 2. 16..
//  Copyright © 2017년 JHH. All rights reserved.
//

#import "ViewController.h"
#import "FSLineChart.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (retain, nonatomic) FSLineChart *lineChart2;
@property (weak, nonatomic) IBOutlet UIView *secondGraphView;

@end

@implementation ViewController
- (IBAction)changedValue:(id)sender {

    
    [UIView animateWithDuration:0.1
                     animations:^{
                         CGRect temp = self.secondView.frame;
                         temp.size.width = self.mySlider.value;
                         self.secondView.frame = temp;
                     }];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSArray* months = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July"];
    NSArray* chartData = @[[NSNumber numberWithInt:2], [NSNumber numberWithInt:5], [NSNumber numberWithInt:3], [NSNumber numberWithInt:2],[NSNumber numberWithInt:1], [NSNumber numberWithInt:4], [NSNumber numberWithInt:3]];
    
    self.mySlider.maximumValue = self.secondView.frame.size.width;
    
    FSLineChart* lineChart = [[FSLineChart alloc] initWithFrame:CGRectMake(0, 0, self.myView.frame.size.width, self.myView.frame.size.height)];
    [lineChart setChartData:chartData];
    [self.myView addSubview:lineChart];
    
    self.lineChart2 = [[FSLineChart alloc] initWithFrame:CGRectMake(0, 0, self.secondView.frame.size.width, self.secondView.frame.size.height)];
    self.lineChart2.fillColor = [UIColor redColor];
    self.lineChart2.color = [UIColor redColor];
    [self.lineChart2 setChartData:chartData];
    [self.secondGraphView addSubview:self.lineChart2];
    
    [self.mySlider setMinimumTrackTintColor:[UIColor redColor]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
