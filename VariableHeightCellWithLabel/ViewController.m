//
//  ViewController.m
//  VariableHeightCellWithLabel
//
//  Created by Claes Lillieskold on 2014-04-02.
//  Copyright (c) 2014 Claes Lillieskold. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

@interface ViewController ()
@property (nonatomic, strong) Cell *prototypeCell;
@property (nonatomic, strong) NSString *shortString;
@property (nonatomic, strong) NSString *longString;
@property (nonatomic, strong) NSArray *strings;
@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    self.shortString = @"Munk munk";
    self.longString = @"Mitt liv är i nedan och klent nu mitt verk, "
    "jag fattige olärde bortrymde klerk, "
    "en bortlupen broder bara, "
    "fördömd av kapitlet i Skara."
    "Nu är jag en gammal och böjder man, "
    "åt den onde given av kyrkans bann "
    "för dråp och trilska och kätteri "
    "och av kungen förklarad för fågelfri.";
    self.strings = @[self.shortString, self.longString];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.prototypeCell.string = self.strings[indexPath.row];
    [self.prototypeCell setNeedsLayout];
    [self.prototypeCell layoutIfNeeded];
    CGSize size = [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    CGFloat height = size.height;
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.string = self.strings[indexPath.row];
    return cell;
}
@end
