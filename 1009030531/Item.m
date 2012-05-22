//
//  Item.m
//  1009030531
//
//  Created by hoang duyen on 11/08/12.
//  Copyright 2011 tokushima university. All rights reserved.
//


#import "Item.h"


@implementation Item
@synthesize libraryPlist,libraryContent;

//プロパティリストを取得
- (id)initWithLibraryName:(NSString *)libraryName {
    if (self == [super init]) {
        libraryPlist = libraryName;
        libraryContent = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] 
                                                                  pathForResource:libraryPlist ofType:@"plist"]];
    }
    return self;
}


- (NSDictionary *)libraryItemAtIndex:(int)index {
    return (libraryContent != nil && [libraryContent count] > 0 && index < [libraryContent count]) 
	? [libraryContent objectAtIndex:index]
	: nil;
}

- (int)libraryCount {
    return (libraryContent != nil) ? [libraryContent count] : 0;
}

- (void) dealloc {
    if (libraryContent) [libraryContent release];
    [super dealloc];
}


@end

