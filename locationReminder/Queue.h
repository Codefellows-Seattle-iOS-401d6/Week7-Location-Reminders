//
//  Queue.h
//  locationReminder
//
//  Created by Sean Champagne on 7/26/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject

-(void)enqueue:(id)anObject;
-(id)dequeue;

@end
