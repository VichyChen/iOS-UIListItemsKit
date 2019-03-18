//
//  UITableViewItemsKit.h
//
//  Created on 2018/4/3.
//  Copyright © 2018年 Vichy_Chen. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UITableViewItem : NSObject

@property (nonatomic, assign) NSInteger numberOfRows;
@property (nonatomic, copy) UITableViewCell *(^cellForRow)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) CGFloat(^heightForRow)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) UIView *(^viewForHeader)(UITableView *tableView, NSInteger section);
@property (nonatomic, copy) CGFloat(^heightForHeader)(UITableView *tableView, NSInteger section);
@property (nonatomic, copy) UIView *(^viewForFooter)(UITableView *tableView, NSInteger section);
@property (nonatomic, copy) CGFloat(^heightForFooter)(UITableView *tableView, NSInteger section);
@property (nonatomic, strong) UIColor *footerColor;
@property (nonatomic, strong) UIColor *headerColor;
@property (nonatomic, copy) void(^didSelectRow)(UITableView *tableView, NSIndexPath *indexPath);

@end
