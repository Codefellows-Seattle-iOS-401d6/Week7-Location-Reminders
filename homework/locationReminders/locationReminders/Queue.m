//
//  Queue.m
//  locationReminders
//
//  Created by Sung Kim on 7/25/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "Queue.h"

@implementation Queue

- (instancetype)init
{
    self = [super init];
    if (!self) {
        self = [[Queue alloc]init];
    }
    self.container = [[NSMutableArray alloc]init];
    
    return self;
}

- (BOOL)isEmpty
{
    return (!self.container.count || !self.container);
}
//enqueue
- (void)enqueue:(id)object
{
    [self.container addObject:object];
}
//dequeue
- (id)dequeue
{
    id object = [self.container firstObject];
    [self.container removeObject:object];
    return object;
}

- (void)print
{
    for (id object in self.container ) {
        NSLog(@"%@", object);
    }
}

@end



//public struct Q<T>: ArrayLiteralConvertible {
//    public private(set) var elements = [T]()
//    
//    public var isEmpty: Bool {
//        return self.elements.isEmpty
//    }
//    
//    mutating func push(element: T) {
//        self.elements.append(element)
//    }
//    //What if the array is empty?? Maybe use a .count function
//    mutating func pop() -> T {
//        return self.elements.removeFirst()
//    }
//    //this initializer is necessary to conform to the ArrayLiteralConvertible protocol
//    public init(arrayLiteral elements: T...) {
//        self.elements = elements
//    }
//    
//    public func print() {
//        for element in self.elements {
//            Swift.print(element)
//        }
//    }
//}