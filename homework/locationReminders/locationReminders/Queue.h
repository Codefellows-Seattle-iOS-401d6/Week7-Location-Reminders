//
//  Queue.h
//  locationReminders
//
//  Created by Sung Kim on 7/25/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject

@property (strong, nonatomic) NSMutableArray *container;

- (instancetype)init;
- (BOOL)isEmpty;
- (void)enqueue:(id)object;
- (id)dequeue;
- (void)print;

@end
