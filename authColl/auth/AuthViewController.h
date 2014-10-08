//
//  AuthViewController.h
//  auth
//
//  Created by Joan Coyne on 8/20/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AuthViewController : UIViewController
@property (nonatomic, strong) NSString *userEmail; // from login CURRENTLY HARDCODED (WITH PASSWORD)
@property (nonatomic, strong) NSString *userAuthToken; // from login
@property (nonatomic) BOOL userDidAuthenticate; // if true, succesful Login


@end
