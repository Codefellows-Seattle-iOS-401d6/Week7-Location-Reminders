//
//  AnagramDetector.h
//  locationReminders
//
//  Created by Sung Kim on 7/26/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnagramDetector : NSObject

- (BOOL)isAnagram:(NSString *)firstString secondString:(NSString *)secondString;

@end
