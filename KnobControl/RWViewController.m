//
//  RWViewController.m
//  KnobControl
//
//  Created by Sam Davies on 14/11/2013.
//  Copyright (c) 2013 RayWenderlich. All rights reserved.
//

#import "RWViewController.h"

@implementation RWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.knobControl.lineWidth = 4.0;
    self.knobControl.pointerLength = 8.0;
    self.view.tintColor = [UIColor redColor];
    
    [self.knobControl addObserver:self forKeyPath:@"value" options:0 context:NULL];
    
    // Hooks up the knob control
    [self.knobControl addTarget:self
                         action:@selector(handleValueChanged:)
               forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleValueChanged:(id)sender {
    if(sender == self.valueSlider) {
        self.knobControl.value = self.valueSlider.value;
    } else if(sender == _knobControl) {
        self.valueSlider.value = self.knobControl.value;
    }
}

- (IBAction)handleRandomButtonPressed:(id)sender {
    // Generate random value
    CGFloat randomValue = (arc4random() % 101) / 100.f;
    // Then set it on the two controls
    [self.knobControl setValue:randomValue animated:self.animateSwitch.on];
    [self.valueSlider setValue:randomValue animated:self.animateSwitch.on];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(object == self.knobControl && [keyPath isEqualToString:@"value"]) {
        self.valueLabel.text = [NSString stringWithFormat:@"%0.2f", self.knobControl.value];
    }
}
@end
