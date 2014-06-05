//
//  FormElement.m
//  DiabetesForm
//
//  Created by Alex Roscoe on 2014-06-05.
//  Copyright (c) 2014 Garage Bane Complex. All rights reserved.
//

#import "FormElement.h"

@implementation FormElement

- (void)setHeight:(float)height
{
    [self setFrame:CGRectMake(self.frame.origin.x,
                              self.frame.origin.y,
                              self.frame.size.width,
                              height)];
}

@end
