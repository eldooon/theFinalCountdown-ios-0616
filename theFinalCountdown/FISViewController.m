//
//  FISViewController.m
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (nonatomic) NSTimeInterval timeInterval;
@property (strong, nonatomic) NSTimer *countingDown;
@property (nonatomic) int remainder;
@property (nonatomic) int afterRemainder;
//@property (nonatomic) NSDate *timeStart;
//@property (nonatomic) int timeElapsed;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UIButton *resumeButton;


@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.timerLabel setHidden:YES];
    [self.resetButton setHidden:YES];
    [self.resumeButton setHidden:YES];
    
//    self.timeElapsed = 0;

    

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startButtonTapped:(id)sender {
    [self.pauseButton setEnabled:YES];
    [self.timerLabel setHidden:NO];
    [self.datePicker setHidden:YES];
    [self.resetButton setHidden:NO];
    [self.startButton setHidden:YES];
    
    self.timeInterval = self.datePicker.countDownDuration;
    self.remainder = self.timeInterval;
    self.afterRemainder = self.timeInterval - self.remainder%60;
    
    self.countingDown = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdown) userInfo:nil repeats:YES];
//    self.timeStart = [NSDate date];

    
}

- (IBAction)pauseButtonTapped:(id)sender {
    [self.countingDown invalidate];
    [self.resetButton setHidden:NO];
    [self.startButton setHidden:YES];
    [self.resumeButton setHidden:NO];
    [self.pauseButton setHidden:YES];
    
//    self.timeElapsed = [[NSDate date]timeIntervalSinceDate:self.timeStart];
}



- (IBAction)resetButtonTapped:(id)sender {
    [self.startButton setHidden:NO];
    [self.datePicker setHidden:NO];
    [self.timerLabel setHidden:YES];
    [self.resetButton setHidden:YES];
}

- (IBAction)resumeButtonTapped:(id)sender {
    [self.countingDown fire];
    [self.resetButton setHidden:NO];
    [self.resumeButton setHidden:YES];
    [self.startButton setHidden:YES];
    [self.pauseButton setHidden:NO];
}

-(void)countdown{
    
//    self.timeInterval = self.datePicker.countDownDuration;
    self.afterRemainder --;
    
    int hours = (self.afterRemainder/(60*60));
    int minutes = (self.afterRemainder/60)- (hours*60);
    int seconds = (self.afterRemainder - (60 * minutes) - (60 * hours * 60));
    
    NSString *stringVariable = [NSString stringWithFormat:@"%02li:%02li:%02li", (long)hours, (long)minutes,(long)seconds];

    self.timerLabel.text = stringVariable;
    NSLog(@"%@",stringVariable);
    
}


@end
