//
//  ANViewController.m
//  SaveAllDemo
//
//  Created by Calvin Yu on 5/23/14.
//  Copyright (c) 2014 Blueboard Media. All rights reserved.
//

#import "ANViewController.h"

@interface ANViewController ()
@property (nonatomic, strong) PFObject *testObject;
@end

@implementation ANViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAllInBackgroundTapped:(id)sender
{
    if (self.testObject == nil) {
        self.testObject = [PFObject objectWithClassName:@"TestObject"];
        [self.testObject setObject:@"John" forKey:@"firstName"];
        [self.testObject setObject:@"Doe" forKey:@"lastName"];
    }

    [PFObject saveAllInBackground:@[self.testObject] block:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"save succeeded");
            
        } else {
            NSLog(@"save failed");
        }
    }];
}

- (IBAction)saveInBackgroundTapped:(id)sender
{
    if (self.testObject == nil) {
        self.testObject = [PFObject objectWithClassName:@"TestObject"];
        [self.testObject setObject:@"John" forKey:@"firstName"];
        [self.testObject setObject:@"Doe" forKey:@"lastName"];
    }
    
    [self.testObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"save succeeded");
            
        } else {
            NSLog(@"save failed");
        }
    }];
}

@end
