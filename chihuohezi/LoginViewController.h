//
//  LoginViewController.h
//  chihuohezi
//
//  Created by alex on 13-7-22.
//  Copyright (c) 2013年 mahua.co 杭州麻花网络科技有限公司. All rights reserved.
//


@interface LoginViewController : UIViewController
{
    UIBarButtonItem *_leftButtonItem,*_rigthtButtonItem;
}

@property (retain, nonatomic) IBOutlet UITextField *username;
@property (retain, nonatomic) IBOutlet UITextField *password;
@property (retain, nonatomic) IBOutlet UILabel *logintip;

- (IBAction)registerAction:(id)sender;

@end
