//
//  AppDelegate.m
//  LocationReminders
//
//  Created by Olesia Kalashnik on 7/25/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "Stack.h"
#import "Queue.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration>  _Nonnull configuration) {
        configuration.applicationId = @"appId";
        configuration.clientKey = @"myMasterKey";
        configuration.server = @"https://locationremindersserver.herokuapp.com/parse";
    }]];
    
    //Stack Testing
    NSMutableArray *initialItems = [[NSMutableArray alloc]initWithArray:@[@1, @2, @3]];
    Stack *stack = [[Stack alloc]initWithArray:initialItems];
    [stack push:@4];
    [stack push:@5];
    [stack push:@6];
    [stack print];
    [stack pop];
    [stack print];
    
    //Queue Testing
    NSMutableArray *initialItemsInQueue = [[NSMutableArray alloc]initWithArray:@[@"a", @"b", @"c"]];
    Queue *queue = [[Queue alloc]initWithArray:initialItemsInQueue];
    [queue enqueue:@"d"];
    [queue enqueue:@"e"];
    [queue print];
    [queue dequeue];
    [queue print];
    
    return YES;
}

@end
