//
//  ViewController.h
//  testFrpclib
//
//  Created by ℡龙龙 on 2018/11/14.
//  Copyright © 2018年 ℡龙龙. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - file path
- (NSString *)getConfigFilePath {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"ini"];
//    NSString *fileContent = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return path;
}

#pragma mark - action events

- (IBAction)runBtnClick:(UIButton *)sender {
    NSLog(@"%@",[self getConfigFilePath]);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //frpclib run
        FrpclibRun([self getConfigFilePath]);
        dispatch_async(dispatch_get_main_queue(), ^{
            //刷新UI
        });
    });
}

@end
