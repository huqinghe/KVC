//
//  Student.h
//  KVC
//
//  Created by huqinghe on 2018/1/2.
//  Copyright © 2018年 huqinghe. All rights reserved.
//
#import <UIKit/UIKit.h>
typedef struct {
    float x, y, z;
} ThreeFloats;

#import <Foundation/Foundation.h>
#import "Dog.h"
@interface Student : NSObject
@property(nonatomic,assign)float age;
@property(nonatomic,copy)NSString*name;
@property(nonatomic,strong)Dog *dog;
@property(nonatomic) ThreeFloats threeFloats;
@property(nonatomic)CGRect rect;
@end
