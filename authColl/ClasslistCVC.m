//
//  ClasslistCVC.m
//  authColl
//
//  Created by Joan Coyne on 10/8/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

#import "ClasslistCVC.h"

@interface ClasslistCVC ()

@property (nonatomic) BOOL cellColor;

@end

@implementation ClasslistCVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Set up dummy pictures
    //make this abstract later on, and fill in with API?
    
    _randomImages = [@[@"mzingabeeCloseup.jpg",
                       @"IMG_0140.jpg",
                       @"IMG_0187.jpg",
                       @"IMG_0201.jpg",
                       @"IMG_0204.jpg",
                       @"IMG_0223.jpg",
                       @"IMG_0561.jpg",
                       @"IMG_0066.jpg",
                       @"IMG_0095.jpg"] mutableCopy];
    
    NSDictionary *class = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"name", @"Great Class",
                           @"description", @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc lacus sapien, commodo vestibulum luctus quis, porttitor ac felis. Cras fermentum mi arcu, non vehicula dolor pharetra vitae. Donec vitae leo quis dolor feugiat tempor aliquam cursus est. Morbi quis posuere urna, ut pretium nulla. In velit dui, rutrum vitae laoreet a, blandit tempor dui. Donec sollicitudin accumsan lacinia. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; ",
                           @"image", @"mzingabeeCloseup.jpg",
                           @"created_at", @"Last Week",
                           @"updated_at", @"Today",
                           @"media", @"myURL",
                           @"commentsCount", @"5", nil];
    
    
}
#pragma mark -
#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:
(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _randomImages.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    classCVCCell *myCell = [collectionView
                            dequeueReusableCellWithReuseIdentifier:@"ClassCell"
                            forIndexPath:indexPath];
    
    UIImage *image;
    long row = [indexPath row];
    
    image = [UIImage imageNamed:_randomImages[row]];
    myCell.classXSmallImage.image = image;

    return myCell;
}

#pragma mark -
#pragma mark UICollectionViewDelegate

/*-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
 {
 UICollectionViewFlowLayout *myLayout =
 [[UICollectionViewFlowLayout alloc]init];
 
 myLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
 [self.collectionView setCollectionViewLayout:myLayout animated:YES];
 }*/
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    long row = [indexPath row];
    
    [_randomImages removeObjectAtIndex:row];
    
    NSArray *deletions = @[indexPath];
    
    [self.collectionView deleteItemsAtIndexPaths:deletions];
}



@end
