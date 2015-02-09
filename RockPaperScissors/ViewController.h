//
//  ViewController.h
//  RockPaperScissors
//
//  Created by Hannes on 8/02/2015.
//  Copyright (c) 2015 Hannes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) UILabel *choiceLabel;
@property (strong, nonatomic) UILabel *resultLabel;
- (void)getWinner:(NSInteger)setUserChoice;

@end

