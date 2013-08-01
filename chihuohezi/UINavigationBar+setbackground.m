//
//  UINavigationBar+setbackground.m
//  chihuohezi
//
//  Created by alex on 13-7-15.
//  Copyright (c) 2013年 mahua.co 杭州麻花网络科技有限公司. All rights reserved.
//

#import "UINavigationBar+setbackground.h"

@implementation UINavigationBar (setbackground)

- (void)drawRect:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed:@"topbar-bg.png"];
    [image drawInRect:rect];
}
@end
