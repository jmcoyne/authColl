//
//  SingleClassVC.h
//  authColl
//
//  Created by Joan Coyne on 10/14/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleClassVC : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *scImageView;
@property (weak, nonatomic) IBOutlet UILabel *classTitle;
@property (weak, nonatomic) IBOutlet UILabel *classDescription;
@property (weak, nonatomic) IBOutlet UITextField *comments;

@end
