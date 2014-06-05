//
//  SectionView.m
//  DiabetesForm
//
//  Created by Alex Roscoe on 2014-05-16.
//  Copyright (c) 2014 Garage Band Complex. All rights reserved.
//

#import "SectionView.h"
#import "InitiationForm.h"
#import "CheckAndLabelView.h"
#import "CommentView.h"
#import "QuestionView.h"

@interface SectionView()
// UI Properties
@property (strong, nonatomic) UILabel *sectionTitleLabel;
@property (strong, nonatomic) QuestionView *questionsView;
@property (strong, nonatomic) CommentView *commentView;
// Entity properties
//@property (strong, nonatomic) NSString *sectionName;
//@property (strong, nonatomic) NSArray *questions;
//@property (strong, nonatomic) NSString *comments;
@end

@implementation SectionView

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame name:(NSString *)name questions:(NSArray *)questions comments:(NSString *)comments
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // Title
        self.sectionTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 0)];
        self.sectionTitleLabel.text = @"Section: ";
        [self setSectionName:name];
        [self addSubview:self.sectionTitleLabel];
        
        // Question List
        self.questionsView = [[QuestionView alloc] initWithFrame:CGRectMake(0,
                                                                    self.sectionTitleLabel.frame.origin.y + self.sectionTitleLabel.frame.size.height,
                                                                    frame.size.width,
                                                                    0) questions:questions];
        
//        [self.questionsView resize];
        [self addSubview:self.questionsView];
        
        // Comments Footer
        self.commentView = [[CommentView alloc] initWithFrame:CGRectMake(0,
                                                                         self.questionsView.frame.origin.y + self.questionsView.frame.size.height,
                                                                         frame.size.width,
                                                                         0)
                                                         text:comments];
        [self.commentView resize]; 
        [self addSubview:self.commentView];
    }
    return self;
}

#pragma mark - Setters

/*
 * Sets the section label, ALSO sets the frame for the section view which will contain the questions and comments
 *
 */
- (void)setSectionName:(NSString *)sectionName
{
//    _sectionName = sectionName;
    self.sectionTitleLabel.text = sectionName;
    [self.sectionTitleLabel setNumberOfLines:0]; 
    [self.sectionTitleLabel sizeToFit];
}

/*
 * Resizes the view to fit all its subviews.
 * Returns the bottom of the view, used for placing the next section. 
 *
 */
- (float)resize
{
    float height = 0;
    height += self.sectionTitleLabel.frame.size.height;
    height += self.questionsView.frame.size.height;
    height += self.commentView.frame.size.height;

    [self setHeight:height];
    
    return height;
}




@end
