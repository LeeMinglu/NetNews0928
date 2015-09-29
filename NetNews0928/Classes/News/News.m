//
//  News.m
//  新闻
//
//  Created by apple on 15/6/21.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "News.h"
#import "MLNetManager.h"

@implementation News

+ (instancetype)newsWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    NSArray *propertis = @[@"title", @"digest", @"replyCount", @"imgsrc"];
    
    for (NSString *key in propertis) {
        // 判断 dict 是否存在 key
        if (dict[key] != nil) {
            [obj setValue:dict[key] forKeyPath:key];
        }
    }
//    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

- (NSString *)description {
    NSArray *propertis = @[@"title", @"digest", @"replyCount", @"imgsrc"];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:propertis];
    
    return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, dict];
}

+ (void)loadNewsListWithURLString:(NSString *)urlString {
    
    [[MLNetManager sharedNetManager] GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        
        // url 不同，第一层字典的 key 不同
        // 利用 keyEnumerator.nextObject 能够拿到 第一个 key
        // 主要用来遍历字典
//        NSLog(@"%@", responseObject.keyEnumerator.nextObject);
        
         NSLog(@"%@", responseObject.objectEnumerator);
        // 根据 key 拿到第一个数组
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        NSLog(@"%@", array);
        
        // 字典转模型
        // Capacity：容量，假设是 10，一次性分配10个存储空间
        // 当添加第11个元素，会再次开辟10个存储空间！
        // 使用 [NSMutableArray array] 创建的可变数组，会在每一次添加对象的时候，临时申请空间
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        
        for (NSDictionary *obj in array) {
            [arrayM addObject:[self newsWithDict:obj]];
        }
        
        NSLog(@"%@", arrayM);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
