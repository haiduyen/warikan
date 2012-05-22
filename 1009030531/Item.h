//
//  Item.h
//  1009030531
//
//  Created by hoang duyen on 11/08/12.
//  Copyright 2011 tokushima university. All rights reserved.
//

//モデルクラスの定義
#import <Foundation/Foundation.h>

@interface Item : NSObject {
    NSString *libraryPlist;
    NSArray *libraryContent;
}
@property (nonatomic, readonly) NSString *libraryPlist;
@property (nonatomic, readonly) NSArray *libraryContent;

- (id)initWithLibraryName:(NSString *)libraryName;
- (NSDictionary *)libraryItemAtIndex:(int)index;
- (int)libraryCount;

@end