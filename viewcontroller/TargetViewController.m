//
//  TargetViewController.m
//  viewcontroller
//
//  Created by Ishani Perera on 4/13/20.
//  Copyright © 2020 Ishani Perera. All rights reserved.
//
#import <WatchConnectivity/WatchConnectivity.h>
#import <JavaScriptCore/JavaScriptCore.h>
#include <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

#import "TargetViewController.h"
#import "SSKeychain.h"
#import "AppDelegate.h"
#import "ThirdViewController.h"
//#import "HOTPGenerator.h"
//#import "MF_Base32Additions.h"


@interface TargetViewController ()

@end

@implementation TargetViewController

@synthesize labelName,labelAge,strlabelName,strlabelAge;

@synthesize textBoxUsername;

@synthesize testLabel,strtest;

@synthesize keychainAccesssibilityMapping,messageTypeAccesscodeKey;

NSString *serviceName = @"abc";
NSString *user;

//NSString *lastLoggedUserKey = @"user";
/*NSString *messageTypeLastLoggedUserKey = @"lastLoggedUser";
NSString *messageTypeAccesscodeKey = @"accessCode";
NSString *messageTypeErrorKey = @"error";
NSString *messageTypeKey = @"messageType";
NSString *messageKey = @"message";*/




/*- (void)session:(nonnull WCSession *)session didReceiveMessage:(nonnull NSDictionary *)message replyHandler:(nonnull void (^)(NSDictionary * __nonnull))replyHandler {
    dispatch_async(dispatch_get_main_queue(), ^{
        //printing the recieved message from iWatch
        NSLog(message);
        //Service name should be the same name given in the cordova keychain plugin.
        NSString *requestFromWatch =message;
        NSDictionary *response;
        if([requestFromWatch isEqualToString:messageTypeAccesscodeKey]){
            
            
            
            //getting value from Keychain
            
            @try {
                //Retriving Last logged user
                NSString *account = [self getLastLoggedUser];
                NSMutableDictionary *keychainValue = [[NSMutableDictionary alloc] init];
                keychainValue = [self getFromKeychain:serviceName account:account];
                
                NSString *secretKey = [keychainValue objectForKey:@"secret"];
                NSString *counterString = [keychainValue objectForKey:@"counter"];
                NSInteger counter = [counterString integerValue];
                
                
                //NSString *pin = [self generateAccessCode: secretKey:secretKey counter:counter];
                //counter++;
                
                NSMutableDictionary *newDict = [[NSMutableDictionary alloc] init];
                [newDict addEntriesFromDictionary:keychainValue];
                NSString *counterStringVal= [NSString stringWithFormat: @"%d", counter];
                [newDict setObject:counterStringVal forKey:@"counter"];
                NSError* error;
                NSData* jsonData = [NSJSONSerialization dataWithJSONObject:newDict options:NSJSONReadingMutableContainers error:&error];
                NSString* nsJson=  [[NSString alloc] initWithData:jsonData
                                                         encoding:NSUTF8StringEncoding];
                
                
                [self saveInKeychain:serviceName account:account keychainValue:nsJson];
                
                //sending back the accesscode to the iWatch
                //NSString *applicationData = pin;
                /*response = @{
                             messageTypeKey : messageTypeAccesscodeKey,
                             messageKey : pin
                             };*/
                
           // }
            //@catch (NSException *exception) {
                /*response = @{
                             messageTypeKey : messageTypeErrorKey,
                             messageKey : @"Access code not activated on mobile device"
                             };*/
           /* }
            [[WCSession defaultSession] sendMessage:response
                                       replyHandler:^(NSDictionary *reply) {
                                           //handle reply from iPhone app here
                                       }
                                       errorHandler:^(NSError *error) {
                                           //catch any errors here
                                       }
             ];
            
        } /*else if ([requestFromWatch isEqualToString: messageTypeLastLoggedUserKey]) {
            
            @try {
                NSString *lastLoggedUser = [self getLastLoggedUser];
                //sending back the accesscode to the iWatch
                //NSString *applicationData = lastLoggedUser;
                response = @{
                             messageTypeKey : messageTypeLastLoggedUserKey,
                             messageKey : lastLoggedUser
                             };
                
            }
            @catch (NSException *exception) {
                response = @{
                             messageTypeKey : messageTypeErrorKey,
                             messageKey : @"Access code not activated on mobile device."
                             };
            }
            [[WCSession defaultSession] sendMessage:response
                                       replyHandler:^(NSDictionary *reply) {
                                           //handle reply from iPhone app here
                                       }
                                       errorHandler:^(NSError *error) {
                                           //catch any errors here
                                       }
             ];
            
            
        }*/
        
        
    //});
    
    
//}*/

/*- (NSString *)getLastLoggedUser{
    //Using NSUSerdefauls
    //NSUserDefaults *mySharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.gtn.watchdemo"];
    //[mySharedDefaults synchronize];
    //NSString *lastLoggedUser = [mySharedDefaults stringForKey:@"gtn_mobile_last_logged_user"];
    
    //Using Keychain
    NSString *lastLoggedUser =[self getLastLoginFromKeychain:serviceName account:lastLoggedUserKey];
    return lastLoggedUser;
    
}*/

/*- (NSString *)generateAccessCode:secretKey:(NSString *)secretKey counter: (NSInteger *) counter{
    
    NSData *secretBase32 = [self dataFromHexString:secretKey];
    //NSString *secretData = [secretData2 base32String];
    //NSData *secretBase32 = [NSData dataWithBase32String:secretData];
    HOTPGenerator *generator
    = [[HOTPGenerator alloc] initWithSecret:secretBase32
                                  algorithm:kOTPGeneratorSHA1Algorithm
                                     digits:6
                                    counter:counter];
    
    
    return [generator generateOTP];
    
}
- (NSData *)dataFromHexString:secretKey {
    const char *chars = [secretKey UTF8String];
    int i = 0, len = [secretKey length];
    
    NSMutableData *data = [NSMutableData dataWithCapacity:len / 2];
    char byteChars[3] = {'\0','\0','\0'};
    unsigned long wholeByte;
    
    while (i < len) {
        byteChars[0] = chars[i++];
        byteChars[1] = chars[i++];
        wholeByte = strtoul(byteChars, NULL, 16);
        [data appendBytes:&wholeByte length:1];
    }
    
    return data;
}*/


/*- (NSDictionary *)getLastLoginFromKeychain:(NSString *)serviceName account:(NSString *)account {
    NSError *error = nil;
    SSKeychainQuery *query = [[SSKeychainQuery alloc] init];
    query.service = serviceName;
    query.account = account;
    [query fetch:&error];
    
    if ([error code] == errSecItemNotFound) {
        NSLog(@"Password not found#");
    } else if (error != nil) {
        NSLog(@"Some other error occurred: %@", [error localizedDescription]);
    }
    
    NSString *lastLoginUser =  query.password;
  
    return lastLoginUser;
    
}*/
/*- (NSDictionary *)getFromKeychain:(NSString *)serviceName account:(NSString *)account {
    NSError *error = nil;
    SSKeychainQuery *query = [[SSKeychainQuery alloc] init];
    query.service = serviceName;
    query.account = account;
    [query fetch:&error];
    
    if ([error code] == errSecItemNotFound) {
        NSLog(@"Password not found");
    } else if (error != nil) {
        NSLog(@"Some other error occurred: %@", [error localizedDescription]);
    }
    
    NSString *keychainString =  query.password;
    
    NSDictionary *keychainValue = [NSJSONSerialization JSONObjectWithData:[keychainString dataUsingEncoding:NSUTF8StringEncoding]
                                                                  options:NSJSONReadingAllowFragments error:&error];
    
    return keychainValue;
    
}*/

- (void)saveInKeychain:(NSString *)serviceName account:(NSString *)account keychainValue: (NSString *)keychainValue {
    NSError *error;
    NSLog(strlabelName);
    if (self.keychainAccesssibilityMapping == nil) {
        if( [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ){
            self.keychainAccesssibilityMapping = [NSDictionary dictionaryWithObjectsAndKeys:
                                                  (__bridge id)(kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly), @"afterfirstunlockthisdeviceonly",
                                                  (__bridge id)(kSecAttrAccessibleAfterFirstUnlock), @"afterfirstunlock",
                                                  (__bridge id)(kSecAttrAccessibleWhenUnlocked), @"whenunlocked",
                                                  (__bridge id)(kSecAttrAccessibleWhenUnlockedThisDeviceOnly), @"whenunlockedthisdeviceonly",
                                                  (__bridge id)(kSecAttrAccessibleAlways), @"always",
                                                  (__bridge id)(kSecAttrAccessibleAlwaysThisDeviceOnly), @"alwaysthisdeviceonly",
                                                  (__bridge id)(kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly), @"whenpasscodesetthisdeviceonly",
                                                  nil];
             NSLog(strlabelName);
        }
        else{
            self.keychainAccesssibilityMapping = [NSDictionary dictionaryWithObjectsAndKeys:
                                                  (__bridge id)(kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly), @"afterfirstunlockthisdeviceonly",
                                                  (__bridge id)(kSecAttrAccessibleAfterFirstUnlock), @"afterfirstunlock",
                                                  (__bridge id)(kSecAttrAccessibleWhenUnlocked), @"whenunlocked",
                                                  (__bridge id)(kSecAttrAccessibleWhenUnlockedThisDeviceOnly), @"whenunlockedthisdeviceonly",
                                                  (__bridge id)(kSecAttrAccessibleAlways), @"always",
                                                  (__bridge id)(kSecAttrAccessibleAlwaysThisDeviceOnly), @"alwaysthisdeviceonly",
                                                  nil];
        }
    }
    /*NSString* keychainAccessibility = [[self.keychainAccesssibilityMapping objectForKey:[@"always" lowercaseString]] lowercaseString];
    if ([self.keychainAccesssibilityMapping objectForKey:(keychainAccessibility)] != nil) {
        CFTypeRef accessibility = (__bridge CFTypeRef)([self.keychainAccesssibilityMapping objectForKey:(keychainAccessibility)]);
        [SSKeychain setAccessibilityType:accessibility];
    }
    CFTypeRef accessibility = (__bridge CFTypeRef)([self.keychainAccesssibilityMapping objectForKey:(@"afterfirstunlockthisdeviceonly")]);
    [SSKeychain setAccessibilityType:accessibility];*/
    SSKeychainQuery *query = [[SSKeychainQuery alloc] init];
    query.service = serviceName;
    query.account = account;
    query.password = keychainValue;
    NSLog(keychainValue);
    [query save:&error];
    if ([error code] == errSecItemNotFound) {
        NSLog(@"Password not found");
    } else if (error != nil) {
        NSLog(@"Some other error occurred: %@", [error localizedDescription]);
    }
}

- (NSString *)getFromKeychain:(NSString *)serviceName account:(NSString *)account {
    NSError *error = nil;
    SSKeychainQuery *query = [[SSKeychainQuery alloc] init];
    query.service = serviceName;
    query.account = account;
    [query fetch:&error];
    if ([error code] == errSecItemNotFound) {
        NSLog(@"Password not found * *");
    } else if (error != nil) {
        NSLog(@"Some other error occurred: %@", [error localizedDescription]);
    }
    NSString *keychainString =  query.password;
    NSLog(keychainString);
    
   /* NSDictionary *keychainValue = [NSJSONSerialization JSONObjectWithData:[keychainString dataUsingEncoding:NSUTF8StringEncoding]
                                                                  options:NSJSONReadingAllowFragments error:&error];
    
    NSError * err;
    NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:keychainValue options:0 error:&err];
    NSString * myString = [[NSString alloc] initWithData:jsonData   encoding:NSUTF8StringEncoding];
    NSLog(@"%@",myString);*/
    
    return keychainString;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //NSString *lastLoggedUser =[self getLastLoginFromKeychain:serviceName account:lastLoggedUserKey];
    [self saveInKeychain:serviceName account:strlabelName keychainValue:strlabelName];
    labelName.text= strlabelName;
    labelAge.text=strlabelAge;
    
    user =[self getFromKeychain:serviceName account:strlabelName];
    
    //NSError * err;
    //NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:user options:0 error:&err];
    //NSString * myString = [[NSString alloc] initWithData:jsonData   encoding:NSUTF8StringEncoding];
    //NSLog(@"%@",user);
    
    
    //NSLog(@"%@",user);
    
   //testLabel.text=user;
    
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ThirdViewController *tc;
    tc = [segue destinationViewController];
    tc.strlabelUsername=user;
    
    
}
@end
