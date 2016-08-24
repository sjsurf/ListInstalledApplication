//
//  ViewController.m
//  ListInstalledApps
//
//  Created by Baymax on 8/24/16.
//  Copyright © 2016 Baymax. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self listInstalledApps];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (void)listInstalledApps {
    Class c = NSClassFromString(@"LSApplicationWorkspace");
    id s = [(id)c performSelector:NSSelectorFromString(@"defaultWorkspace")];
    NSArray *arry = [s performSelector:NSSelectorFromString(@"allInstalledApplications")];
    for (id item in arry) {
        NSLog(@"%@",[item performSelector:NSSelectorFromString(@"applicationIdentifier")]);
        NSLog(@"%@",[item performSelector:NSSelectorFromString(@"bundleVersion")]);
        NSLog(@"%@",[item performSelector:NSSelectorFromString(@"shortVersionString")]);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
