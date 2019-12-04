//
//  DVMCardViewController.h
//  DeckOfOneCardObjC
//
//  Created by Aaron Shackelford on 12/3/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMCardViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *cardSuitLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardValueLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;

- (IBAction)drawCardButtonTapped:(UIButton *)sender;


@end

NS_ASSUME_NONNULL_END
