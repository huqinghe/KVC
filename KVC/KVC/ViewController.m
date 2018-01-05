//
//  ViewController.m
//  KVC
//
//  Created by huqinghe on 2018/1/2.
//  Copyright © 2018年 huqinghe. All rights reserved.
//
#import "ViewController.h"
#import "Student.h"
#import "Dog.h"
#import "BankAccount.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)kvc:(id)sender
{
    NSLog(@"kvc");
    Student *student = [[Student alloc] init];
//    student.dog = [[Dog alloc] init];
//    [student setValue:@175 forKey:@"_height"];
//    NSLog(@"height=:%@",[student valueForKey:@"_height"]);
//    [student setValue:@"bNameValue" forKey:@"bName"];
//    NSLog(@"bName=:%@",[student valueForKey:@"bName"]);
    
    /**
    NSLog(@"测试传入字典");
    NSDictionary *dic = @{@"age": @175.5,
                          @"height":@190.8,
                          @"bName":@"youName"
                          };
    [student setValuesForKeysWithDictionary:dic];
    NSLog(@"height=:%@",[student valueForKey:@"_height"]);
    NSLog(@"bName=:%@",[student valueForKey:@"bName"]);
    NSLog(@"bName=:%@",[student valueForKey:@"age"]);
//    NSLog(@"=noKey=%@",[student valueForKey:@"noKey"]);
     */
    
    /**  测试没有 属性*/
   // [student setValue:@"yichang" forUndefinedKey:@"nokey"];
//    NSLog(@"noKey=%@",[student valueForKey:@"noKey"]);
    
    /** 测试类型不一致
        [student setValue:@123456.9 forKeyPath:@"age"];
        NSLog(@"==:%@",[student valueForKey:@"age"]);
        NSLog(@"age=:%f",student.age);
     */
    /** 测试禁掉kvc
        [student setValue:@"1234567890" forKey:@"_height"];
        NSLog(@"bName=:%@",[student valueForKey:@"_height"]);
     */
    /**测试是否可以set nil
    [student setValue:nil forKey:@"bName"];
    NSLog(@"b==:%@",[student valueForKey:@"bName"]);
     **/
    /**
     keypath  相当于一层一层的调用 keypath
    
    NSLog(@"use setValue keyPath");
    [student setValue:@"tiger" forKeyPath:@"dog.name"];
    [student valueForKeyPath:@"dog2"];
    NSLog(@"=studnet.dog.name=:%@",student.dog.name);
    
    Student *student2 = [[Student alloc] init];
    student2.dog= [[Dog alloc] init];
    NSLog(@"use setValue forkey");
    [student2 setValue:@"fox" forKey:@"dog.name"];
    NSLog(@"student.dog.name=:%@",student2.dog.name);
      */
//    student.age  = 17.5;
//    student.dog = [[Dog alloc] init];
    /*
     * %p 对象的内存地址
     * %x &a 指针的地址
     */
    /**   如果是空用NULL单利填充
    NSDictionary *dic = [student dictionaryWithValuesForKeys:@[@"age",@"dog"]];
    NSLog(@"values==:%p",[dic objectForKey:@"dog"]);
    NSLog(@"=1=%p",[NSNull null]);
    NSLog(@"=2=%p",[NSNull null]);
    
    NSMutableDictionary* dic2 = [[NSMutableDictionary alloc] init];
    dic2[@"n1"]=[NSNull null];
    dic2[@"n2"]=[NSNull null];
    dic2[@"n3"]=student;
    dic2[@"n4"]=student;
    NSLog(@"dic2=:%@",dic2);
     */
    
    
}
/*
 * 数组操作
 */
- (IBAction)kvcOpration:(id)sender
{
    NSLog(@"====");
    BankAccount *bankAccount = [[BankAccount alloc] init];
    NSMutableArray* objArray = [[NSMutableArray alloc] init];
    Transaction *t1 = [[Transaction alloc] init];
    t1.payee = @"a";
    t1.amount = [NSNumber numberWithInt:4];
    [objArray addObject:t1];
    
    Transaction *t2 = [[Transaction alloc] init];
    t2.amount = [NSNumber numberWithInt:8];
    t2.payee= @"b";
    [objArray addObject:t2];
    
    Transaction *t3 = [[Transaction alloc] init];
    t3.amount = [NSNumber numberWithInt:8];
    t3.payee  = @"c";
    [objArray addObject:t3];

    bankAccount.transactions = objArray;
    NSNumber* avg = [bankAccount.transactions valueForKeyPath:@"@avg.amount"];//amount
    NSLog(@"avg=:%@",avg);
    NSArray *unionOfObjects = [bankAccount.transactions valueForKeyPath:@"@unionOfObjects.amount"];
    NSLog(@"union=:%@",unionOfObjects);
    
    NSArray *distinctUnionOfObjects = [bankAccount.transactions valueForKeyPath:@"@distinctUnionOfObjects.amount"];
    NSLog(@"distinctUnionOfObjects=:%@",distinctUnionOfObjects);
    
    
    
//    NSMutableArray *avgArrayTest = [[NSMutableArray alloc] init];
//    [avgArrayTest addObject:@11.0];
//     [avgArrayTest addObject:@12.0];
//    [avgArrayTest addObject:@13.0];
//    [avgArrayTest addObject:@14.0];
//    NSNumber*number = [avgArrayTest valueForKey:<#(nonnull NSString *)#>];
//
    
}



- (IBAction)setNilValue:(id)sender
{
    //
    //
    Student *stdent = [[Student alloc] init];
    [stdent setValue:nil forKey:@"name"];
}



- (IBAction)wrap:(id)sender
{
    Student *student = [[Student alloc] init];
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
    
    NSLog(@"Rect 系统结构体拆包");
    CGRect rect = CGRectMake(0, 0, 100, 100);
    NSValue *valueRect = [NSValue valueWithBytes:&rect objCType:@encode(CGRect)];
    [student setValue:valueRect forKey:@"rect"];
    CGRect unWrap ;
    NSValue *unWrapRect = [student valueForKey:@"rect"];
    [unWrapRect getValue:&unWrap];
    NSLog(@"--====:%@",NSStringFromCGRect(unWrap));
    
}


- (IBAction)validateValue:(id)sender
{
//    Transaction *student = [[Transaction alloc] init];
//    NSError *error;
//    NSString* name = @"John";
//    if (![student validateValue:&name forKey:@"payee" error:&error])
//    {
//        NSLog(@"error=:%@",error);
//    }
//    [student setValue:@"John" forKey:@"payee"];
//    NSLog(@"name=:%@",[student valueForKey:@"payee"]);
    
    Transaction *transation = [[Transaction alloc] init];
    [transation setValue:@"Jon" forKey:@"name"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
