//
//  MyViewController.m
//  chihuohezi
//
//  Created by alex on 13-7-22.
//  Copyright (c) 2013年 mahua.co 杭州麻花网络科技有限公司. All rights reserved.
//

#import "MyViewController.h"
#import "SettingsViewController.h"
#import "MainViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"我的";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.rightButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showSettingsView)];
    self.navigationItem.rightBarButtonItem = self.rightButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
    [_rightButtonItem release];
}

- (void)showSettingsView
{
    MainViewController *tabbarController = (MainViewController *)self.tabBarController;
    [tabbarController hideTabbar];
    SettingsViewController *svc = [[SettingsViewController alloc]init];
    svc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:svc animated:YES];
    [svc release];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    MainViewController *tabbarController = (MainViewController *)self.tabBarController;
    [tabbarController showTabbar];
}


@end
