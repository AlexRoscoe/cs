//
//  TestViewController.m
//  DiabetesForm
//
//  Created by Alex Roscoe on 2014-05-12.
//  Copyright (c) 2014 Garage Bane Complex. All rights reserved.
//

#import "InitiationFormViewController.h"

@interface InitiationFormViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *formView;

@end

@implementation InitiationFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Remove formView from main view
    [self.formView removeFromSuperview];
    // Add to scroll View
    [self.scrollView addSubview:self.formView];
    [self.scrollView setContentSize:self.formView.frame.size];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
