//
//  BCViewController.m
//  Blindcall
//
//  Created by Emil Palm on 12/13/12.
//  Copyright (c) 2012 arcticminds. All rights reserved.
//

#import "BCViewController.h"
#import "BCGestures.h"

@interface BCViewController ()
@property(nonatomic,strong) BCGestureRegocnizer *gestureRecoginizer;
@end

@implementation BCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.gestureRecoginizer = [[BCGestureRegocnizer alloc] initWithTarget:self action:@selector(didFindDirection:)];
    [self.view addGestureRecognizer:self.gestureRecoginizer];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) didFindDirection: (BCGestureRegocnizer *) recognizer {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
