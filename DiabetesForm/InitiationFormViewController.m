//
//  TestViewController.m
//  DiabetesForm
//
//  Created by Alex Roscoe on 2014-05-12.
//  Copyright (c) 2014 Garage Bane Complex. All rights reserved.
//

#import "InitiationFormViewController.h"
#import "InitiationForm.h"
#import "FormHeaderView.h"
#import "FormSectionView.h"

@interface InitiationFormViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *formView;
@property (nonatomic) BOOL isLoadingAnExistingForm;

@end

@implementation InitiationFormViewController

#pragma mark - CONSTANTS
#define MARGIN 20.0
#define SPACING 50.0

#pragma mark - Initialization

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.scrollView setContentSize:self.formView.frame.size];
    
    if (self.isLoadingAnExistingForm) {
        [self loadExistingForm];
    } else {
        [self loadNewFormFromTemplate];
    }
}

- (void)loadExistingForm
{
   
}

- (void)loadNewFormFromTemplate
{
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"initiationForm" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    // Add Header
    FormHeaderView *headerView = [[FormHeaderView alloc] initWithFrame:CGRectMake(MARGIN,
                                                                                  SPACING,
                                                                                  (self.formView.frame.size.width - MARGIN),
                                                                                  100)];
    [self.formView addSubview:headerView];
    
    headerView.title = [dict valueForKeyPath:INITIATION_FORM_TITLE];
    headerView.patientName = [dict valueForKeyPath:INITIATION_FORM_PATIENT_NAME];
    headerView.date = [dict valueForKeyPath:INITIATION_FORM_DATE];
    
    UIView *previousView = headerView;
    // Add Sections
    NSArray *sections = [dict valueForKeyPath:INITIATION_FORM_SECTIONS];
    for (int i = 0; i < sections.count; i++) {
        FormSectionView *sectionView = [[FormSectionView alloc] initWithFrame:CGRectMake(MARGIN,
                                                                                        previousView.frame.origin.y + previousView.frame.size.height + SPACING,
                                                                                        self.formView.frame.size.width,
                                                                                        100)];
        sectionView.sectionName = [sections[i] valueForKeyPath:INITIATION_FORM_SECTION_NAME];
        sectionView.questions = [sections[i] valueForKeyPath:INITIATION_FORM_SECTION_QUESTIONS];
        [self.formView addSubview:sectionView];
        previousView = sectionView; 
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Database


#pragma mark - Segue

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
