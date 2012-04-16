//
//  Apr19AppDelegate.h
//  Apr19
//
//  Created by Daniel Walsh on 4/15/12.
//  Copyright (c) 2012 Walsh walsh Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ParentView;

@interface Apr19AppDelegate : UIResponder <UIApplicationDelegate> {
    ParentView *parentView;
    UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
