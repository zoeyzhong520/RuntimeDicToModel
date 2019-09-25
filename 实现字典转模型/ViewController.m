//
//  ViewController.m
//  实现字典转模型
//
//  Created by zhifu360 on 2019/9/25.
//  Copyright © 2019 ZZJ. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+DataConversion.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDictionary *dict = @{
                           @"name":@"Steven",
                           @"age":@10,
                           @"sex":@"男"
                           };
    Person *person = [[Person alloc] initWithDict:dict];
    NSLog(@"name=%@\nage=%@\nsex=%@",person.name,person.age,person.sex
          );
}


@end
