//
//  CheckAndLabelView.m
//  DiabetesForm
//
//  Created by Alex Roscoe on 2014-06-05.
//  Copyright (c) 2014 Garage Band Complex. All rights reserved.
//

#import "CheckAndLabelView.h"

@interface CheckAndLabelView()
@property (strong, nonatomic) UISwitch *checkbox;
@property (strong, nonatomic) UILabel *textLabel;
@end

@implementation CheckAndLabelView

- (id)initWithFrame:(CGRect)frame text:(NSString *)text
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization Code
        
        // Create and add the checkbox:
        self.checkbox = [[UISwitch alloc] init];
        [self addSubview:self.checkbox];
        
        // Create and add the text label:
        float startPoint = self.checkbox.frame.origin.x + self.checkbox.frame.size.width + SPACING;
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(startPoint,
                                                                   0,
                                                                   self.frame.size.width - startPoint,
                                                                   0)];
        self.textLabel.text = text;
        self.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        [self addSubview:self.textLabel]; 
        
        
    }
    return self;
}

- (float)resize
{
    [self.textLabel sizeToFit];
    float height = (self.textLabel.frame.size.height > self.checkbox.frame.size.height) ? self.textLabel.frame.size.height : self.checkbox.frame.size.height;
    [self setHeight:height];
    return height;
}

@end
