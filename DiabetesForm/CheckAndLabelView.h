//
//  CheckAndLabelView.h
//  DiabetesForm
//
//  Created by Alex Roscoe on 2014-06-05.
//  Copyright (c) 2014 Garage Band Complex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormElement.h"

@interface CheckAndLabelView : FormElement

// A CheckAndLabelView is immutable. As it will allocate the space it
// needs on initiailization. But once it has been placed it does not
// make sense to then modify its text as that would change size. With
// other elements presumably having been placed this would be catastrophic.

/* 
 * Initializes the view with the given frame. The height will initially be 
 * set to zero. Call resize to have the view size itself to fit the given
 * text. 
 */
- (id)initWithFrame:(CGRect)frame text:(NSString *)text;

/* 
 * This causes the view to resize itself to fit all the text contained in the
 * label given the current system font.
 *
 * @return - The height of the view
 */
- (float)resize;

@end
