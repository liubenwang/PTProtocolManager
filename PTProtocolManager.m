//
//  PTProtocolManager.m
//  ProductTest
//
//  Created by benwang liu on 2017/5/23.
//  Copyright © 2017年 liubenwang. All rights reserved.
//

#import "PTProtocolManager.h"

@interface PTProtocolManager ()

@property (nonatomic, strong) NSMutableDictionary *serviceProvideSource;

@end

@implementation PTProtocolManager
+ (PTProtocolManager *)sharedInstance
{
    static PTProtocolManager * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _serviceProvideSource = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+ (void)registServiceProvide:(id)provide forProtocol:(Protocol*)protocol
{
    if (provide == nil || protocol == nil)
        return;
    [[self sharedInstance].serviceProvideSource setObject:provide forKey:NSStringFromProtocol(protocol)];
}

+ (id)serviceProvideForProtocol:(Protocol *)protocol
{
    return [[self sharedInstance].serviceProvideSource objectForKey:NSStringFromProtocol(protocol)];
}

@end
