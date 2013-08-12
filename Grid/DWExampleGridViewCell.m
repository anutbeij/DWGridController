//
//  DWExampleGridViewCell.m
//  Grid
//
//  Created by Alvin Nutbeij on 8/12/13.
//  Copyright (c) 2013 NCIM Groep. All rights reserved.
//

#import "DWExampleGridViewCell.h"
#import <QuartzCore/QuartzCore.h>
@implementation DWExampleGridViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = [[UIColor whiteColor] CGColor];
        self.layer.borderWidth = 1.0;
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

@end
