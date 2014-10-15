//
//  ClasslistCVC.m
//  authColl
//
//  Created by Joan Coyne on 10/8/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

#import "ClasslistCVC.h"
#import "SingleClassVC.h"
#import "LandingPageVC.h"

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
// prepares the given ImageViewController to show the given photo
// used either when segueing to an ImageViewController
//   or when our UISplitViewController's Detail view controller is an ImageViewController

- (void)prepareSingleClassViewController:(SingleClassVC *)scvc toDisplayClass:(NSDictionary *)class
{
    
    scvc.image = [class valueForKey:@"image"];
    scvc.classTitle = [class valueForKey:@"name"];
    scvc.classDescription = [class valueForKey:@"description"];
    scvc.scImageView.image = [UIImage imageNamed:scvc.image];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"Preparing to Segue ClassList");
     if ([sender isKindOfClass:[UICollectionViewCell class]]) {
          NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
         if (indexPath) {
             // found it ... are we doing the Display class segue?
             if ([segue.identifier isEqualToString:@"toOneClass"]) {
                 // yes ... is the destination a ViewController?
                 if ([segue.destinationViewController isKindOfClass:[UIViewController class]]) {
                     // yes ... then we know how to prepare for that segue
                    
                     [self prepareSingleClassViewController:segue.destinationViewController
                                       toDisplayClass:self.classes[indexPath.row]];
                 }
             }
         }
         
     }
}



@end
