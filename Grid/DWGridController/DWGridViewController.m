//
//  DWGridViewController.m
//  Grid
//
//  Created by Alvin Nutbeij on 12/14/12.
//  Copyright (c) 2013 Devwire. All rights reserved.
//

#import "DWGridViewController.h"

@interface DWGridViewController ()
-(DWPosition)normalizePosition:(DWPosition)position inGridView:(DWGridView *)gridView;
@end

@implementation DWGridViewController
@synthesize gridView = _gridView;
@synthesize cells = _cells;

-(id)init
{
    self = [super init];
    if(self)
    {
        _cells = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)loadView
{
    _gridView = [[DWGridView alloc] init];
    _gridView.delegate = self;
    _gridView.dataSource = self;
    _gridView.clipsToBounds = YES;
    self.view = _gridView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [_gridView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - GridView datasource
-(NSInteger)numberOfColumnsInGridView:(DWGridView *)gridView{
    return 0;
}

-(NSInteger)numberOfRowsInGridView:(DWGridView *)gridView{
    return 0;
}

-(NSInteger)numberOfVisibleRowsInGridView:(DWGridView *)gridView{
    return 0;
}

-(NSInteger)numberOfVisibleColumnsInGridView:(DWGridView *)gridView{
    return 0;
}

#pragma mark - GridView delegate
-(void)gridView:(DWGridView *)gridView didMoveCell:(DWGridViewCell *)cell fromPosition:(DWPosition)fromPosition toPosition:(DWPosition)toPosition{
    //moving vertically
    toPosition = [gridView normalizePosition:toPosition];
    if(toPosition.column == fromPosition.column)
    {
        //How many places is the tile moved (can be negative!)
        NSInteger amount = toPosition.row - fromPosition.row;
        NSMutableDictionary *cellDict = [self cellDictionaryAtPosition:fromPosition];
        NSMutableDictionary *toCell;
        do
        {
            //Get the next cell
            toCell = [self cellDictionaryAtPosition:toPosition];
            
            //update the current cell
            [cellDict setObject:[NSNumber numberWithInt:toPosition.row] forKey:@"Row"];
            
            //prepare the next cell
            cellDict = toCell;
            
            //calculate the next position
            toPosition.row += amount;
            
            toPosition = [gridView normalizePosition:toPosition];
        }while (toCell);
    }
    else //moving horizontally
    {
        //How many places is the tile moved (can be negative!)
        NSInteger amount = toPosition.column - fromPosition.column;
        NSMutableDictionary *cellDict = [self cellDictionaryAtPosition:fromPosition];
        NSMutableDictionary *toCell;
        do
        {
            //Get the next cell
            toCell = [self cellDictionaryAtPosition:toPosition];
            
            //update the current cell
            [cellDict setObject:[NSNumber numberWithInt:toPosition.column] forKey:@"Column"];
            
            //prepare the next cell
            cellDict = toCell;
            
            //calculate the next position
            toPosition.column += amount;
            toPosition = [gridView normalizePosition:toPosition];
        }while (toCell);
        
    }
}

-(DWGridViewCell *)gridView:(DWGridView *)gridView cellAtPosition:(DWPosition)position{
    DWGridViewCell *cell = [[self cellDictionaryAtPosition:position] objectForKey:@"Cell"];
    
    if(!cell){
        cell = [[DWGridViewCell alloc] init];
    }
    return cell;
}

#pragma mark - Screen rotation

-(BOOL)shouldAutorotate{
    return YES;
}

-(NSInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
}

#pragma mark - Private methods
-(DWPosition)normalizePosition:(DWPosition)position inGridView:(DWGridView *)gridView{
    return [gridView normalizePosition:position];
}

#pragma mark - Public methods

-(NSMutableDictionary *)cellDictionaryAtPosition:(DWPosition)position
{
    position = [self normalizePosition:position inGridView:_gridView];
    for(NSMutableDictionary *cellDict in _cells){
        if([[cellDict objectForKey:@"Row"] intValue] == position.row){
            if([[cellDict objectForKey:@"Column"] intValue] == position.column){
                return cellDict;
            }else{
                continue;
            }
        }else{
            continue;
        }
    }
    
    return nil;
}
@end
