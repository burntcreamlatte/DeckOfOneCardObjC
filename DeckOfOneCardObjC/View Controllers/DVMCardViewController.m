//
//  DVMCardViewController.m
//  DeckOfOneCardObjC
//
//  Created by Aaron Shackelford on 12/3/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

#import "DVMCardViewController.h"
#import "DVMCardController.h"

@interface DVMCardViewController ()

@end

@implementation DVMCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)drawCardButtonTapped:(UIButton *)sender {
    //this was the only thing left giving me an issue, NSNumber is what was used in the init for the method as it wouldn't allow me to use NSInteger
    [DVMCardController drawANewCard:1 completion:^(NSArray<DVMCard *> * _Nullable cards) {
        
        [DVMCardController fetchCardImage:cards[0] completion:^(UIImage * _Nullable image)
         {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.cardImageView.image = image;
                self.cardSuitLabel.text = cards[0].suit;
                self.cardValueLabel.text = cards[0].value;
            });
        }];
    }];
}
@end
