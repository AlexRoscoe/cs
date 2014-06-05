//
//  CommentView.m
//  DiabetesForm
//
//  Created by Alex Roscoe on 2014-06-05.
//  Copyright (c) 2014 Garage Band Complex. All rights reserved.
//

#import "CommentView.h"

@interface CommentView()
@property (strong, nonatomic) UILabel *headerLabel;
@property (strong, nonatomic) UITextView *commentView;
@end

@implementation CommentView

- (id)initWithFrame:(CGRect)frame text:(NSString *)comments
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0)];
        self.headerLabel.text = @"Notes:";
        self.headerLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
        [self.headerLabel sizeToFit];
        [self addSubview:self.headerLabel];
        
        self.commentView = [[UITextView alloc] initWithFrame:CGRectMake(0,
                                                                        self.headerLabel.frame.origin.y + self.headerLabel.frame.size.height,
                                                                        frame.size.width,
                                                                        100)];
        self.commentView.backgroundColor = [[UIColor alloc] initWithRed:253/255.f green:255/255.f blue:207/255.f alpha:1];
        self.commentView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        self.commentView.text = comments;
        [self addSubview:self.commentView];
    }
    return self;
}

- (float)resize
{
    float height = 0;
    height += self.headerLabel.frame.size.height;
    height += self.commentView.frame.size.height;
    [self setHeight:height]; 
    return height;
}

@end
