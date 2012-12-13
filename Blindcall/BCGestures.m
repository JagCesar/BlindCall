//
//  BCGestures.m
//  Blindcall
//
//  Created by Emil Palm on 12/13/12.
//  Copyright (c) 2012 arcticminds. All rights reserved.
//

#import "BCGestures.h"


@interface BCGestureRegocnizer () {
    CGPoint startingLocation;
    CGPoint endLocation;
}
@end

@implementation BCGestureRegocnizer

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ( [touches count] == 1 ) {
        self.state = UIGestureRecognizerStateBegan;
        UITouch *touch = [touches anyObject];
        startingLocation = [touch locationInView:touch.view];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ( [touches count] == 1 ) {
        endLocation = [touch locationInView:touch.view];
        [self calculateDirection];
    }
}

- (void) calculateDirection {
    
}

@end
