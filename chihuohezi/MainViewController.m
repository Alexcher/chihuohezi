//
//  MainViewController.m
//  chihuohezi
//
//  Created by alex on 13-7-15.
//  Copyright (c) 2013年 mahua.co 杭州麻花网络科技有限公司. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "CategoryViewController.h"
#import "CartViewController.h"
#import "MyViewController.h"
#import "BaseNavigationController.h"
#import "SSKeychain.h"
#import "LoginViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBar.hidden = YES;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self _customTabBarFrame];
    [self _initViewController];
    [self _initTabbarView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [_tabbarView release];
    // Dispose of any resources that can be recreated.
}


//自定义tabbar高度和中间内容高度
- (void)_customTabBarFrame
{
    for(UIView *view in self.view.subviews){
        if(![view isKindOfClass:[UITabBar class]]){
            view.frame = CGRectMake(0, 0, 320, ScreenHeight-55);
            break;
        }
    }
    self.tabBar.frame = CGRectMake(0, ScreenHeight, 320, 49);
}


//初始化子控制器
- (void)_initViewController
{
    HomeViewController *home = [[HomeViewController alloc]init];
    CategoryViewController *category = [[CategoryViewController alloc]init];
    CartViewController *cart = [[CartViewController alloc]init];
    MyViewController *my = [[MyViewController alloc]init];
    
    NSArray *views = @[home,category,cart,my];
    [home release];
    [category release];
    [cart release];
    [my release];
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:views.count];
    
    for (UIViewController *viewController in views) {
        BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:viewController];
        [viewControllers addObject:nav];
        [nav release];
    }
    self.viewControllers = viewControllers;
}


//创建自定义tablebar
-(void)_initTabbarView
{
    _tabbarView = [[UIImageView alloc]initWithFrame:CGRectMake(0, ScreenHeight-60, 320, 60)];
    _tabbarView.image = [UIImage imageNamed:@"tabbar-bg.png"];
    _tabbarView.userInteractionEnabled = YES;
    
    
    _buttonActiveImage = [[UIImageView alloc]initWithFrame:CGRectMake(-10, 0, 100, 60)];
    _buttonActiveImage.image = [UIImage imageNamed:@"tabbar-bg-active.png"];
    [_tabbarView addSubview:_buttonActiveImage];
    [_buttonActiveImage release];
    
    NSArray *tabbarButtonImages = @[@"home-icon.png",@"category-icon.png",@"cart-icon.png",@"my-icon.png"];
    NSArray *tabbarButtonActiveImages = @[@"home-icon-active.png",@"category-icon-active.png",@"cart-icon-active.png",@"my-icon-active.png"];
    
    for (int i=0; i<tabbarButtonImages.count; i++) {
        NSString *buttonImages = tabbarButtonImages[i];
        NSString *buttonActiveImages = tabbarButtonActiveImages[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*80, 5, 80, 55);
        button.tag = i;
        [button setImage:[UIImage imageNamed:buttonImages] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:buttonActiveImages] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        [_tabbarView addSubview:button];
    }
    
    [self.view addSubview:_tabbarView];
    [_tabbarView release];

}
- (void)selectedTab:(UIButton *)button
{
    if (button.tag == 2 || button.tag == 3) {
        if (![self checkaccount]) {
            return;
        }
    }
    self.selectedIndex = button.tag;
    [UIView beginAnimations:nil context:nil];
    _buttonActiveImage.frame = CGRectMake(-10+button.tag*80, 0, 100, 60);
    [UIView commitAnimations];

}

- (BOOL)checkaccount
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"user_name"] == nil){
        LoginViewController *lvc = [[LoginViewController alloc]init];
        BaseNavigationController *nvc = [[BaseNavigationController alloc]initWithRootViewController:lvc];
        [lvc release];
        [self presentViewController:nvc animated:YES completion:nil];
        [nvc release];
        return NO;
    }else{
        return YES;
    }
}

- (void)showTabbar
{
    [UIView beginAnimations:nil context:nil];
    _tabbarView.frame = CGRectMake(0, ScreenHeight-60, 320, 60);
    [UIView commitAnimations];
}
- (void)hideTabbar
{
    [UIView beginAnimations:nil context:nil];
    _tabbarView.frame = CGRectMake(0, ScreenHeight, 320, 60);
    [UIView commitAnimations];
}

@end
