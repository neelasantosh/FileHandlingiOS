//
//  ViewController.h
//  FileHandling
//
//  Created by Rajesh on 15/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *textTitle;
@property (strong, nonatomic) IBOutlet UITextView *textNotes;
- (IBAction)save:(id)sender;
+(NSString *)pathOfnotesDir;
@end

