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
        self.direction = kBCDirectionMiddle;
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

- (NSNumber *) numberForGesture {
   return [BCGestureRegocnizer translateDirectionToNumber:self.direction];
}

+ (NSNumber *)translateDirectionToNumber:(BCDiagonalDirection)direction
{
    switch (direction) {
        case kBCDirectionMiddleToTopLeft:
            return [NSNumber numberWithInt:1];
            break;
        case kBCDirectionMiddleToTopMiddle:
            return [NSNumber numberWithInt:2];
            break;
        case kBCDirectionMiddleToTopRight:
            return [NSNumber numberWithInt:3];
            break;
            
        case kBCDirectionMiddle:
            return [NSNumber numberWithInt:5];
            break;
            
        case kBCDirectionMiddleToLeftMiddle:
            return [NSNumber numberWithInt:4];
            break;
            
        case kBCDirectionMiddleToMiddleRight:
            return [NSNumber numberWithInt:6];
            break;
            
        case kBCDirectionMiddleToBottomLeft:
            return [NSNumber numberWithInt:7];
            break;
            
        case kBCDirectionMiddleToBottomMiddle:
            return [NSNumber numberWithInt:8];
            break;
            
        case kBCDirectionMiddleToBottomRight:
            return [NSNumber numberWithInt:9];
            break;

        default:
            return nil;
            break;
    }
}

@end
