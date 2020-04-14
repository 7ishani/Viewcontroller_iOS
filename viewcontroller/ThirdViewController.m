//
//  ThirdViewController.m
//  viewcontroller
//
//  Created by Ishani Perera on 4/14/20.
//  Copyright © 2020 Ishani Perera. All rights reserved.
//

#import "ThirdViewController.h"
#import "TargetViewController.h"
#import "SSKeychain.h"

@interface ThirdViewController ()


@end

@implementation ThirdViewController

@synthesize labelUsername,strlabelUsername;

NSString *serviceName2 = @"abc";

NSString *lastLoggedUserKey2 = @"user";

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
    //NSString *lastLoggedUser =[self getLastLoginFromKeychain:serviceName2 account:lastLoggedUserKey2];
 // labelUsername.text= lastLoggedUser;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //NSString *User =[self getFromKeychain:serviceName2 account:lastLoggedUserKey2];
    
    labelUsername.text=strlabelUsername;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
