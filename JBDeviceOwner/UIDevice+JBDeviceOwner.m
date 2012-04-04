//
//  UIDevice+JBDeviceOwner.m
//  JBDeviceOwner
//
//  Created by Jake Boxer on 4/3/12.
//  Copyright (c) 2012 Jake Boxer. All rights reserved.
//

#import "UIDevice+JBDeviceOwner.h"
#import "JBDeviceOwner.h"

@implementation UIDevice (JBDeviceOwner)

- (JBDeviceOwner *)owner {
  JBDeviceOwner *potentialOwner = [[JBDeviceOwner alloc] initWithDevice:self];
  return potentialOwner.hasAddressBookMatch ? potentialOwner : nil;
}

@end
