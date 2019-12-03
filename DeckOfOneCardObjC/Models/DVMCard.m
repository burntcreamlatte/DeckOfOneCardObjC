//
//  DVMCard.m
//  DeckOfOneCardObjC
//
//  Created by Aaron Shackelford on 12/3/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

//https://deckofcardsapi.com/api/deck/new/draw/?count=1
#import "DVMCard.h"

//not 100% sure where keys should go; got frustrated and just made them static to make the app work since the instructions asked to make a static method
static NSString *suitKey = @"suit";
static NSString *imageKey = @"image";
static NSString *valueKey = @"value";
@implementation DVMCard

- (instancetype) initWithSuit:(NSString *)suit imageString:(NSString *)imageString value:(NSString *)value;
{
    if (self = [super init])
    {
        _suit = suit;
        _imageString = imageString;
        _value = value;
    }
    return self;
}

- (instancetype) initWithDict:(NSDictionary *)dict
{
    return [self initWithSuit:suitKey imageString:imageKey value:valueKey];
}

@end
