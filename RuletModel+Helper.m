//
//  RuletModel+Helper.m
//  Rulet
//
//  Created by 伸也 原田 on 12/05/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RuletModel+Helper.h"

@implementation RuletModel (Helper)



- (NSMutableDictionary *) randomPerson 
{
    int r = arc4random() % [self.people count];
    return [self.people objectAtIndex:r];
}


- (int) formatPrettyPrice:(int)price
{
    
    while ((price %  self.unitOfMoney) != 0) {
        price -= 1;
        self.offSet +=1;
    }
    
    
    NSLog(@"perPrice is %i",price);
    NSLog(@"totalOffset is %i",self.offSet);
    
    return  price;
    
    
}


- (void) sortByPriceOfPersonAscending
{
    [self.people sortedArrayUsingComparator: ^NSComparisonResult(id obj1, id obj2) {
        return [[obj1 objectForKey: @"price"] compare: [obj2 objectForKey: @"price"]];
    }];
    
}




@end
