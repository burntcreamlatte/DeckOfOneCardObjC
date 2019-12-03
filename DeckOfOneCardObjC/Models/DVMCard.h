//
//  DVMCard.h
//  DeckOfOneCardObjC
//
//  Created by Aaron Shackelford on 12/3/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *imageString;
@property (nonatomic, copy, readonly) NSString *value;

- (instancetype) initWithSuit:(NSString *)suit
                  imageString:(NSString *)imageString
                        value:(NSString *)value;

- (instancetype) initWithDict:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
