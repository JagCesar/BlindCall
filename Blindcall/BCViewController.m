//
//  BCViewController.m
//  Blindcall
//
//  Created by Emil Palm on 12/13/12.
//  Copyright (c) 2012 arcticminds. All rights reserved.
//

#import "BCViewController.h"

@interface BCViewController ()

@property (nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation BCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addString:(NSString*)string {
    [self.numberLabel setText:[NSString stringWithFormat:@"%@%@",[self.numberLabel text], string]];
}

- (void)removeLastChar {
    NSString *currString = [self.numberLabel text];
    NSString *newString = [currString substringWithRange:NSMakeRange(0, [currString length]-1)];
    [self.numberLabel setText:newString];
}

@end
