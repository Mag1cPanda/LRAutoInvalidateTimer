//
//  ViewController.m
//  LRAutoInvalidateTimer
//
//  Created by panshen on 2017/9/29.
//  Copyright © 2017年 panshen. All rights reserved.
//

#import "ViewController.h"
#import "NSTimer+AutoInvalidate.h"

@interface ViewController ()
{
    NSTimer *timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer *timer) {
        
        NSLog(@"1");
        
    } userInfo:nil repeats:YES existObject:self];
    
    [timer fire];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
