//
//  Stack.h
//  locationReminders
//
//  Created by Sung Kim on 7/25/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

@property (strong, nonatomic) NSMutableArray *container;

- (instancetype)init;
- (void)push:(id)object;
- (id)pop;
- (void)print;

@end
