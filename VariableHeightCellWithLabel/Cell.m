//
//  Cell.m
//  VariableHeightCellWithLabel
//
//  Created by Claes Lillieskold on 2014-04-02.
//  Copyright (c) 2014 Claes Lillieskold. All rights reserved.
//

#import "Cell.h"

@interface Cell ()
@property (nonatomic, strong) IBOutlet UILabel *label;
@end

@implementation Cell
@synthesize string = _string;

- (NSString *)string
{
    return _string;
}

- (void)setString:(NSString *)string
{
    _string = string;
    self.label.text = string;
}
@end
