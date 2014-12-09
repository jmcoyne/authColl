//
//  AllClassesCLasslistCVC.m
//  authColl
//
//  Created by Joan Coyne on 10/9/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

#import "AllClassesCLasslistCVC.h"
#import "APIFetcher.h"

@implementation AllClassesCLasslistCVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchFakeClasses];
}

- (void)fetchClasses {
   
    //Set up dummy pictures
      
    self.randomImages = [@[@"mzingabeeCloseup.jpg",
                       @"IMG_0140.jpg",
                       @"IMG_0187.jpg",
                       @"IMG_0201.jpg",
                       @"IMG_0204.jpg",
                       @"IMG_0223.jpg",
                       @"IMG_0561.jpg",
                       @"IMG_0066.jpg",
                       @"IMG_0095.jpg"] mutableCopy];
    
    /*NSDictionary *class = [[NSDictionary alloc] initWithObjectsAndKeys:
     @"name", @"Great Class",
     @"description", @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc lacus sapien, commodo vestibulum luctus quis, porttitor ac felis. Cras fermentum mi arcu, non vehicula dolor pharetra vitae. Donec vitae leo quis dolor feugiat tempor aliquam cursus est. Morbi quis posuere urna, ut pretium nulla. In velit dui, rutrum vitae laoreet a, blandit tempor dui. Donec sollicitudin accumsan lacinia. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; ",
     @"image", @"mzingabeeCloseup.jpg",
     @"created_at", @"Last Week",
     @"updated_at", @"Today",
     @"media", @"myURL",
     @"commentsCount", @"5", nil]; */
    
    
    //Get the list of items (courses or users) using the API
    //[self.refreshControl beginRefreshing]; // start the spinner
    
    NSURL * url = [APIFetcher URLforClassList];
    NSLog(@"url we have built = %@", url);
    /*[NSURL URLWithString:@"https://test.lifeplot.com/api/v1/courses"]; */
    // create a (non-main) queue to do fetch on
    dispatch_queue_t fetchQ = dispatch_queue_create("lms fetcher", NULL);
    // put a block to do the fetch onto that queue
    dispatch_async(fetchQ, ^{
    // fetch the JSON data from Flickr
    
        NSData *jsonResults = [NSData dataWithContentsOfURL:url];
         NSDictionary *itemListResults = [NSJSONSerialization JSONObjectWithData:jsonResults options:0 error:NULL];
    NSLog(@"ItemList Results = %@", itemListResults);
    NSMutableArray *listItems = [itemListResults valueForKeyPath:COURSES];
    NSLog(@"listItems Results = %@", listItems);
        self.classes = listItems;

    // update the Model (and thus our UI), but do so back on the main queue
    dispatch_async(dispatch_get_main_queue(), ^{
    //[self.refreshControl endRefreshing]; // stop the spinner
    });
    });
    


}
- (void)fetchFakeClasses {
    // throw in some hard coded classes for now so I can work
    NSDictionary *class1 = [[NSDictionary alloc] initWithObjectsAndKeys:
     @"Great Class", @"name",
     @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc lacus sapien, commodo vestibulum luctus quis, porttitor ac felis. Cras fermentum mi arcu, non vehicula dolor pharetra vitae. Donec vitae leo quis dolor feugiat tempor aliquam cursus est. Morbi quis posuere urna, ut pretium nulla. In velit dui, rutrum vitae laoreet a, blandit tempor dui. Donec sollicitudin accumsan lacinia. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; ",@"description",
      @"mzingabeeCloseup.jpg", @"image",
      @"Last Week", @"created_at",
      @"myURL", @"media",
      @"Today", @"updated_at",
      @"5", @"commentsCount", nil];
    NSLog(@"ItemList Results = %@", class1);
    
    NSDictionary *class2 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great 2 Class", @"name",
                            @"You hit me with a cricket bat. The way I see it, every life is a pile of good things and bad things.…hey.…the good things don't always soften the bad things; but vice-versa the bad things don't necessarily spoil the good things and make them unimportant. Stop talking, brain thinking. Hush. It's a fez. I wear a fez now. Fezes are cool. ",  @"description",
                            @"IMG_0187.jpg",  @"image",
                            @"Yesterday", @"created_at",
                            @"Today",@"updated_at",
                            @"myURL2", @"media",
                             @"3",  @"commentsCount",nil];
    
    NSDictionary *class3 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great 3 Class", @"name",
                            @"Dantooine. They're on Dantooine. The more you tighten your grip, Tarkin, the more star systems will slip through your fingers. The plans you refer to will soon be back in our hands. Partially, but it also obeys your commands. Look, I can take you as far as Anchorhead. You can get a transport there to Mos Eisley or wherever you're going. A tremor in the Force. The last time I felt it was in the presence of my old master.",  @"description",
                            @"IMG_0140.jpg",  @"image",
                            @"Yesterday", @"created_at",
                            @"Today",@"updated_at",
                            @"myURL3", @"media",
                            @"8",  @"commentsCount",nil];
    
    NSDictionary *class4 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great 4 Class", @"name",
                            @"Leave that to me. Send a distress signal, and inform the Senate that all on board were killed. Don't be too proud of this technological terror you've constructed. The ability to destroy a planet is insignificant next to the power of the Force. But with the blast shield down, I can't even see! How am I supposed to fight?",  @"description",
                            @"IMG_0201.jpg",  @"image",
                            @"Yesterday", @"created_at",
                            @"Today",@"updated_at",
                            @"myURL3", @"media",
                            @"11",  @"commentsCount",nil];

    
    NSDictionary *class6 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great 3 Class", @"name",
                            @"Dantooine. They're on Dantooine. The more you tighten your grip, Tarkin, the more star systems will slip through your fingers. The plans you refer to will soon be back in our hands. Partially, but it also obeys your commands. Look, I can take you as far as Anchorhead. You can get a transport there to Mos Eisley or wherever you're going. A tremor in the Force. The last time I felt it was in the presence of my old master.",  @"description",
                            @"IMG_0223.jpg",  @"image",
                            @"Yesterday", @"created_at",
                            @"Today",@"updated_at",
                            @"myURL3", @"media",
                            @"8",  @"commentsCount",nil];
    
    NSDictionary *class7 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great 4 Class", @"name",
                            @"Leave that to me. Send a distress signal, and inform the Senate that all on board were killed. Don't be too proud of this technological terror you've constructed. The ability to destroy a planet is insignificant next to the power of the Force. But with the blast shield down, I can't even see! How am I supposed to fight?",  @"description",
                            @"IMG_0561.jpg",  @"image",
                            @"Yesterday", @"created_at",
                            @"Today",@"updated_at",
                            @"myURL3", @"media",
                            @"11",  @"commentsCount",nil];
    NSDictionary *class8 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great 2 Class", @"name",
                            @"You hit me with a cricket bat. The way I see it, every life is a pile of good things and bad things.…hey.…the good things don't always soften the bad things; but vice-versa the bad things don't necessarily spoil the good things and make them unimportant. Stop talking, brain thinking. Hush. It's a fez. I wear a fez now. Fezes are cool. ",  @"description",
                            @"IMG_0021.jpg",  @"image",
                            @"Yesterday", @"created_at",
                            @"Today",@"updated_at",
                            @"myURL2", @"media",
                            @"3",  @"commentsCount",nil];
    
    NSDictionary *class9 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great 3 Class", @"name",
                            @"Dantooine. They're on Dantooine. The more you tighten your grip, Tarkin, the more star systems will slip through your fingers. The plans you refer to will soon be back in our hands. Partially, but it also obeys your commands. Look, I can take you as far as Anchorhead. You can get a transport there to Mos Eisley or wherever you're going. A tremor in the Force. The last time I felt it was in the presence of my old master.",  @"description",
                            @"IMG_0095.jpg",  @"image",
                            @"Yesterday", @"created_at",
                            @"Today",@"updated_at",
                            @"myURL3", @"media",
                            @"8",  @"commentsCount",nil];
    
   /* NSDictionary *class10 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great 4 Class", @"name",
                            @"Leave that to me. Send a distress signal, and inform the Senate that all on board were killed. Don't be too proud of this technological terror you've constructed. The ability to destroy a planet is insignificant next to the power of the Force. But with the blast shield down, I can't even see! How am I supposed to fight?",  @"description",
                            @"IMG_0204.jpg",  @"image",
                            @"Yesterday", @"created_at",
                            @"Today",@"updated_at",
                            @"myURL3", @"media",
                            @"11",  @"commentsCount",nil]; */
    
    

    
    /* suggested classes */
    
    NSDictionary *class21 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great Class Suggestion", @"name",
                            @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc lacus sapien, commodo vestibulum luctus quis, porttitor ac felis. Cras fermentum mi arcu, non vehicula dolor pharetra vitae. Donec vitae leo quis dolor feugiat tempor aliquam cursus est. Morbi quis posuere urna, ut pretium nulla. In velit dui, rutrum vitae laoreet a, blandit tempor dui. Donec sollicitudin accumsan lacinia. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; ",@"description",
                            @"IMG_0572.jpg", @"image",
                            @"Last Week", @"created_at",
                            @"myURL", @"media",
                            @"Today", @"updated_at",
                            @"5", @"commentsCount", nil];
    NSLog(@"ItemList Results = %@", class1);
    
    NSDictionary *class22 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great 2 Class Suggestion", @"name",
                            @"You hit me with a cricket bat. The way I see it, every life is a pile of good things and bad things.…hey.…the good things don't always soften the bad things; but vice-versa the bad things don't necessarily spoil the good things and make them unimportant. Stop talking, brain thinking. Hush. It's a fez. I wear a fez now. Fezes are cool. ",  @"description",
                            @"IMG_0302.jpg",  @"image",
                            @"Yesterday", @"created_at",
                            @"Today",@"updated_at",
                            @"myURL2", @"media",
                            @"3",  @"commentsCount",nil];
    
    NSDictionary *class23 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great 3 Class Suggestion", @"name",
                            @"Dantooine. They're on Dantooine. The more you tighten your grip, Tarkin, the more star systems will slip through your fingers. The plans you refer to will soon be back in our hands. Partially, but it also obeys your commands. Look, I can take you as far as Anchorhead. You can get a transport there to Mos Eisley or wherever you're going. A tremor in the Force. The last time I felt it was in the presence of my old master.",  @"description",
                            @"IMG_0329.jpg",  @"image",
                            @"Yesterday", @"created_at",
                            @"Today",@"updated_at",
                            @"myURL3", @"media",
                            @"8",  @"commentsCount",nil];
    
    NSDictionary *class24 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great 4 Class Suggestion", @"name",
                            @"Leave that to me. Send a distress signal, and inform the Senate that all on board were killed. Don't be too proud of this technological terror you've constructed. The ability to destroy a planet is insignificant next to the power of the Force. But with the blast shield down, I can't even see! How am I supposed to fight?",  @"description",
                            @"IMG_0521.jpg",  @"image",
                            @"Yesterday", @"created_at",
                            @"Today",@"updated_at",
                            @"myURL3", @"media",
                            @"11",  @"commentsCount",nil];
    
    NSDictionary *class25 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great 5 Class Suggestion", @"name",
                            @"You hit me with a cricket bat. The way I see it, every life is a pile of good things and bad things.…hey.…the good things don't always soften the bad things; but vice-versa the bad things don't necessarily spoil the good things and make them unimportant. Stop talking, brain thinking. Hush. It's a fez. I wear a fez now. Fezes are cool. ",  @"description",
                            @"IMG_567.jpg",  @"image",
                            @"Yesterday", @"created_at",
                            @"Today",@"updated_at",
                            @"myURL2", @"media",
                            @"3",  @"commentsCount",nil];
    
    NSDictionary *class26 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great 6Class Suggestion", @"name",
                            @"Dantooine. They're on Dantooine. The more you tighten your grip, Tarkin, the more star systems will slip through your fingers. The plans you refer to will soon be back in our hands. Partially, but it also obeys your commands. Look, I can take you as far as Anchorhead. You can get a transport there to Mos Eisley or wherever you're going. A tremor in the Force. The last time I felt it was in the presence of my old master.",  @"description",
                            @"IMG_0571.jpg",  @"image",
                            @"Yesterday", @"created_at",
                            @"Today",@"updated_at",
                            @"myURL3", @"media",
                            @"8",  @"commentsCount",nil];
    
    NSDictionary *class27 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great 7 Class Suggestion", @"name",
                            @"Leave that to me. Send a distress signal, and inform the Senate that all on board were killed. Don't be too proud of this technological terror you've constructed. The ability to destroy a planet is insignificant next to the power of the Force. But with the blast shield down, I can't even see! How am I supposed to fight?",  @"description",
                            @"IMG_0407.jpg",  @"image",
                            @"Yesterday", @"created_at",
                            @"Today",@"updated_at",
                            @"myURL3", @"media",
                            @"11",  @"commentsCount",nil];
    NSDictionary *class28 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"Great 8 Class Suggestion", @"name",
                            @"You hit me with a cricket bat. The way I see it, every life is a pile of good things and bad things.…hey.…the good things don't always soften the bad things; but vice-versa the bad things don't necessarily spoil the good things and make them unimportant. Stop talking, brain thinking. Hush. It's a fez. I wear a fez now. Fezes are cool. ",  @"description",
                            @"IMG_0187.jpg",  @"image",
                            @"Yesterday", @"created_at",
                            @"Today",@"updated_at",
                            @"myURL2", @"media",
                            @"3",  @"commentsCount",nil];

    
    NSMutableArray *myClasses = [NSMutableArray arrayWithObjects:class1, class2, class3, class4, class6, class7, class8, class9,   nil ];
    NSMutableArray *suggestedClasses = [NSMutableArray arrayWithObjects:class21, class22, class23, class24, class25, class26, class27, class28,nil ];
    
    NSMutableArray *listItems = [NSMutableArray arrayWithObjects:myClasses, suggestedClasses, nil ];

    self.classes = listItems;
}
@end
