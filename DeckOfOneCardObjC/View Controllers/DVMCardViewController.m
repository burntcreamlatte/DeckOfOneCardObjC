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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //update views by reloading data?
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (IBAction)drawCardButtonTapped:(UIButton *)sender
{
    //still workin on it
    NSString *cardValue = self.valueLabel;
    NSString *cardSuit = self.cardLabel;
    UIImage *cardImage = self.cardImageView;
    
    [[DVMCardController shared] drawANewCard]
}

- (void) updateViews
{
    
}

@end
