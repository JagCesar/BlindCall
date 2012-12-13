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

- (id)initWithTarget:(id)target action:(SEL)action
{
    self = [super initWithTarget:target action:action];
    if ( self )
    {
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ( self.numberOfTouches == 1 ) {
        self.state = UIGestureRecognizerStateBegan;
        self.direction = kBCDirectionMiddle;
        UITouch *touch = [touches anyObject];
        startingLocation = [touch locationInView:touch.view];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ( self.numberOfTouches == 1 ) {
        endLocation = [touch locationInView:touch.view];
        [self calculateDirection];
        self.state = UIGestureRecognizerStateRecognized;
    } else {
        self.state = UIGestureRecognizerStateFailed;
    }
}

- (void) calculateDirection {
    
    CGFloat xDist = endLocation.x - startingLocation.x;
    CGFloat yDist = endLocation.y - startingLocation.y;
    
//    NSLog(@"dist: %f", sqrt((xDist*xDist)+(yDist*yDist)));
    
    float dist = sqrt((xDist*xDist)+(yDist*yDist));
    if ( dist < 25.0f) {
        [self setDirection:kBCDirectionMiddle];
        return;
    }
    
    double angle = atan2(endLocation.y - startingLocation.y, endLocation.x-startingLocation.x)*180/M_PI;
    
    if (-112.5f < angle && angle < -67.5f) {
        [self setDirection:kBCDirectionMiddleToTopMiddle];
    } else if (-67.5f < angle && angle < -22.5 ) {
        [self setDirection:kBCDirectionMiddleToTopRight];
    } else if (-22.5f < angle && angle < 22.5f) {
        [self setDirection:kBCDirectionMiddleToMiddleRight];
    } else if (22.5f < angle && angle < 67.5f) {
        [self setDirection:kBCDirectionMiddleToBottomRight];
    } else if (67.5f < angle && angle < 112.5f) {
        [self setDirection:kBCDirectionMiddleToBottomMiddle];
    } else if (112.5 < angle && angle < 157.5f) {
        [self setDirection:kBCDirectionMiddleToBottomLeft];
    } else if ((157.5f < angle && angle < 180.0f) || (-180.0f < angle && angle < -157.5f)) {
        [self setDirection:kBCDirectionMiddleToLeftMiddle];
    } else if (-157.5f < angle && angle < -112.5f) {
        [self setDirection:kBCDirectionMiddleToTopLeft];
    }
    
    if ( endLocation.y >= [[UIScreen mainScreen] bounds].size.height-25 )
        [self setDirection:kBCDirectionMiddleBottom];
        
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
            
        case kBCDirectionMiddleBottom:
            return [NSNumber numberWithInt:0];
            break;

        default:
            return nil;
            break;
    }
}

@end
