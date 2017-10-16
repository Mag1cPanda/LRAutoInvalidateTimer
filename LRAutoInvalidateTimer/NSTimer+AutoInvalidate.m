//
//  NSTimer+AutoInvalidate.m
//  LRAutoInvalidateTimer
//
//  Created by panshen on 2017/9/29.
//  Copyright © 2017年 panshen. All rights reserved.
//

#import "NSTimer+AutoInvalidate.h"

@interface LDTimerTarget ()
@property (nonatomic ,weak)NSTimer *timer;  //注意是weak
@property (nonatomic,copy) LDTimeTargetBlock block;
@property (nonatomic,weak) id existObj;  //注意是weak
@end

@implementation LDTimerTarget

- (id)initWithTimerTargetBlock:(LDTimeTargetBlock)block timer:(NSTimer *)timer existObj:(id)existObj {
    if (self = [super init]) {
        _block = block;
        _timer = timer;
        _existObj = existObj;
    }
    return self;
}

- (void)invalidation {
    if (_existObj) {
        if ((_block)) {
            _block(_timer);
        }
    }else {
        [_timer invalidate];
        _timer = nil;
    }
}

@end


@implementation NSTimer (AutoInvalidate)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)intervval
                                      block:(LDTimeTargetBlock)block
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)yesOrNo
                                existObject:(id)existObj
{
    
    LDTimerTarget *target = [[LDTimerTarget alloc] initWithTimerTargetBlock:block timer:nil existObj:existObj];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:intervval target:target selector:@selector(invalidation) userInfo:userInfo repeats:yesOrNo];
    target.timer = timer;
    return timer;
}

-(void)pauseTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}


-(void)resumeTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
