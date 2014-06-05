//
//  SectionView.h
//  DiabetesForm
//
//  Created by Alex Roscoe on 2014-05-16.
//  Copyright (c) 2014 Garage Band Complex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormElement.h"

@interface SectionView : FormElement

- (id)initWithFrame:(CGRect)frame name:(NSString *)name questions:(NSArray *)questions comments:(NSString *)comments;
- (float)resize;

@end
