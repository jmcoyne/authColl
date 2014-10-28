//
//  SingleClassVC.m
//  authColl
//
//  Created by Joan Coyne on 10/14/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

#import "SingleClassVC.h"
#import "ClasslistCVC.h"

@implementation SingleClassVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scImageView.image = [UIImage imageNamed:self.image];
    
    //self.classDescriptionLabel.text = self.classDescriptionText;
    self.classTitleLabel.text = self.classTitleLabelText;
    self.classDescriptionLabel.text = self.classDescriptionLabelText;
   
}

@end
