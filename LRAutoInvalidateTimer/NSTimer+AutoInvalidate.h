//
//  NSTimer+AutoInvalidate.h
//  LRAutoInvalidateTimer
//
//  Created by panshen on 2017/9/29.
//  Copyright © 2017年 panshen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LDTimeTargetBlock)(NSTimer *timer);

@interface LDTimerTarget : NSObject

@end

@interface NSTimer (AutoInvalidate)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                      block:(LDTimeTargetBlock)block
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)yesOrNo
                                existObject:(id)existObj;
- (void)pauseTimer;
- (void)resumeTimer;
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
