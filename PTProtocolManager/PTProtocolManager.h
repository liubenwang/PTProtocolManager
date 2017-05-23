//
//  PTProtocolManager.h
//  ProductTest
//
//  Created by benwang liu on 2017/5/23.
//  Copyright © 2017年 liubenwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTProtocolManager : NSObject

+ (void)registServiceProvide:(id)provide forProtocol:(Protocol*)protocol;

+ (id)serviceProvideForProtocol:(Protocol *)protocol;

@end
