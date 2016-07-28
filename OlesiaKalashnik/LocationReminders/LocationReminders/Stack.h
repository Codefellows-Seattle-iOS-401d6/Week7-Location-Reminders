//
//  Stack.h
//  LocationReminders
//
//  Created by Olesia Kalashnik on 7/25/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

-(instancetype)initWithArray:(NSMutableArray *)array;

-(void)push:(NSObject *)element;
-(NSObject *)pop;
-(NSUInteger)length;
-(void)print;
@end
