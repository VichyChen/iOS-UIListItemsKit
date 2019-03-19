//
//  UITableViewItemsKit.h
//
//  Created on 2018/4/3.
//  Copyright © 2018年 Vichy_Chen. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "UITableViewItem.h"
#import "UITableViewItemsDelegate.h"

@interface UITableViewItemsKit : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id <UITableViewItemsDelegate> delegate;

@property (nonatomic, copy) NSArray <UITableViewItem *>*dataSource;

- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<UITableViewItemsDelegate>)delegate ;

@end
