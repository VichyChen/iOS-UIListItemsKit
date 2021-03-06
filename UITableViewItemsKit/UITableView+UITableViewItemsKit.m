//
//  UITableView+UITableViewItemsKit.m
//
//  Created on 2018/4/3.
//  Copyright © 2018年 Vichy_Chen. All rights reserved.
//


#import "UITableView+UITableViewItemsKit.h"
#import "objc/runtime.h"

@implementation UITableView (UITableViewItemsKit)

- (id<UITableViewItemsDelegate>)itemsDelegate {
    return objc_getAssociatedObject(self, _cmd);;
}

- (void)setItemsDelegate:(id<UITableViewItemsDelegate>)itemsDelegate {
    objc_setAssociatedObject(self, @selector(itemsDelegate), itemsDelegate, OBJC_ASSOCIATION_ASSIGN);
    
    self.tableViewItemsKit = [[UITableViewItemsKit alloc] initWithTableView:self delegate:self.itemsDelegate];
}

- (UITableViewItemsKit *)tableViewItemsKit {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTableViewItemsKit:(UITableViewItemsKit *)tableViewItemsKit {
    objc_setAssociatedObject(self, @selector(tableViewItemsKit), tableViewItemsKit, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod(self.class, @selector(reloadData));
        Method swizzledMethod = class_getInstanceMethod(self.class, @selector(UITableViewItemsKit_reloadData));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (void)UITableViewItemsKit_reloadData {
    if (self.tableViewItemsKit) {
        self.tableViewItemsKit.dataSource = nil;
    }
    [self UITableViewItemsKit_reloadData];
}

@end
