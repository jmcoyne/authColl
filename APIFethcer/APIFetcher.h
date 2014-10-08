//
//  APIFetcher.h
//  authColl
//
//  Created by Joan Coyne on 10/8/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

#import <Foundation/Foundation.h>

// key paths to data of API Auth results
#define AUTH_RESULTS_AUTH_TOKEN @"authenication_token"
#define AUTH_RESULTS_EMAIL @"email"
#define AUTH_RESULTS_SUCCESS @"success"

// keys (paths) to values in a courses dictionary
#define COURSES @"courses"


// keys (paths) to values in one course dictionary
#define COURSE_TITLE @"name"
#define SINGLE_COURSE_TITLE @".name"
#define COURSE_DESCRIPTION @"description"
#define COURSE_ID @"id"
#define COURSE_THUMBNAIL @"image.image.xsmall"
#define COURSE_UPDATED_AT @"updated_at"
#define COURSE_CREATED_AT @"created_at"



@interface APIFetcher : NSObject

+ (NSURL *)URLforClassList;
+ (NSURL *)URLforInformationAboutClass:(id)classId;
+ (NSURL *)URLforInformationAboutClassHardcoded;

@end
