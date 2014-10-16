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
@property (strong, nonatomic) NSString  *image;
@property (weak, nonatomic) IBOutlet UILabel *classTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *classDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *commentsTextField;
@property (strong, nonatomic) NSString *classTitleLabelText;
@property (strong, nonatomic) NSString *classDescriptionLabelText;


@end
