//
//  CodeChallengeViewController.m
//  locationReminders
//
//  Created by Jessica Malesh on 7/27/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import "CodeChallengeViewController.h"
#import "ViewController.h"

@interface CodeChallengeViewController()
@property (weak, nonatomic) IBOutlet UITextField *stringTextField;
- (IBAction)submitStringButtonPressed:(UIButton *)sender;



@end

@implementation CodeChallengeViewController

- (IBAction)submitStringButtonPressed:(UIButton *)sender
{
    NSString *inputString = _stringTextField.text;
    NSMutableArray *numberArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < [inputString.length]; i++) {
        if (isdigit([inputString characterAtIndex:i])) {
            [numberArray addObject:[i intValue]];
        }
    }
    
}
@end
