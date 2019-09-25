//
//  NSObject+DataConversion.m
//  实现字典转模型
//
//  Created by zhifu360 on 2019/9/25.
//  Copyright © 2019 ZZJ. All rights reserved.
//

#import "NSObject+DataConversion.h"
#import <objc/message.h>

@implementation NSObject (DataConversion)

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [self init];
    if (self) {
        //获取类的属性及属性对应的类型
        NSMutableArray *keys = [NSMutableArray array];
        NSMutableArray *attributes = [NSMutableArray array];
        unsigned int count;
        objc_property_t *propertys = class_copyPropertyList([self class], &count);
        for (int i = 0; i < count; i ++) {
            objc_property_t property = propertys[i];
            //获取属性的名字
            NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            [keys addObject:propertyName];
            //获取属性的名字和@encode编码
            NSString *attributeName = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
            [attributes addObject:attributeName];
        }
        //释放内存
        free(propertys);
        
        //根据类型给属性赋值
        for (NSString *key in keys) {
            if ([dict objectForKey:key] == nil) {
                continue;
            }
            [self setValue:[dict objectForKey:key] forKey:key];
        }
    }
    return self;
}

@end
