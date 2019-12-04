//
//  DVMCardController.m
//  DeckOfOneCardObjC
//
//  Created by Aaron Shackelford on 12/3/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

#import "DVMCardController.h"
#import "DVMCard.h"

//static constant URL properties above the implementation
static NSString *const baseURLConstantString = @"https://deckofcardsapi.com/api/deck/new/";
static NSString *const drawComponent = @"draw";
static NSString *const countQuery = @"count";
//for use in data tasking
static NSString *const cardsArrayKey = @"cards";

@implementation DVMCardController

+ (DVMCardController *) shared {
    static DVMCardController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [DVMCardController new];
    });
    return shared;
}

+ (void) drawANewCard:(NSNumber *)numberOfCards completion:(void (^)(NSArray<DVMCard *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLConstantString];
    NSURL *drawURL = [baseURL URLByAppendingPathComponent:drawComponent];
    NSString *cardCountAsString = [numberOfCards stringValue];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *queryItems = [NSURLQueryItem queryItemWithName:countQuery value:cardCountAsString];
    //hey this part feels kinda like swift actually
    urlComponents.queryItems = @[queryItems];
    NSURL *finalURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error: %@, %@", error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"Response: %@", response);
        }
        //no data; returns
        //is this better to guard against nil data best? or just styling?
        if (!data)
        {
            NSLog(@"Error retrieving data: %@", [error localizedDescription]);
            completion(nil);
            return;
        }
        NSDictionary *topLevelDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (!topLevelDict)
        {
            NSLog(@"Error passing json: %@", [error localizedDescription]);
            completion(nil);
            return;
        }
        //check that dictionary exists and it is a NSDictionary class
        if (!topLevelDict || ![topLevelDict isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Dictionary cannot be created from data retrieved: %@", [error localizedDescription]);
            completion(nil);
            return;
        }
        
        NSArray *cardsArray = topLevelDict[cardsArrayKey];
        
        NSMutableArray *placeholderCardsArray = [NSMutableArray array];
        
        for (NSDictionary *cardDictionary in cardsArray)
        {
            //finally adding each card
            DVMCard *card = [[DVMCard alloc] initWithDict:cardDictionary];
            [placeholderCardsArray addObject:card];
        }
        completion(placeholderCardsArray);
    }] resume];
    
    
}
+ (void) fetchCardImage:(DVMCard *)card completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.imageString];
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error: %@, %@", error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"Response: %@", response);
        }
        if (!data)
        {
            NSLog(@"Error retrieving data: %@", [error localizedDescription]);
            completion(nil);
            return;
        }
        
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage);
        
    }] resume];
}

@end
