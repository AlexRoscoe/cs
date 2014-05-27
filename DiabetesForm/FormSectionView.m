//
//  FormSectionView.m
//  DiabetesForm
//
//  Created by Alex Roscoe on 2014-05-16.
//  Copyright (c) 2014 Garage Band Complex. All rights reserved.
//

#import "FormSectionView.h"
#import "InitiationForm.h"

@interface FormSectionView()
@property (strong, nonatomic) UILabel *sectionTitleLabel;
@property (strong, nonatomic) UIView *sectionView;
@end

@implementation FormSectionView

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.sectionTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 0)];
        self.sectionTitleLabel.text = @"Section: ";
        [self addSubview:self.sectionTitleLabel];
        
        self.sectionView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                    self.sectionTitleLabel.frame.origin.y + self.sectionTitleLabel.frame.size.height,
                                                                    frame.size.width,
                                                                    100)];
        self.sectionView.backgroundColor = [UIColor grayColor];
        [self.sectionView setAlpha:0.5];
        self.sectionView.layer.cornerRadius = 5.0;
        [self.sectionView setOpaque:NO];
        [self addSubview:self.sectionView];
    }
    return self;
}

#pragma mark - Setters

- (void)setSectionName:(NSString *)sectionName
{
    _sectionName = sectionName;
    self.sectionTitleLabel.text = sectionName;
    [self.sectionTitleLabel setNumberOfLines:0]; 
    [self.sectionTitleLabel sizeToFit];
    self.sectionView.frame = CGRectMake(0,
                                       self.sectionTitleLabel.frame.origin.y + self.sectionTitleLabel.frame.size.height,
                                       self.frame.size.width,
                                       100);
    [self setNeedsDisplay];
}


- (void)setQuestions:(NSArray *)questions
{
    _questions = questions;
    float SPACING = 20;
    CGPoint bottomOfLastElement = CGPointMake(0, 0);
    for (int i = 0; i < questions.count; i++) {
        NSDictionary *question = questions[i];
        NSString *type = [question valueForKeyPath:INITIATION_FORM_QUESTION_TYPE];
        if ([type isEqualToString:INITIATION_FORM_QUESTION_TYPE_SINGLE_CHECK]) {
            bottomOfLastElement = [self addSingleCheckQuestion:[question valueForKeyPath:INITIATION_FORM_QUESTION_TITLE]
                                                          text:[question valueForKeyPath:INITIATION_FORM_QUESTION_TEXT]
                                                       withVal:[question valueForKeyPath:INITIATION_FORM_QUESTION_CHECKED]
                                                       atPoint:bottomOfLastElement];
        } else if ([type isEqualToString:INITIATION_FORM_QUESTION_TYPE_MULTI_CHECK]) {
            bottomOfLastElement = [self addMultiCheckQuestion:[question valueForKeyPath:INITIATION_FORM_QUESTION_TITLE]
                                                         text:[question valueForKeyPath:INITIATION_FORM_QUESTION_TEXT]
                                             withSubQuestions:[question valueForKeyPath:INITIATION_FORM_QUESTION_MULTI_CHECK_SUB_QUESTIONS]
                                                      atPoint:bottomOfLastElement];
        }
        bottomOfLastElement.y += SPACING;
    }
    [self.sectionView sizeToFit];
}

#pragma mark - Question Types

- (CGPoint)addSingleCheckQuestion:(NSString *)title text:(NSString *)text withVal:(BOOL)isChecked atPoint:(CGPoint)origin
{
    UISwitch *checkBox = [[UISwitch alloc] initWithFrame:CGRectMake(origin.x, origin.y, 20, 20)];
    [self.sectionView addSubview:checkBox]; 
    
    return CGPointMake(0, checkBox.frame.origin.y + checkBox.frame.size.height);
}

- (CGPoint)addMultiCheckQuestion:(NSString *)title text:(NSString *)text withSubQuestions:(NSArray *)subQuestions atPoint:(CGPoint)origin
{
    UISwitch *checkBox = [[UISwitch alloc] initWithFrame:CGRectMake(origin.x, origin.y, 20, 20)];
    [self.sectionView addSubview:checkBox];
    
    return CGPointMake(0, checkBox.frame.origin.y + checkBox.frame.size.height);
}

#pragma mark - Drawing

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
