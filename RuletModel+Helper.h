//

//  RuletModel+Helper.h
//  Rulet
//
//  Created by 伸也 原田 on 12/05/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RuletModel.h"

@interface RuletModel (Helper)



- (NSMutableDictionary *) randomPerson;

- (int) formatPrettyPrice:(int)price;

- (void) sortByPriceOfPersonAscending;


@end
