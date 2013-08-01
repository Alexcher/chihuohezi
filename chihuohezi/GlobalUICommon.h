//
//  GlobalUICommon.h
//  chihuohezi
//
//  Created by alex on 13-7-16.
//  Copyright (c) 2013年 mahua.co 杭州麻花网络科技有限公司. All rights reserved.
//

#ifndef chihuohezi_GlobalUICommon_h
#define chihuohezi_GlobalUICommon_h

#endif


//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width


/**
 * @返回当前iPhone OS 运行的版本
 *
 */
float OSversion();

/**
 * @返回应用程序物理屏幕大小
 *
 */
CGRect ApplicationBounds();

/**
 * @返回应用程序去除状态栏高度的大小
 *
 */
CGRect ApplicationFrame();