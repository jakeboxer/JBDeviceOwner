//
//  ViewController.m
//  JBDeviceOwnerExample
//
//  Created by Jake Boxer on 4/3/12.
//  Copyright (c) 2012 Jake Boxer. All rights reserved.
//

#import "ViewController.h"
#import <JBDeviceOwner/JBDeviceOwner.h>

@implementation ViewController

@synthesize firstNameTextField;
@synthesize lastNameTextField;
@synthesize emailTextField;
@synthesize phoneTextField;

- (void)viewDidLoad {
  [super viewDidLoad];

  JBDeviceOwner *owner = [UIDevice currentDevice].owner;

  if (nil != owner) {
    self.firstNameTextField.text = owner.firstName;
    self.lastNameTextField.text = owner.lastName;
    self.emailTextField.text = owner.email;
    self.phoneTextField.text = owner.phone;
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
