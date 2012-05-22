//
//  RuletModel.h
//  Rulet
//
//  Created by 伸也 原田 on 12/05/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
// TODO: calculator というカテゴリーを作る

#import <Foundation/Foundation.h>

@interface RuletModel : NSObject

// people has many persoon which has NSMutableDictionary model.

@property (nonatomic) NSMutableArray  *people;
@property (nonatomic) NSString *gameMode;
@property (nonatomic) int amplitude;
@property (nonatomic) int price;
@property (nonatomic) int offSet;
@property (nonatomic) int randomMoney;
@property (nonatomic) int unitOfMoney;
@property (nonatomic) int peopleCount;



@property (nonatomic) int perPrice;




- (void) distributeRandomMoney;

-(void)createDummyPerson:(int)num;
-(void)createDummyPrice:(int)num;



// people is NSMutableArray;


-(void) setPerPriceToProperty:(NSMutableArray *) people with:(int)aPrice;
-(void) setRandomedPerPriceMoneyToEachPerson:(NSMutableArray *) people with:(int) perPrice;
- (Boolean) splittedBillIsCorrect;




@end
