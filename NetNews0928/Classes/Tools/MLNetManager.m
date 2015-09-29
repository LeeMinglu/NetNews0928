//
//  MLNetManager.m
//  NetNews0928
//
//  Created by 李明禄 on 15/9/29.
//  Copyright (c) 2015年 李明禄. All rights reserved.
//

#import "MLNetManager.h"

@implementation MLNetManager

+ (instancetype)sharedNetManager
{
    static MLNetManager *instance;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/"];
        
        //设置BAseurl
        instance = [[self alloc] initWithBaseURL:url];
        
        //添加相应的数据解析格式
        
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/javascript", @"text/html", nil];
       });
    
    
    
    
    return instance;
}

@end
