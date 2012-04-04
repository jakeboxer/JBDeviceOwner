//
//  JBDeviceOwner.h
//  JBDeviceOwner
//
//  Created by Jake Boxer on 4/3/12.
//  Copyright (c) 2012 Jake Boxer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JBDeviceOwner/UIDevice+JBDeviceOwner.h>

@interface JBDeviceOwner : NSObject

- (id)initWithDevice:(UIDevice *)aDevice;

@property (strong, nonatomic, readonly) NSString *firstName;
@property (strong, nonatomic, readonly) NSString *fullName;
@property (strong, nonatomic, readonly) NSString *lastName;
@property (strong, nonatomic, readonly) NSString *middleName;

@end
