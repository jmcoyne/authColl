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
@property (weak, nonatomic) IBOutlet UIImageView *classImage;

@property (strong, nonatomic) NSString *userEmail;
@property (strong, nonatomic) NSString *userAuthToken;
@property (strong, nonatomic) NSString *contentAPIPath;
@property (strong, nonatomic) NSString *contentPredicate;
@property (strong, nonatomic) NSString *collectionTitle;


@property (strong, nonatomic) NSMutableArray *randomImages;
@property (strong, nonatomic) NSDictionary *class;

@end
