//
//  UIDevice+JBDeviceOwner.h
//  JBDeviceOwner
//
//  Created by Jake Boxer on 4/3/12.
//  Copyright (c) 2012 Jake Boxer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JBDeviceOwner;

@interface UIDevice (JBDeviceOwner)

@property (weak, nonatomic, readonly) JBDeviceOwner *owner;

@end
