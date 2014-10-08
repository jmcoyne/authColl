//
//  AuthViewController.m
//  auth
//
//  Created by Joan Coyne on 8/20/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

#import "AuthViewController.h"
#import "APIFetcher.h"
#import "LandingPageVC.h"

@interface AuthViewController ()
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation AuthViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.userDidAuthenticate = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark Authentication - https post
- (IBAction)touchLogin:(UIButton *)sender {
    //   NSLog(@"Credentials:%@ %@\n", self.email.text, self.password.text);
    [self httpPostWithCustomDelegate];
}

-(void) httpPostWithCustomDelegate
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:@"https://test.lifeplot.com/api/v1/users/sign_in"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString * params =@"submit=true";
    params =[NSString stringWithFormat:@"email=%@&password=%@&submit=true", self.email.text, self.password.text];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                           NSLog(@"Response:%@ %@\n", response, error);
                                                           if(error == nil)
                                                           {
                                                               NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                               NSLog(@"Data = %@",text);
                                                               
                                                               NSDictionary *authCallResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                                                               NSLog(@"Auth Call results = %@", authCallResults);
                                                               NSString *successMessage = [authCallResults valueForKeyPath:AUTH_RESULTS_SUCCESS];
                                                               NSLog(@"Auth Call success = %@", successMessage);
                                                               if (successMessage.boolValue) {
                                                                   NSLog(@"We got in!");
                                                                   
                                                                   self.userDidAuthenticate   = true;
                                                                   self.userEmail = [authCallResults valueForKeyPath:AUTH_RESULTS_EMAIL];
                                                                   self.userAuthToken = [authCallResults valueForKeyPath:AUTH_RESULTS_AUTH_TOKEN];
                                                                   [self performSegueWithIdentifier: @"toTOC" sender: self];
                                                               }
                                                               else {
                                                                   self.userDidAuthenticate   = false;                                                             }
                                                           }
                                                           
                                                           
                                                       }];
    //  NSData *jsonResults = [NSData dataWithContentsOfURL:url];
    //  NSDictionary *propertyListResults = [NSJSONSerialization JSONObjectWithData:jsonResults options:0 error:NULL];
    //  NSLog(@"Flickr resulss = %@", propertyListResults);
    //  NSArray *photos = [propertyListResults valueForKeyPath:FLICKR_RESULTS_PHOTOS];
    [dataTask resume];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"Preparing to Segue AuthView");

    if ([segue.destinationViewController isKindOfClass:[LandingPageVC class]]) {
           NSLog(@"Correct Segue");
        
        if(self.userDidAuthenticate){
            LandingPageVC *lpvc = (LandingPageVC *)segue.destinationViewController;
            lpvc.userEmail = self.userEmail;
            lpvc.userAuthToken = self.userAuthToken;
            lpvc.title = segue.identifier;
        }
        else {
            NSLog(@"Login Failed");
        }
    }
    
    }



@end
