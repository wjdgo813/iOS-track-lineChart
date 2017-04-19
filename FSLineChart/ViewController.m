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

@property (weak, nonatomic) IBOutlet UIView *fillBackgroundView;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (retain, nonatomic) FSLineChart *fillLineChart;
@property (retain, nonatomic) FSLineChart *backgroundLineChart;

@property (weak, nonatomic) IBOutlet UIView *backgroundGraphView;

@end

@implementation ViewController
- (IBAction)changedValue:(id)sender {

    float sliderRange = self.mySlider.frame.size.width - self.mySlider.currentThumbImage.size.width;
    float sliderOrigin = self.mySlider.frame.origin.x + (self.mySlider.currentThumbImage.size.width / 2.0);
    float sliderValueToPixels = (((self.mySlider.value - self.mySlider.minimumValue)/(self.mySlider.maximumValue - self.mySlider.minimumValue)) * sliderRange) + sliderOrigin;
    
    int tempInt =90;
    
    if(!isnan(sliderValueToPixels)){
        dispatch_async(dispatch_get_main_queue(), ^{
            CGRect temp = self.fillBackgroundView.frame;
            temp.size.width = sliderValueToPixels-tempInt;
            self.fillBackgroundView.frame = temp;
        });
    }
//http://stackoverflow.com/questions/1714405/how-to-get-the-center-of-the-thumb-image-of-uislider
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.mySlider.maximumValue = self.fillBackgroundView.frame.size.width;
    
    self.fillBackgroundView.frame = CGRectMake(0, 0, self.fillBackgroundView.frame.size.width, self.fillBackgroundView.frame.size.height);
    
    NSArray* chartData = @[[NSNumber numberWithInt:2], [NSNumber numberWithInt:5], [NSNumber numberWithInt:3], [NSNumber numberWithInt:2],[NSNumber numberWithInt:1], [NSNumber numberWithInt:4], [NSNumber numberWithInt:3]];
    
    
    
    self.backgroundLineChart = [[FSLineChart alloc] initWithFrame:CGRectMake(0, 0, self.myView.frame.size.width, self.myView.frame.size.height)];
    self.backgroundLineChart.color = [UIColor grayColor];
    [self.backgroundLineChart setChartData:chartData];
    [self.backgroundGraphView addSubview:self.backgroundLineChart];
    
    
    self.fillLineChart = [[FSLineChart alloc] initWithFrame:CGRectMake(0, 0, self.fillBackgroundView.frame.size.width, self.fillBackgroundView.frame.size.height)];
    self.fillLineChart.color = [UIColor blueColor];
    [self.fillLineChart setChartData:chartData];
    
    [self.myView addSubview:self.fillLineChart];
    
    [self.mySlider setMinimumTrackTintColor:[UIColor redColor]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
