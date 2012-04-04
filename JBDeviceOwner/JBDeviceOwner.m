//
//  JBDeviceOwner.m
//  JBDeviceOwner
//
//  Created by Jake Boxer on 4/3/12.
//  Copyright (c) 2012 Jake Boxer. All rights reserved.
//

#import "JBDeviceOwner.h"

@interface JBDeviceOwner ()

@property (weak, nonatomic) UIDevice *device;
@property (strong, nonatomic, readwrite) NSString *firstName;
@property (strong, nonatomic, readwrite) NSString *lastName;
@property (strong, nonatomic, readwrite) NSString *middleName;

@end

@implementation JBDeviceOwner

static NSString * const kDeviceNameSuffix = @"'s iPhone";

@synthesize device;
@synthesize firstName;
@synthesize lastName;
@synthesize middleName;

#pragma mark - Creation/Removal Methods

- (id)initWithDevice:(UIDevice *)device {
  self = [super init];

  if (nil != self) {
    self.device = device;
    NSString *deviceName = self.device.name;

    if ([deviceName hasSuffix:kDeviceNameSuffix]) {
      NSString *name = [deviceName stringByReplacingOccurrencesOfString:kDeviceNameSuffix withString:@""];
      NSArray *nameTokens = [name componentsSeparatedByString:@" "];

      self.firstName = [nameTokens objectAtIndex:0];

      if ([nameTokens count] > 1) {
        self.lastName = [nameTokens lastObject];

        if ([nameTokens count] > 2) {
          self.middleName = [[nameTokens subarrayWithRange:NSMakeRange(1, [nameTokens count] - 2)] componentsJoinedByString:@" "];
        }
      }
    }
  }

  return self;
}

@end
