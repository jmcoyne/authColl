//
//  LandingPageVC.m
//  authColl
//
//  Created by Joan Coyne on 10/8/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

#import "LandingPageVC.h"
#import "ClasslistCVC.h"
#import "APIFetcher.h"


@interface LandingPageVC ()

@end

@implementation LandingPageVC


- (IBAction)touchGetClassList:(UIButton *)sender {
    
    //Set the REST URL to get a list of all classes
   self.contentAPIPath = @"URLforClassList";
    self.title = @"All Classes";
    [self performSegueWithIdentifier: @"toClasses" sender: self];
    
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Preparing to Segue LandingPAge");

    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.destinationViewController isKindOfClass:[ClasslistCVC class]]) {
        
        ClasslistCVC *clcvc = (ClasslistCVC *)segue.destinationViewController;
        clcvc.userEmail = self.userEmail;
        clcvc.userAuthToken = self.userAuthToken;
        clcvc.contentAPIPath = segue.identifier;
        clcvc.title = self.title;
        
        
    }
    
}



@end
