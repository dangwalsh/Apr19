//
//  ParentView.m
//  Apr19
//
//  Created by Daniel Walsh on 4/15/12.
//  Copyright (c) 2012 Walsh walsh Studio. All rights reserved.
//

#import "ParentView.h"
#import "LeftView.h"
#import "RightView.h"
#import "UpView.h"
#import "DownView.h"
#import "SwipeView.h"

@implementation ParentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self play: @"nothing"];

        
        views = [NSArray arrayWithObjects:
                 [[LeftView alloc] initWithFrame: self.bounds],
                 [[RightView alloc] initWithFrame: self.bounds],
                 [[UpView alloc] initWithFrame: self.bounds],
                 [[DownView alloc] initWithFrame: self.bounds],
                 [[SwipeView alloc] initWithFrame:self.bounds],
                 nil
                 ];
        
		index = 4;	
		[self addSubview: [views objectAtIndex: index]];
        
        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(swipe:)
                                                ];
		recognizer.direction = UISwipeGestureRecognizerDirectionRight;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionUp;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionDown;
		[self addGestureRecognizer: recognizer];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void) swipe: (UISwipeGestureRecognizer *) recognizer {
    
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSUInteger newIndex = 0;	//toggle the index
        if(index != newIndex){
        [UIView transitionFromView: [views objectAtIndex: index]
                            toView: [views objectAtIndex: newIndex]
                          duration: .75
                           options: UIViewAnimationOptionTransitionFlipFromLeft
                        completion: NULL
         ];
        
        index = newIndex;
        }
        [self play: @"over"];
        
    } else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        NSUInteger newIndex = 1;	//toggle the index
        if(index != newIndex){
        [UIView transitionFromView: [views objectAtIndex: index]
                            toView: [views objectAtIndex: newIndex]
                          duration: .75
                           options: UIViewAnimationOptionTransitionFlipFromRight
                        completion: NULL
         ];
        
        index = newIndex;
        }
        [self play: @"over"];
        
    } else if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
        NSUInteger newIndex = 2;	//toggle the index

        if(index != newIndex){
            [UIView transitionFromView: [views objectAtIndex: index]
                            toView: [views objectAtIndex: newIndex]
                          duration: .75
                           options: UIViewAnimationOptionTransitionCurlUp
                        completion: NULL
             ];
        
            index = newIndex;            
        }
        [self play: @"up"];
        
    }  else if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
        NSUInteger newIndex = 3;	//toggle the index
        if(index != newIndex){
        [UIView transitionFromView: [views objectAtIndex: index]
                            toView: [views objectAtIndex: newIndex]
                          duration: .75
                           options: UIViewAnimationOptionTransitionCurlDown
                        completion: NULL
         ];
        
        index = newIndex;
        }
        [self play: @"down"];
    }
}

-(void) play: (NSString *) fileName {
    
    NSBundle *bundle = [NSBundle mainBundle];
    if (bundle == nil) {
        NSLog(@"could not get the main bundle");
    }
    
    //The path is the filename.
    NSString *path =
    [bundle pathForResource: fileName ofType: @"mp3"];
    if (path == nil) {
        NSLog(@"could not get the path");
    }
    //NSLog(@"path == \"%@\"", path);
    
    NSURL *url = [NSURL fileURLWithPath: path isDirectory: NO];
    NSLog(@"url == \"%@\"", url);
    
    NSError *error = nil;
    player = [[AVAudioPlayer alloc]
              initWithContentsOfURL: url error: &error];
    if (player == nil) {
        NSLog(@"error == %@", error);
    }
    
    player.volume = 1.0;		//the default
    player.numberOfLoops = 0;	//negative number for infinite loop

    
    if (![player prepareToPlay]) {
        NSLog(@"could not prepare to play");
    }
    
    if (![player play]) {
        NSLog(@"could not play");
    }
    
}

@end
