//
//  LeftView.m
//  Apr19
//
//  Created by Daniel Walsh on 4/15/12.
//  Copyright (c) 2012 Walsh walsh Studio. All rights reserved.
//

#import "LeftView.h"

@implementation LeftView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor yellowColor];
        NSString *text = @"Left";
        
        CGRect b = self.bounds;
        UIFont *font = [UIFont italicSystemFontOfSize: b.size.height/8];
        
		width = self.bounds.size.width / 2;
		height = width / 2;
        
		CGRect f = CGRectMake(
                              (self.bounds.size.width - width) / 2,
                              (self.bounds.size.height - height) / 2,
                              width,
                              height
                              );
        
		label = [[UILabel alloc] initWithFrame: f];
		label.textAlignment = UITextAlignmentCenter;
		label.backgroundColor = [UIColor clearColor];
        label.text = text;
        label.font = font;
        
        [self addSubview: label];
    }
    
    

    
    
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    Class class = [self class];
    NSString *string = NSStringFromClass(class);
	UIFont *font = [UIFont systemFontOfSize: 32];
	[string drawAtPoint: CGPointZero withFont: font];
}
*/

@end
