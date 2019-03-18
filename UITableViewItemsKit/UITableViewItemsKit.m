//
//  UITableViewItemsKit.m
//
//  Created on 2018/4/3.
//  Copyright © 2018年 Vichy_Chen. All rights reserved.
//


#import "UITableViewItemsKit.h"

@implementation UITableViewItemsKit

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<UITableViewItemsDelegate>)delegate {
    if (self = [super init]) {
        self.delegate = delegate;
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"UITableViewHeaderFooterView"];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"UITableViewItemsKit dealloc");
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.delegate tableViewItemsInTableView:tableView] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    UITableViewItem *model = [self.delegate tableViewItemsInTableView:tableView][section];
    return model.numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewItem *model = [self.delegate tableViewItemsInTableView:tableView][indexPath.section];
    UITableViewCell *(^block)(UITableView *, NSIndexPath *) = model.cellForRow;
    if (block) {
        return block(tableView, indexPath);
    }
    return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewItem *model = [self.delegate tableViewItemsInTableView:tableView][indexPath.section];
    CGFloat (^block)(UITableView *, NSIndexPath *) = model.heightForRow;
    if (block) {
        return block(tableView, indexPath);
    }
    return UITableViewAutomaticDimension;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewItem *model = [self.delegate tableViewItemsInTableView:tableView][section];
    UIView *(^block)(UITableView *, NSInteger) = model.viewForHeader;
    if (block) {
        return block(tableView, section);
    }
    else {
        UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"UITableViewHeaderFooterView"];
        if (model.heightForHeader) {
            view.contentView.backgroundColor = model.headerColor ?: [UIColor whiteColor];
        }
        return view;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    UITableViewItem *model = [self.delegate tableViewItemsInTableView:tableView][section];
    CGFloat (^block)(UITableView *, NSInteger) = model.heightForHeader;
    if (block) {
        return block(tableView, section);
    }
    return CGFLOAT_MIN;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UITableViewItem *model = [self.delegate tableViewItemsInTableView:tableView][section];
    UIView *(^block)(UITableView *, NSInteger) = model.viewForFooter;
    if (block) {
        return block(tableView, section);
    }
    else {
        UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"UITableViewHeaderFooterView"];
        if (model.heightForFooter) {
            view.contentView.backgroundColor = model.footerColor ?: [UIColor whiteColor];
        }
        return view;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    UITableViewItem *model = [self.delegate tableViewItemsInTableView:tableView][section];
    CGFloat (^block)(UITableView *, NSInteger) = model.heightForFooter;
    if (block) {
        return block(tableView, section);
    }
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewItem *model = [self.delegate tableViewItemsInTableView:tableView][indexPath.section];
    void (^block)(UITableView *, NSIndexPath *) = model.didSelectRow;
    if (block) {
        block(tableView, indexPath);
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.delegate scrollViewDidScroll:scrollView];
    }
}

@end
