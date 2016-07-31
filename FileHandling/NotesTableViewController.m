//
//  NotesTableViewController.m
//  FileHandling
//
//  Created by Rajesh on 15/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "NotesTableViewController.h"
#import "ViewController.h"
@interface NotesTableViewController ()

@end

@implementation NotesTableViewController
@synthesize arrayNotes;
- (void)viewDidLoad {
    [super viewDidLoad];
    //find list od files in note directory
    NSString *notesDirPath=[ViewController pathOfnotesDir];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSArray *arr = [fileManager contentsOfDirectoryAtPath:notesDirPath error:nil];
    arrayNotes=[[NSMutableArray alloc]initWithArray:arr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return arrayNotes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        UITableViewCell *cell=[[UITableViewCell alloc]init];
    cell .textLabel.text=[arrayNotes objectAtIndex:indexPath.row];
    
    return cell;
}
//show file content on file name selection
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *filePath=[NSString stringWithFormat:@"%@/%@",[ViewController pathOfnotesDir],[arrayNotes objectAtIndex:indexPath.row]];
    
    //open file and read data
    NSFileHandle *fileHandle=[NSFileHandle fileHandleForReadingAtPath:filePath];
    NSData *filedata=[fileHandle readDataToEndOfFile];
    //convert fileData in string
    NSString *str=[[NSString alloc]initWithData:filedata encoding:NSStringEncodingConversionAllowLossy];
    
    [fileHandle closeFile];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"file data" message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
