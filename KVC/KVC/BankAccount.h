//
//  BankAccount.h
//  KVC
//
//  Created by huqinghe on 2018/1/2.
//  Copyright © 2018年 huqinghe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transaction.h"
@interface BankAccount : NSObject
@property (nonatomic) NSNumber* currentBalance;              // An attribute
//@property (nonatomic) Person* owner;                         // A to-one relation
@property (nonatomic) NSArray< Transaction* >* transactions; // A to-many relation
@end
