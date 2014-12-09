//
//  ClasslistCVC.h
//  authColl
//
//  Created by Joan Coyne on 10/8/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "classCVCCell.h"

@interface ClasslistCVC : UICollectionViewController
<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) NSString *userEmail;
@property (strong, nonatomic) NSString *userAuthToken;
@property (strong, nonatomic) NSString *contentAPIPath;
@property (strong, nonatomic) NSString *contentPredicate;
@property (strong, nonatomic) NSString *collectionTitle;


@property (strong, nonatomic) NSMutableArray *randomImages;
@property (strong, nonatomic) NSDictionary *class;
@property (nonatomic, strong) NSMutableArray *classes; // of all class type NSArrays
@property (nonatomic, strong) NSMutableArray *myClasses; // of class NSDictionarys
@property (nonatomic, strong) NSMutableArray *suggestedClasses; // of class NSDictionarys


@end
