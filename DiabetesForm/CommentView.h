//
//  CommentView.h
//  DiabetesForm
//
//  Created by Alex Roscoe on 2014-06-05.
//  Copyright (c) 2014 Garage Band Complex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormElement.h"

@interface CommentView : FormElement

- (id)initWithFrame:(CGRect)frame text:(NSString *)comments;

- (float)resize;

@end
