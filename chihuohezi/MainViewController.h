//
//  MainViewController.h
//  chihuohezi
//
//  Created by alex on 13-7-15.
//  Copyright (c) 2013年 mahua.co 杭州麻花网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITabBarController
{
    UIImageView *_tabbarView;
    UIImageView *_buttonActiveImage;
}
- (void)showTabbar;
- (void)hideTabbar;

@end
