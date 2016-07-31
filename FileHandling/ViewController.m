//
//  ViewController.m
//  FileHandling
//
//  Created by Rajesh on 15/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textTitle,textNotes;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender
{
    NSString *notesDirPath=[ViewController pathOfnotesDir];
    NSLog(@"notes path %@",notesDirPath);
    
    // save notes in a file with title.txt name
    NSString *fileName=[NSString stringWithFormat:@"%@.txt",textTitle.text];
    
    NSString *filePath=[NSString stringWithFormat:@"%@/%@",notesDirPath,fileName];
    
    // covert notes data in bytes before saving
    const char *notesString=[textNotes.text UTF8String];
    NSData *fileData=[NSData dataWithBytes:notesString length:strlen(notesString)];
    
    // create notes file at filePath
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    BOOL fileSaved=[fileManager createFileAtPath:filePath contents:fileData attributes:nil];
    
    NSLog(@"fileSaved %d",fileSaved);
    
    
}
+(NSString *)pathOfnotesDir
{
    //NSSearchPathForDirectoriesInDomains(<#NSSearchPathDirectory directory#>, <#NSSearchPathDomainMask domainMask#>, <#BOOL expandTilde#>)
    
    NSArray *pathArray= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    NSString *appDocDirPath=[pathArray objectAtIndex:0];
    NSLog(@"doc dir :%@",appDocDirPath);
    NSString *notesDirPath=[NSString stringWithFormat:@"%@/notes",appDocDirPath];
    //check if notes directory exists,if not create it
    NSFileManager *filemanager=[NSFileManager defaultManager];
    BOOL isDir=true;
    
   BOOL exists = [filemanager fileExistsAtPath:notesDirPath isDirectory:&isDir];
    if (!exists) {
        NSError *err;
        [filemanager createDirectoryAtPath:notesDirPath withIntermediateDirectories:false attributes:nil error:&err];
        NSLog(@"directory created ---:%@",err);
    }
    
    return notesDirPath;

}
@end
