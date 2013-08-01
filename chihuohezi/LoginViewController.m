//
//  LoginViewController.m
//  chihuohezi
//
//  Created by alex on 13-7-22.
//  Copyright (c) 2013年 mahua.co 杭州麻花网络科技有限公司. All rights reserved.
//

#import "LoginViewController.h"
#import "ASIHTTPRequest/ASIFormDataRequest.h"
#import "JSONKit.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"用户登录";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _leftButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = _leftButtonItem;
    
    _rigthtButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStyleDone target:self action:@selector(login)];
    self.navigationItem.rightBarButtonItem = _rigthtButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_username release];
    [_password release];
    [_logintip release];
    
    [_leftButtonItem release];
    [_rigthtButtonItem release];
    [super dealloc];
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

- (void)login {
    if ([self.username.text isEqual: @""]) {
        UIAlertView *alertView = [[UIAlertView alloc]init];
        alertView.title = @"请输入用户名";
        [alertView show];
        [alertView release];
    }else if ([self.password.text isEqual: @""]) {
        UIAlertView *alertView = [[UIAlertView alloc]init];
        alertView.title = @"请输入密码";
        [alertView show];
        [alertView release];
    }else{
        self.logintip.text = @"正在登录中";
        NSURL *url = [NSURL URLWithString:ServiceURL];
        ASIFormDataRequest *request = [[ASIFormDataRequest alloc]initWithURL:url];
        [request setPostValue:@"login" forKey:@"act"];
        [request setPostValue:self.username.text forKey:@"email"];
        [request setPostValue:self.password.text forKey:@"pwd"];
        [request setPostValue:@"1" forKey:@"r_type"];
        [request setTimeOutSeconds:2];
        [request startSynchronous];
        
        NSError *error = [request error];
        
        if (!error) {
            NSString *response = [request responseString];
            NSLog(@"%@",response);
            NSDictionary *dic = [response objectFromJSONString];
            NSLog(@"%@",dic);
            if (dic != nil && ([dic objectForKey:@"return"] == [NSNumber numberWithInt:1])) {
                self.logintip.text = @"登录成功";
                
                NSUserDefaults *accountInfo = [NSUserDefaults standardUserDefaults];
                [accountInfo setObject:self.username.text forKey:@"user_name"];
                [accountInfo setObject:self.password.text forKey:@"user_pwd"];
                [accountInfo synchronize];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }else{
            NSLog(@"%@",error);
        }
        [request release];
    }
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)registerAction:(id)sender {
}
@end
