//
//  Stack.h
//  locationReminders
//
//  Created by Erin Roby on 7/25/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

@property NSMutableArray *stack;

-(void) push:(id)object;
-(void) pop;
-(void) print;
-(NSInteger)count;

@end
