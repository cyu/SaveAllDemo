//
//  ANViewController.m
//  SaveAllDemo
//
//  Created by Calvin Yu on 5/23/14.
//  Copyright (c) 2014 Blueboard Media. All rights reserved.
//

#import "ANViewController.h"

static NSString* const kParseClassName = @"TestObject";
static NSString* const kTestObjectFirstName = @"firstName";
static NSString* const ktestObjectLastName = @"lastName";

@interface ANViewController ()
@property (nonatomic, strong) PFObject *saveAllTestObject;
@property (nonatomic, strong) PFObject *saveOneTestObject;
@end

@implementation ANViewController

- (IBAction)saveAllInBackgroundTapped:(id)sender
{
    [PFObject saveAllInBackground:@[self.saveAllTestObject] block:^(BOOL succeeded, NSError *error) {
        if (succeeded)
        {
            // See what was saved to Parse
            [self.saveAllTestObject refreshInBackgroundWithBlock:^(PFObject *object, NSError *error) {
                if (!error)
                {
                    self.saveAllTestObject = object;
                    NSLog(@"\n\n\n"
                          "Save succeeded.\n"
                          "Data: \n"
                          "\t Name: %@ %@ \n"
                          "\n\n\n",
                          [self.saveAllTestObject objectForKey:@"firstName"],
                          [self.saveAllTestObject objectForKey:@"lastName"]);
                }
                else // error refreshing the object
                {
                    NSLog(@"%@", error);
                }
            }];
        }
        else // error saving the object
        {
            NSLog(@"\n\n\n save failed \n\n\n");
        }
    }];
}

- (IBAction)saveInBackgroundTapped:(id)sender
{
    [self.saveOneTestObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded)
        {
            // See what was saved to Parse
            [self.saveOneTestObject refreshInBackgroundWithBlock:^(PFObject *object, NSError *error) {
                if (!error)
                {
                    self.saveOneTestObject = object;
                    NSLog(@"\n\n\n"
                          "Save succeeded.\n"
                          "Data: \n"
                          "\t Name: %@ %@ \n"
                          "\n\n\n",
                          [self.saveOneTestObject objectForKey:@"firstName"],
                          [self.saveOneTestObject objectForKey:@"lastName"]);
                }
                else // error refreshing the object
                {
                    NSLog(@"%@", error);
                }
            }];
        }
        else // error saving the object
        {
            NSLog(@"\n\n\n save failed \n\n\n");
        }
    }];
}

#pragma mark - Accessors -

- (PFObject*)saveAllTestObject
{
    if (!_saveAllTestObject)
    {
        _saveAllTestObject = [PFObject objectWithClassName:kParseClassName];
        [_saveAllTestObject setObject:@"John" forKey:kTestObjectFirstName];
        [_saveAllTestObject setObject:@"SavesAll" forKey:ktestObjectLastName];
    }
    return _saveAllTestObject;
}

- (PFObject*)saveOneTestObject
{
    if (!_saveOneTestObject)
    {
        _saveOneTestObject = [PFObject objectWithClassName:kParseClassName];
        [_saveOneTestObject setObject:@"Robert" forKey:kTestObjectFirstName];
        [_saveOneTestObject setObject:@"SavesOne" forKey:ktestObjectLastName];
    }
    return _saveOneTestObject;
}

@end
