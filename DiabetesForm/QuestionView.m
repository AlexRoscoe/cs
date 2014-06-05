//
//  QuestionView.m
//  DiabetesForm
//
//  Created by Alex Roscoe on 2014-06-05.
//  Copyright (c) 2014 Garage Bane Complex. All rights reserved.
//

#import "QuestionView.h"
#import "CheckAndLabelView.h"
#import "InitiationForm.h"

@implementation QuestionView

- (id)initWithFrame:(CGRect)frame questions:(NSArray *)questions
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor grayColor];
//        [self setAlpha:0.5];
        self.layer.cornerRadius = 5.0;
        [self setOpaque:NO];
        
        [self processQuestions:questions];
        
    }
    return self;
}

/*
 * Creates and places the questions on the form.
 * Requires sectionView to have been set, this currently happens in setSectionName
 *
 */
- (void)processQuestions:(NSArray *)questions
{
    //    _questions = questions;
    CGPoint bottomOfLastElement = CGPointMake(0, SPACING);
    
    for (int i = 0; i < questions.count; i++) {
        NSDictionary *question = questions[i];
        NSString *type = [question valueForKeyPath:INITIATION_FORM_QUESTION_TYPE];
        // Create question
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
        [self setHeight:bottomOfLastElement.y];
    }
}



#pragma mark - Question Types

- (CGPoint)addSingleCheckQuestion:(NSString *)title text:(NSString *)text withVal:(BOOL)isChecked atPoint:(CGPoint)origin
{
    CheckAndLabelView *question = [[CheckAndLabelView alloc] initWithFrame:CGRectMake(origin.x,
                                                                                      origin.y,
                                                                                      self.frame.size.width - origin.x,
                                                                                      0)
                                                                      text:text];
    float questionHeight = [question resize];
    [self addSubview:question];
    
    return CGPointMake(origin.x, origin.y + questionHeight);
}

- (CGPoint)addMultiCheckQuestion:(NSString *)title text:(NSString *)text withSubQuestions:(NSArray *)subQuestions atPoint:(CGPoint)origin
{
    CheckAndLabelView *question = [[CheckAndLabelView alloc] initWithFrame:CGRectMake(origin.x,
                                                                                      origin.y,
                                                                                      self.frame.size.width - origin.x,
                                                                                      0)
                                                                      text:text];
    float questionHeight = [question resize];
    [self addSubview:question];
    
    CGPoint bottomOfLastElement = CGPointMake(4 * SPACING, question.frame.origin.y + question.frame.size.height + SPACING);
    for (int i = 0; i < subQuestions.count; i++) {
        NSDictionary *question = subQuestions[i];
        bottomOfLastElement = [self addSingleCheckQuestion:[question valueForKeyPath:INITIATION_FORM_QUESTION_TITLE]
                                                      text:[question valueForKeyPath:INITIATION_FORM_QUESTION_TEXT]
                                                   withVal:[question valueForKeyPath:INITIATION_FORM_QUESTION_CHECKED]
                                                   atPoint:bottomOfLastElement];
        bottomOfLastElement.y += SPACING;
    }
    
    return CGPointMake(origin.x, bottomOfLastElement.y);
}

@end
