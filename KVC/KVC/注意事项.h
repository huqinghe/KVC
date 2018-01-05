//
//  注意事项.h
//  KVC
//
//  Created by huqinghe on 2018/1/5.
//  Copyright © 2018年 huqinghe. All rights reserved.
//

1 keypath 可以一连串的使用kvc
/*
 * [student setValue:@"tiger" forKeyPath:@"dog.name"];
 */
2 如果是nil 用null的单利NUll填充
/*
 *
 NSMutableDictionary* dic2 = [[NSMutableDictionary alloc] init];
 dic2[@"n1"]=[NSNull null];
 dic2[@"n2"]=[NSNull null];
 dic2[@"n3"]=student;
 dic2[@"n4"]=student;
 NSLog(@"dic2=:%@",dic2);

 */
3 集合专用的运算符
/*
 * [bankAccount.transactions valueForKeyPath:@"@avg.amount"];
 */
4 NSValue NSNumber 自动拆包
/** 结构体拆包
 ThreeFloats floats = {1., 2., 3.};
 NSValue* value = [NSValue valueWithBytes:&floats objCType:@encode(ThreeFloats)];
 [student setValue:value forKey:@"threeFloats"];
 NSLog(@"======================");
 NSValue* result = [student valueForKey:@"threeFloats"];
 
 ThreeFloats unWrap ;
 [result getValue:&unWrap];
 NSLog(@"x=:%f",unWrap.x);
 */

5 数据结构也可以使用
/*
 *
 NSLog(@"Rect 系统结构体拆包");
 CGRect rect = CGRectMake(0, 0, 100, 100);
 NSValue *valueRect = [NSValue valueWithBytes:&rect objCType:@encode(CGRect)];
 [student setValue:valueRect forKey:@"rect"];
 CGRect unWrap ;
 NSValue *unWrapRect = [student valueForKey:@"rect"];
 [unWrapRect getValue:&unWrap];
 NSLog(@"--====:%@",NSStringFromCGRect(unWrap));

 *
 */
6 验证一个数据是否支持kvc--系统自动验证也可以手动实现（必须手动调用 ）
/*
 *validateValue
 *[student validateValue:&name forKey:@"payee" error:&error]
 *
 */
7 字典到模型的转化
/*
     NSDictionary *dic = @{@"age": @175.5,
     @"height":@190.8,
     @"bName":@"youName"
     };
     [student setValuesForKeysWithDictionary:dic];
     NSLog(@"height=:%@",[student valueForKey:@"_height"]);
     NSLog(@"bName=:%@",[student valueForKey:@"bName"]);
     NSLog(@"bName=:%@",[student valueForKey:@"age"]);
 *
 */
