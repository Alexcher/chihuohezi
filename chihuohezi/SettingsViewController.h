//
//  SettingsViewController.h
//  chihuohezi
//
//  Created by alex on 13-7-31.
//  Copyright (c) 2013年 mahua.co 杭州麻花网络科技有限公司. All rights reserved.
//

#import "BaseViewController.h"

@interface SettingsViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource,UIActionSheetDelegate>
{
    NSArray *_modeArray, *_infoArray, *_otherArray;
}
@property (retain, nonatomic) IBOutlet UITableView *settingsTableView;

@end