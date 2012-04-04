//
//  UIDevice+JBDeviceOwner.m
//  JBDeviceOwner
//
//  Created by Jake Boxer on 4/3/12.
//  Copyright (c) 2012 Jake Boxer. All rights reserved.
//

#import "UIDevice+JBDeviceOwner.h"
#import "JBDeviceOwner.h"

// Forces this .m file to be linked without needing -all_load or -force_load
@interface FIX_CATEGORY_BUG_JBDeviceOwner @end
@implementation FIX_CATEGORY_BUG_JBDeviceOwner @end

@implementation UIDevice (JBDeviceOwner)

- (JBDeviceOwner *)owner {
  JBDeviceOwner *potentialOwner = [[JBDeviceOwner alloc] initWithDevice:self];
  return potentialOwner.hasAddressBookMatch ? potentialOwner : nil;
}

@end
