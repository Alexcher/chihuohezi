//
//  SettingsViewController.m
//  chihuohezi
//
//  Created by alex on 13-7-31.
//  Copyright (c) 2013年 mahua.co 杭州麻花网络科技有限公司. All rights reserved.
//

#import "SettingsViewController.h"
#import "MainViewController.h"
@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _modeArray = @[@"智能模式", @"高质量图片(适合WiFi环境)"];
        _infoArray = @[@"官方客服", @"官方网站"];
        _otherArray = @[@"应用打分", @"关于应用"];
        [_modeArray retain];
        [_infoArray retain];
        [_otherArray retain];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    MainViewController *tabBarController = (MainViewController *)self.tabBarController;
    [tabBarController hideTabbar];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_settingsTableView release];
    [_modeArray release];
    [_infoArray release];
    [_otherArray release];
    [super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num = 0;
    if (section == 0) {
		num = _modeArray.count;
	} else if (section == 1) {
		num = _infoArray.count;
	} else if (section == 2) {
        num = _otherArray.count;
    }
    return num;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[[UITableViewCell alloc]initWithStyle:UIta reuseIdentifier:cellIdentifier]autorelease];
    }
    if (indexPath.section == 0) {
		cell.textLabel.text = [_modeArray objectAtIndex:indexPath.row];
	} else if (indexPath.section == 1) {
		cell.textLabel.text = [_infoArray objectAtIndex:indexPath.row];
	} else if (indexPath.section == 2) {
        cell.textLabel.text = [_otherArray objectAtIndex:indexPath.row];
    }
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16.0];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    float height = 0;
    if (section == 2) {
        height = 60;
    }
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = nil;
    if (section == 2) {
        footerView = [[[UIView alloc]initWithFrame:CGRectMake(10, 20, 300, 44)]autorelease];
        UIButton *logoutBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        logoutBtn.frame = footerView.frame;
        [logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [logoutBtn setBackgroundImage:[UIImage imageNamed:@"btn-rect-red.png"] forState:UIControlStateNormal];
        [logoutBtn setBackgroundImage:[UIImage imageNamed:@"btn-rect-red-active.png"] forState:UIControlStateHighlighted];
        [logoutBtn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
        if (OSversion() >= 6.0) {
            logoutBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        } else {
            logoutBtn.titleLabel.textAlignment = UITextAlignmentCenter;
        }
        [footerView addSubview:logoutBtn];
    }
    return footerView;
}

//退出登录,弹出提示sheet
- (void)logout
{
    UIActionSheet *alertSheet = [[UIActionSheet alloc]initWithTitle:@"确定要退出登录吗？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确认" otherButtonTitles:nil];
    [alertSheet showInView:self.view];
    [alertSheet release];

}

//删除plist中的user_name,user_pwd字段
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
       NSUserDefaults *accountInfo = [NSUserDefaults standardUserDefaults];
        [accountInfo removeObjectForKey:@"user_name"];
        [accountInfo removeObjectForKey:@"user_pwd"];
        [accountInfo synchronize];
        [self.navigationController popViewControllerAnimated:YES];
        MainViewController *mvc = (MainViewController *)self.tabBarController;
        mvc.selectedIndex = 0;
    }
}

@end
