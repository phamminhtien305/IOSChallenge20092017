//
//  NSString+Validation.h
//  IOSChallenge29092017
//
//  Created by Macbook  on 10/2/17.
//  Copyright © 2017 tuanbinh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)
-(BOOL)isValidEmail;
-(BOOL)isValidNumber;
-(BOOL)isValidPhoneNumber;
-(BOOL)isValidPassword;
-(BOOL)isValidSecuredPassword;
-(BOOL)isValidString;
-(NSString*)trim;
@end
