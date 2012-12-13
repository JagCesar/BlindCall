//
//  BCGestures.h
//  Blindcall
//
//  Created by Emil Palm on 12/13/12.
//  Copyright (c) 2012 arcticminds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

typedef enum {
    kBCDirectionMiddle,
    kBCDirectionMiddleToTopMiddle,
    kBCDirectionMiddleToTopRight,
    kBCDirectionMiddleToMiddleRight,
    kBCDirectionMiddleToBottomRight,
    kBCDirectionMiddleToBottomMiddle,
    kBCDirectionMiddleToBottomLeft,
    kBCDirectionMiddleToLeftMiddle,
    kBCDirectionMiddleToTopLeft,
} BCDiagonalDirection;

@interface BCGestureRegocnizer : UIGestureRecognizer
@property(nonatomic,assign) BCDiagonalDirection direction;
+ (NSNumber *) translateDirectionToNumber: (BCDiagonalDirection) direction;
@end