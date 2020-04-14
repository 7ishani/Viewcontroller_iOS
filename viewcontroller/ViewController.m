//
//  ViewController.m
//  viewcontroller
//
//  Created by Ishani Perera on 4/13/20.
//  Copyright © 2020 Ishani Perera. All rights reserved.
//

#import "ViewController.h"
#import "TargetViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textBoxName,textBoxAge;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)next:(id)sender {
}

- (IBAction)textBoxUsername:(id)sender {
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    TargetViewController *tvc;
    tvc = [segue destinationViewController];
    tvc.strlabelName=textBoxName.text;
    tvc.strlabelAge=textBoxAge.text;
    
}
@end
