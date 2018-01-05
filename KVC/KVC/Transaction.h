//
//  Transaction.h
//  KVC
//
//  Created by huqinghe on 2018/1/2.
//  Copyright © 2018年 huqinghe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transaction : NSObject
@property (nonatomic) NSString* payee;   // To whom
@property (nonatomic) NSNumber* amount;  // How much
@property (nonatomic) NSDate* date;      // When

-(void)test;
@end
