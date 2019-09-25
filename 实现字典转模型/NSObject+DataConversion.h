//
//  NSObject+DataConversion.h
//  实现字典转模型
//
//  Created by zhifu360 on 2019/9/25.
//  Copyright © 2019 ZZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DataConversion)

/**
 Runtime实现字典转模型
 @param dict 原始字典
 */
- (instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
