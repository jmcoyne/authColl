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


#pragma mark - abstract-ish  class fetch classes happens in subclass viewDidLoad
// whenever our Model is set, must update our View

- (void)setClasses:(NSMutableArray *)classes
{
    //_randomImages = randomImages;
    _classes = classes;
    [self.collectionView  reloadData];
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
    NSLog(@"How many Classes? %d", _classes.count);
    return _classes.count;
    
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    classCVCCell *myCell = [collectionView
                            dequeueReusableCellWithReuseIdentifier:@"ClassCell"
                            forIndexPath:indexPath];
    
   // works with random inage code
   /* UIImage *image;
    long row = [indexPath row];
    
    image = [UIImage imageNamed:_randomImages[row]];
    myCell.classXSmallImage.image = image; */

   NSDictionary *class = self.classes[indexPath.row];
    
    UIImage *image;
    NSString *imageName = [class valueForKeyPath:@"image"];
    NSLog(@"Here's my name %@", imageName);
    image = [UIImage imageNamed:[class valueForKeyPath:@"image"]];
    // image = [UIImage imageNamed:imageName];
    myCell.imageView.image = image;
    return myCell;
}

#pragma mark -
#pragma mark UICollectionViewDelegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
 {
 UICollectionViewFlowLayout *myLayout =
 [[UICollectionViewFlowLayout alloc]init];
 
 myLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
 [self.collectionView setCollectionViewLayout:myLayout animated:YES];
 }
/*-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    long row = [indexPath row];
    
    [_randomImages removeObjectAtIndex:row];
    
    NSArray *deletions = @[indexPath];
    
    [self.collectionView deleteItemsAtIndexPaths:deletions];
} */



@end
