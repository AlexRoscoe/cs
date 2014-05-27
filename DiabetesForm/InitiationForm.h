//
//  InitiationForm.h
//  DiabetesForm
//
//  Created by Alex Roscoe on 2014-05-15.
//  Copyright (c) 2014 Garage Bane Complex. All rights reserved.
//

#ifndef DiabetesForm_InitiationForm_h
#define DiabetesForm_InitiationForm_h

// key paths for top level form
#define INITIATION_FORM_NAME @"formName"
#define INITIATION_FORM_TITLE @"title"
#define INITIATION_FORM_DATE @"date"

// key paths for patient info
#define INITIATION_FORM_PATIENT_INFO @"patientInfo"
#define INITIATION_FORM_PATIENT_NAME @"patientInfo.name"

// key paths for sections
#define INITIATION_FORM_SECTIONS @"sections"

// paths for any section
#define INITIATION_FORM_SECTION_NAME @"sectionName"
#define INITIATION_FORM_SECTION_QUESTIONS @"questions"
#define INITIATION_FORM_SECTION_COMMENTS @"comments"

// paths for any question
#define INITIATION_FORM_QUESTION_TITLE @"title"
#define INITIATION_FORM_QUESTION_TEXT @"text"
#define INITIATION_FORM_QUESTION_TYPE @"type"
#define INITIATION_FORM_QUESTION_CHECKED @"checked"

// paths for multi-question types
#define INITIATION_FORM_QUESTION_MULTI_CHECK_SUB_QUESTIONS @"subChecks"

// Definitions for question types
#define INITIATION_FORM_QUESTION_TYPE_SINGLE_CHECK @"SINGLE_CHECK"
#define INITIATION_FORM_QUESTION_TYPE_MULTI_CHECK @"MULTI_CHECK"

#endif
