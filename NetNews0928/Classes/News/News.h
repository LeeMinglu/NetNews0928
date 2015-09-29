//
//  News.h
//  新闻
//
//  Created by apple on 15/6/21.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
/**
 *  新闻标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  新闻摘要
 */
@property (nonatomic, copy) NSString *digest;
/**
 *  跟贴数量
 */
@property (nonatomic, assign) int replyCount;
/**
 *  配图地址
 */
@property (nonatomic, copy) NSString *imgsrc;

+ (instancetype)newsWithDict:(NSDictionary *)dict;

/**
 *  加载指定 URL 的新闻数组
 */
+ (void)loadNewsListWithURLString:(NSString *)urlString;

@end
