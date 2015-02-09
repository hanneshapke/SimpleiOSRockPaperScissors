//
//  ViewController.m
//  RockPaperScissors
//
//  Created by Hannes on 8/02/2015.
//  Copyright (c) 2015 Hannes. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@property NSNumber *counter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set background color
    self.view.backgroundColor = [UIColor colorWithRed:0.462 green:0.749 blue:0.937 alpha:1.0];
    
    // create buttons
    UIButton *rockButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *paperButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *scissorsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    rockButton.frame = CGRectMake(100, 100, 100, 44);
    paperButton.frame = CGRectMake(100, 150, 100, 44);
    scissorsButton.frame = CGRectMake(100, 200, 100, 44);
    rockButton.backgroundColor = [UIColor whiteColor];
    paperButton.backgroundColor = [UIColor whiteColor];
    scissorsButton.backgroundColor = [UIColor whiteColor];
    
    [rockButton setTitle:@"Rock" forState:UIControlStateNormal];
    [paperButton setTitle:@"Paper" forState:UIControlStateNormal];
    [scissorsButton setTitle:@"Scissors" forState:UIControlStateNormal];
    
    // add buttons to the view
    [self.view addSubview:rockButton];
    [self.view addSubview:paperButton];
    [self.view addSubview:scissorsButton];
    
    // add button messages
    [rockButton addTarget:self
                   action:@selector(rockButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [paperButton addTarget:self
                    action:@selector(paperButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [scissorsButton addTarget:self
                       action:@selector(scissorsButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    // create labels
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 200, 44)];
    _choiceLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 250, 250, 94)];
    _resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 350, 300, 44)];
    
    titleLabel.text = @"Rock-Paper-Scissors";
    _choiceLabel.numberOfLines = 0;
    _choiceLabel.text = nil;
    _resultLabel.text = nil;
    
    // add labels to the view
    [self.view addSubview:titleLabel];
    [self.view addSubview:_choiceLabel];
    [self.view addSubview:_resultLabel];
}

- (void)loadView{
    CGRect viewRect = [[UIScreen mainScreen] bounds];
    UIView *view = [[UIView  alloc] initWithFrame:viewRect];
    self.view = view;
    self.counter = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 
 How to determine the winner
 Rock > Paper > Scissors
 1 > 2 > 3
 
 If the user choses x and the method choice is equal  to (x+1) mod 3
 then the program wins. Otherwise the user.
 But first check for ties.
 
 */

- (void)getWinner:(NSInteger)userChoice {
    // get random choice
    NSArray *choices = @[@"Rock", @"Paper", @"Scissors"];
    NSUInteger programChoice = arc4random_uniform(3);
    _choiceLabel.text = [NSString stringWithFormat: @"You selected %@.\nComputer selected %@",
                         [choices objectAtIndex:userChoice], [choices objectAtIndex:programChoice]];
    NSLog(@"Your selected choice is %@", [choices objectAtIndex:userChoice]);
    NSLog(@"The program selected selected choice is %@", [choices objectAtIndex:programChoice]);
    if (userChoice == programChoice) {
        _resultLabel.text = @"Tie! Try again.";
    }
    else {
        if (((int)(userChoice) % 2 +1 ) == (int)programChoice) {
            _resultLabel.text = [NSString stringWithFormat: @"You loose > Program chose %@.", [choices objectAtIndex:programChoice]];
        } else {
            _resultLabel.text = [NSString stringWithFormat: @"You win > Program chose %@.", [choices objectAtIndex:programChoice]];
        }
    }
}

- (void)rockButtonPressed:(UIButton *)sender
{
    NSLog(@">>> %@", sender.currentTitle);
    [self getWinner:0];
}

- (void)paperButtonPressed:(UIButton *)sender
{
    [self getWinner:1];
}

- (void)scissorsButtonPressed:(UIButton *)sender
{
    [self getWinner:2];
}

@end

