//
//  JBDeviceOwner.m
//  JBDeviceOwner
//
//  Created by Jake Boxer on 4/3/12.
//  Copyright (c) 2012 Jake Boxer. All rights reserved.
//

#import "JBDeviceOwner.h"
#import <AddressBook/AddressBook.h>

@interface JBDeviceOwner ()

@property (weak, nonatomic) UIDevice *device;
@property (strong, nonatomic, readwrite) NSString *email;
@property (strong, nonatomic, readwrite) NSString *firstName;
@property (strong, nonatomic, readwrite) NSString *fullName;
@property (weak, nonatomic, readwrite) BOOL hasAddressBookMatch;
@property (strong, nonatomic, readwrite) NSString *lastName;
@property (strong, nonatomic, readwrite) NSString *middleName;
@property (strong, nonatomic, readwrite) NSString *phone;

- (void)populateFromAddressBook;

@end

@implementation JBDeviceOwner

static NSString * const kDeviceNameSuffix = @"'s iPhone";

@synthesize device;
@synthesize email;
@synthesize firstName;
@synthesize fullName;
@synthesize hasAddressBookMatch;
@synthesize lastName;
@synthesize middleName;
@synthesize phone;

#pragma mark - Creation/Removal Methods

- (id)initWithDevice:(UIDevice *)aDevice {
  self = [super init];

  if (nil != self) {
    self.device = aDevice;
    NSString *deviceName = self.device.name;

    self.fullName = [deviceName stringByReplacingOccurrencesOfString:kDeviceNameSuffix withString:@""];
    NSArray *nameTokens = [self.fullName componentsSeparatedByString:@" "];

    self.firstName = [nameTokens objectAtIndex:0];

    if ([nameTokens count] > 1) {
      self.lastName = [nameTokens lastObject];

      if ([nameTokens count] > 2) {
        self.middleName = [[nameTokens subarrayWithRange:NSMakeRange(1, [nameTokens count] - 2)] componentsJoinedByString:@" "];
      }
    }

    [self populateFromAddressBook];
  }

  return self;
}

#pragma mark - Private methods

- (void)populateFromAddressBook {
  ABAddressBookRef addressBook = ABAddressBookCreate();
  NSArray *people = (__bridge NSArray *)ABAddressBookCopyPeopleWithName(addressBook, (__bridge CFStringRef)self.fullName);
  self.hasAddressBookMatch = ([people count] > 0);

  if (self.hasAddressBookMatch) {
    ABRecordRef owner = (__bridge ABRecordRef)[people objectAtIndex:0];

    // Email
    ABMultiValueRef emailMultiValue = ABRecordCopyValue(owner, kABPersonEmailProperty);
    NSArray *emails = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(emailMultiValue);

    if ([emails count] > 0) {
      self.email = (NSString *)[emails objectAtIndex:0];
    }

    CFRelease(emailMultiValue);

    // Phone
    ABMultiValueRef phoneMultiValue = ABRecordCopyValue(owner, kABPersonPhoneProperty);
    NSArray *phones = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(phoneMultiValue);

    if ([phones count] > 0) {
      self.phone = (NSString *)[phones objectAtIndex:0];
    }

    CFRelease(phoneMultiValue);
  }

  CFRelease(addressBook);
}

@end
