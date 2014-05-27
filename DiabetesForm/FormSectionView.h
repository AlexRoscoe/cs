//
//  FormSectionView.h
//  DiabetesForm
//
//  Created by Alex Roscoe on 2014-05-16.
//  Copyright (c) 2014 Garage Band Complex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormSectionView : UIView

@property (strong, nonatomic) NSString *sectionName;
@property (strong, nonatomic) NSArray *questions;
@property (strong, nonatomic) NSString *comments;

@end
