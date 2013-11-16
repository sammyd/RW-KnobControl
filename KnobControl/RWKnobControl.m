//
//  RWKnobControl.m
//  KnobControl
//
//  Created by Sam Davies on 15/11/2013.
//  Copyright (c) 2013 RayWenderlich. All rights reserved.
//

#import "RWKnobControl.h"

@implementation RWKnobControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blueColor];
        
        _minimumValue = 0.0;
        _maximumValue = 1.0;
        _value = 0.0;
        _continuous = YES;
    }
    return self;
}

#pragma mark - API Methods
- (void)setValue:(CGFloat)value animated:(BOOL)animated
{
    if(value != _value) {
        // Save the value to the backing ivar
        // Make sure we limit it to the requested bounds
        _value = MIN(self.maximumValue, MAX(self.minimumValue, value));
    }
}

#pragma mark - Property overrides
- (void)setValue:(CGFloat)value
{
    // Chain with the animation method version
    [self setValue:value animated:NO];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
