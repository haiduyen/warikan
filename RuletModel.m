#import "RuletModel.h"
#import "RuletModel+Helper.h"

@implementation RuletModel

@synthesize people = _people;
@synthesize gameMode;
@synthesize amplitude = _amplitude;
@synthesize price = _price;
@synthesize randomMoney;
@synthesize unitOfMoney;


//offSet: お釣り
@synthesize offSet;

@synthesize perPrice  ;



NSMutableArray *randomOffsetNumbers;
NSMutableArray *errorPerson ;
int calledRandomGenTimes = 0;
int perPrice;
int rangeOfNum ;
// みんなに分配する金額

// 支払う金額の単位




// lowerLimitと同じなので不要.
int limit;






- (void) setPrice:(int)price
{

    if (price < 0){
        NSLog(@"Please input value bigger than 0");
        _price = 0;
    }else{
        _price = price ;
    }

}


- (void) setAmplitude:(int)amplitude
{
        if (!_amplitude){
            _amplitude = amplitude;
        }
}



-(id) init
{
    if (nil != [super init]){
        if (!_people) {
            _people = [[NSMutableArray alloc] init];
        }
        if (!unitOfMoney){
            unitOfMoney = 100;
        }
    }
    return self;
}


-(void)createDummyPrice:(int)num
{
    self.price = num;
    
}


-(void)createDummyPerson:(int)num
{
    // create num person and insert people.
    NSLog(@"called num is %i",num);
    
    for (int i = 0 ;i < num ; i++){
        NSMutableDictionary *person = [NSMutableDictionary dictionary];
        [self.people addObject:person];
    }
}


-(void) setPerPriceToProperty:(NSMutableArray *) people with:(int)aPrice;
{
    //ランダムに配布するお金の分だけ、先に減らしておく
    //そのあとにそのお金をひゃくえん100円単位で誰かに配布する.
    randomMoney = 1000;
    
    aPrice -= randomMoney;
    
    int theNumberOfPerson = [people count];
    
    int aPerPrice = aPrice / theNumberOfPerson;
    // 割り切れなかった時、offSetwをその分だけ増やしておく.
    int f =self.price -  (aPerPrice * [self.people count] );

    NSLog(@"f is %i",f);
    offSet += f - randomMoney;

    self.perPrice = aPerPrice;
    
    [self setRandomedPerPriceMoneyToEachPerson:people with:aPerPrice];
}


-(void) setRandomedPerPriceMoneyToEachPerson:(NSMutableArray *) people with:(int) aPerPrice 
{

    for (NSMutableDictionary *person in people ){


        int tmpPrice  = aPerPrice;
        tmpPrice = [self formatPrettyPrice:tmpPrice];
        
        // 100円切り捨てのお金を指定する,残ったお金は誰か一人が払う。
        NSLog(@"tmpPrice is %i",[self formatPrettyPrice:tmpPrice]);

        [person setObject: [NSNumber numberWithInt: tmpPrice] forKey:@"price"];
        
        
        if (![person valueForKey:@"perPrice"]){
            [person setObject:[NSNumber numberWithInt:tmpPrice]  forKey:@"perPrice"];           
        }

    }
    [self distributeRandomMoney];
}


// 事前に割り引いていたrandomMoneyの分だけを分配する
- (void) distributeRandomMoney;
{
    
    while(randomMoney != 0 ){
        NSLog(@"randomMoney is %i",randomMoney);

        int tmp = 100;
        randomMoney -= tmp;
        NSMutableDictionary *p = [self randomPerson];
        int tmpPrice = [[p valueForKey:@"price"] intValue];
        
        [p setValue:[NSNumber numberWithInt:tmpPrice + tmp]   forKey:@"price"];
    }
}


@end
