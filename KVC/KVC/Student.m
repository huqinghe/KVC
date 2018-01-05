//
//  Student.m
//  KVC
//
//  Created by huqinghe on 2018/1/2.
//  Copyright © 2018年 huqinghe. All rights reserved.
//

#import "Student.h"
#import "Dog.h"
@interface Student()
{
    @private
    int _height;
}
@property(nonatomic,copy)NSString* bName;
@end
@implementation Student
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
//    [super setValue:value forUndefinedKey:key];
//    NSLog(@"value=:%@;key=:%@",value,key);

}
-(id)valueForUndefinedKey:(NSString *)key{
    NSLog(@"没有找到key=:%@",key);
    return nil;
}

-(void)setNilValueForKey:(NSString *)key
{
    NSLog(@"key=:%@",key);
}

+ (BOOL)accessInstanceVariablesDirectly{
    
    return NO;
}


@end
