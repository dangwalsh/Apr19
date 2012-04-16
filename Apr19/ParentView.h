//
//  ParentView.h
//  Apr19
//
//  Created by Daniel Walsh on 4/15/12.
//  Copyright (c) 2012 Walsh walsh Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h> 

@interface ParentView : UIView {
    NSArray *views;
    NSUInteger index; 
    AVAudioPlayer *player;
}

@end
