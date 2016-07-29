//
//  NumberSum.h
//  locationReminders
//
//  Created by Sung Kim on 7/27/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberSum : NSObject

@property (strong, nonatomic)NSDictionary *valuesDictionary;

- (instancetype)init;
- (NSNumber *)returnSum:(NSString *)input;

@end
