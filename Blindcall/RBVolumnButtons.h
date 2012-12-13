//
//  RBVolumeButtons.h
//  VolumeSnap
//
//  Created by Randall Brown on 11/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ButtonBlock)();

@interface RBVolumeButtons : NSObject
{
    float launchVolume;
    BOOL hadToLowerVolume;
    BOOL hadToRaiseVolume;
    BOOL justEnteredForeground;
}

@property (nonatomic, copy) ButtonBlock upBlock;
@property (nonatomic, copy) ButtonBlock downBlock;
@property (readonly) float launchVolume;

@end