//
//  ViewController.h
//  viewcontroller
//
//  Created by Ishani Perera on 4/13/20.
//  Copyright © 2020 Ishani Perera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textBoxName;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAge;
- (IBAction)next:(id)sender;

@end

