//
//  HeaderView.m
//  DiabetesForm
//
//  Created by Alex Roscoe on 2014-05-15.
//  Copyright (c) 2014 Garage Band Complex. All rights reserved.
//

#import "HeaderView.h"
#import "Constants.h"

@interface HeaderView()
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *patientNameLabel;
@property (strong, nonatomic) UILabel *dateLabel;
@end

@implementation HeaderView

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                   0,
                                                                   frame.size.width,
                                                                   self.frame.size.height/4)];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.titleLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
        
        self.patientNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                          self.titleLabel.frame.size.height + SPACING,
                                                                          frame.size.width/2,
                                                                          self.frame.size.height/4)];
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2,
                                                                   self.titleLabel.frame.size.height + SPACING,
                                                                   frame.size.width/2,
                                                                   self.frame.size.height/4)];
        [self.dateLabel setTextAlignment:NSTextAlignmentRight]; 
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.patientNameLabel];
        [self addSubview:self.dateLabel];
    }
    return self;
}

#pragma mark - Setters
- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
    [self setNeedsDisplay];
}

- (void)setPatientName:(NSString *)patientName
{
    _patientName = patientName;
    self.patientNameLabel.text = [NSString stringWithFormat:@"Patient: %@", patientName];
    [self setNeedsDisplay];
}

- (void)setDate:(NSDate *)date
{
    _date = date;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    [df setDateFormat:@"dd"];
    NSString *day = [df stringFromDate:date];
    
    [df setDateFormat:@"MMM"];
    NSString *month = [df stringFromDate:date];
    
    [df setDateFormat:@"yyyy"];
    NSString *year = [df stringFromDate:date];
    self.dateLabel.text = [NSString stringWithFormat:@"Date: %@ %@, %@", month, day, year];
    [self setNeedsDisplay];
}

#pragma mark - Drawing

//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//    
//}


@end
