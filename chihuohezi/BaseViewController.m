//
//  BaseViewController.m
//  chihuohezi
//
//  Created by alex on 13-7-15.
//  Copyright (c) 2013年 mahua.co 杭州麻花网络科技有限公司. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
//    UIImageView *background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, ScreenHeight)];
//    background.image = [UIImage imageNamed:@"bg.jpg"];
//    self.view = background;
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
//    [background release];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//override
- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:18.0f];
    label.backgroundColor = [UIColor clearColor];
    label.text = title;
    [label sizeToFit];
    self.navigationItem.titleView = label;
    [label release];
}

@end
