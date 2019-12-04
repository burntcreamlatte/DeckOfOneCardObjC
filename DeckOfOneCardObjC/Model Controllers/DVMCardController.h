//
//  DVMCardController.h
//  DeckOfOneCardObjC
//
//  Created by Aaron Shackelford on 12/3/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
//importing UIKit for UIImage fetch
#import <UIKit/UIKit.h>
//import .h file wasn't working; looked it up and telling controller to reference the actual class works?
#import "DVMCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface DVMCardController : NSObject

//static draw card method with completion handler, nullable allows us to ignore error handling for now
+ (void) drawANewCard:(NSInteger *)numberOfCards completion:(void(^) (NSArray<DVMCard *> *_Nullable cards))completion;

//static card image fetcher with completion handler, same nullable comment as above for drawing card
+ (void) fetchCardImage:(DVMCard *)card completion:(void(^) (UIImage *_Nullable image))completion;

@end

NS_ASSUME_NONNULL_END
