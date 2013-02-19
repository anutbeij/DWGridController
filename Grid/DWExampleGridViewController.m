//
//  DWExampleGridViewController.m
//  Grid
//
//  Created by Alvin Nutbeij on 2/19/13.
//  Copyright (c) 2013 NCIM Groep. All rights reserved.
//

#import "DWExampleGridViewController.h"

@interface DWExampleGridViewController ()

@end

@implementation DWExampleGridViewController

- (id)init
{
    self = [super init];
    if (self) {
        for(int row = 0; row < 9; row++){
            for(int col = 0; col < 9; col++){
                DWGridViewCell *cell = [[DWGridViewCell alloc] init];
                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d-%d.jpeg",row,col]];
                
                UIImageView *iv = [[UIImageView alloc] initWithImage:image];
                [iv setContentMode:UIViewContentModeScaleAspectFill];
                iv.clipsToBounds = YES;
                [iv setTranslatesAutoresizingMaskIntoConstraints:NO];
                [cell addSubview:iv];
                [cell addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[iv]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(iv)]];
                [cell addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[iv]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(iv)]];
                
                NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                [dict setObject:cell forKey:@"Cell"];
                [dict setObject:[NSNumber numberWithInt:row] forKey:@"Row"];
                [dict setObject:[NSNumber numberWithInt:col] forKey:@"Column"];
                [self.cells addObject:dict];
                
            }
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

#pragma mark - GridView datasource
-(NSInteger)numberOfColumnsInGridView:(DWGridView *)gridView{
    return 8;
}

-(NSInteger)numberOfRowsInGridView:(DWGridView *)gridView{
    return 8;
}

-(NSInteger)numberOfVisibleRowsInGridView:(DWGridView *)gridView{
    return 3;
}

-(NSInteger)numberOfVisibleColumnsInGridView:(DWGridView *)gridView{
    return 4;
}

@end
