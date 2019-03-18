//
//  UITableViewItemsKit.h
//
//  Created on 2018/4/3.
//  Copyright © 2018年 Vichy_Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol UITableViewItemsDelegate <NSObject>

@required
- (NSArray<UITableViewItem *> *)tableViewItemsInTableView:(UITableView *)tableView;

@optional
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

@end
