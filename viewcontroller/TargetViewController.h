//
//  TargetViewController.h
//  viewcontroller
//
//  Created by Ishani Perera on 4/13/20.
//  Copyright © 2020 Ishani Perera. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TargetViewController : UIViewController

@property (weak, nonatomic) NSString *strlabelName;
@property (weak, nonatomic) NSString *strlabelAge;

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelAge;

@end

NS_ASSUME_NONNULL_END
