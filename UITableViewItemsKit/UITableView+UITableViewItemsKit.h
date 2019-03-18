//
//  UITableView+UITableViewItemsKit.h
//
//  Created on 2018/4/3.
//  Copyright © 2018年 Vichy_Chen. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "UITableViewItemsKit.h"
#import "UITableViewItemsDelegate.h"

@interface UITableView (UITableViewItemsKit)

@property (nonatomic, weak) IBOutlet id <UITableViewItemsDelegate> itemsDelegate;

@property (nonatomic, strong) UITableViewItemsKit *tableViewItemsKit;

@end
