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
#import "RBVolumnButtons.h"
@interface BCViewController ()
@property(nonatomic,strong) BCGestureRegocnizer *gestureRecoginizer;
@property(nonatomic,strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic) IBOutlet UILabel *numberLabel;
@property(nonatomic,strong) RBVolumeButtons *buttons;
@end

@implementation BCViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.buttons = [[RBVolumeButtons alloc] init];
    self.gestureRecoginizer = [[BCGestureRegocnizer alloc] initWithTarget:self action:@selector(didFindDirection:)];
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
    self.tapGesture.numberOfTapsRequired = 2;
    
    [self.buttons setUpBlock:^{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",self.numberLabel.text]]];
    }];
    
    [self.buttons setDownBlock:^{
        NSInteger length = [self.numberLabel.text length];
        if ( length > 0 )
        {
            [self.numberLabel setText: [self.numberLabel.text substringWithRange:NSMakeRange(0, length-1)]];
        }
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clear) name:@"didShake" object:nil];
    
    [self.view addGestureRecognizer:self.tapGesture];
    [self.view addGestureRecognizer:self.gestureRecoginizer];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) didFindDirection: (BCGestureRegocnizer *) recognizer {
    if ( recognizer.state == UIGestureRecognizerStateRecognized )
        [self addString:[[recognizer numberForGesture] description]];
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

- (void) didTap: (UITapGestureRecognizer *) tap {
    
}

@end
