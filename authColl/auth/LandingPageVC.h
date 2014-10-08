//
//  LandingPageVC.h
//  authColl
//
//  Created by Joan Coyne on 10/8/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LandingPageVC : UIViewController
@property (strong, nonatomic) NSString *userEmail;
@property (strong, nonatomic) NSString *userAuthToken;
@property (strong, nonatomic) NSString *contentAPIPath;
@property (strong, nonatomic) NSString *contentPredicate;

@end
