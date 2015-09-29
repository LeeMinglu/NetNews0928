//
//  MLNetManager.h
//  NetNews0928
//
//  Created by 李明禄 on 15/9/29.
//  Copyright (c) 2015年 李明禄. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface MLNetManager : AFHTTPSessionManager

+ (instancetype)sharedNetManager;

@end
