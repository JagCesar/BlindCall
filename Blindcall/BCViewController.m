//
//  BCViewController.m
//  Blindcall
//
//  Created by Emil Palm on 12/13/12.
//  Copyright (c) 2012 arcticminds. All rights reserved.
//

#import "BCViewController.h"
#import "BCGestures.h"
#import <AudioToolbox/AudioToolbox.h>

@interface BCViewController ()
@property(nonatomic,strong) BCGestureRegocnizer *gestureRecoginizer;
@property (nonatomic) IBOutlet UILabel *numberLabel;
@end

@implementation BCViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.gestureRecoginizer = [[BCGestureRegocnizer alloc] initWithTarget:self action:@selector(didFindDirection:)];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clear) name:@"didShake" object:nil];
    [self.view addGestureRecognizer:self.gestureRecoginizer];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) didFindDirection: (BCGestureRegocnizer *) recognizer {
    if ( recognizer.state != UIGestureRecognizerStateRecognized )
        [self addString:[[recognizer numberForGesture] description]];
}

- (void) didDoubleTap: (UITapGestureRecognizer *)tap
{
    [self clear];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addString:(NSString*)string {
    [self.numberLabel setText:[NSString stringWithFormat:@"%@%@",[self.numberLabel text], string]];
    AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
}

- (void)removeLastChar {
    NSString *currString = [self.numberLabel text];
    NSString *newString = [currString substringWithRange:NSMakeRange(0, [currString length]-1)];
    [self.numberLabel setText:newString];
}

- (void) clear {
    [self.numberLabel setText:@""];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
        usleep(1000);
        AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
    });
}


@end
