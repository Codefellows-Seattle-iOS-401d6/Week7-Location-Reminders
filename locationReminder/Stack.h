//
//  Stack.h
//  locationReminder
//
//  Created by Sean Champagne on 7/26/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

@property (assign, readonly) long count;

-(void)push:(id)anObject;
-(id)pop;
-(void)clear;
-(id)lastObject;

@end
