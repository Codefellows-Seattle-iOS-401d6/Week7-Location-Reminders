//
//  NSString+StringExtension.h
//  LocationReminders
//
//  Created by Olesia Kalashnik on 7/26/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringExtension)

-(BOOL)isAnagramWith:(NSString *)string;
//With quicksort
-(BOOL)areAnagrams:(NSString *)string;


@end
