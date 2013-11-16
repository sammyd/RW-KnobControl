//
//  RWKnobControl.h
//  KnobControl
//
//  Created by Sam Davies on 15/11/2013.
//  Copyright (c) 2013 RayWenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWKnobControl : UIControl

#pragma mark - Knob value
/**
 Contains the current value
 */
@property (nonatomic, assign) CGFloat value;


/**
 Sets the value the knob should represented, with optional animation of the change.
 */
- (void)setValue:(CGFloat)value animated:(BOOL)animated;


#pragma mark - Value Limits
/**
 The minimum value of the knob. Defaults to 0.
 */
@property (nonatomic, assign) CGFloat minimumValue;

/**
 The maximum value of the knob. Defaults to 1.
 */
@property (nonatomic, assign) CGFloat maximumValue;


#pragma mark - Knob Behavior
/**
 Contains a Boolean value indicating whether changes in the value of the knob
 generate continuous update events. The default value is `YES`.
 */
@property (nonatomic, assign, getter = isContinuous) BOOL continuous;

@end
