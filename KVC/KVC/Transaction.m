//
//  Transaction.m
//  KVC
//
//  Created by huqinghe on 2018/1/2.
//  Copyright © 2018年 huqinghe. All rights reserved.
//

#import "Transaction.h"

@implementation Transaction
-(void)test
{
    NSLog(@"self=:%@",self);
}

- (BOOL)validateValue:(inout id  _Nullable *)ioValue
               forKey:(NSString *)inKey
                error:(out NSError * _Nullable *)outError
{
    NSLog(@"=======||||======");
    return NO;
}
@end
