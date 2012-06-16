//
//  ViewControllersViewController.m
//  MyIOS
//
//  Created by Logic Solutions on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewControllersViewController.h"

@interface ViewControllersViewController ()

@end

@implementation ViewControllersViewController

@synthesize listData;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"Tree", @"Flower",
                      @"Grass", @"Fence", @"House", @"Table", @"Chair",
                      @"Book", @"Swing" , nil]; 
    self.listData = array; 
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.listData = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

//返回行数
#pragma mark - 
#pragma mark Table View Data Source Methods 
//返回行数
- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section { 
    return [self.listData count]; 
}

//新建某一行并返回


//新建某一行并返回


/*
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
 这个语句根据标识符TableSampleIdentifier寻找当前可以重用的UITableViewCell。当某行滑出当前可见区域后，我们重用它所对应的UITableViewCell对象，那么就可以节省内存和时间。
 
 如果执行词语后，cell为nil，那我们再创建一个，并设置去标识符为TableSampleIdentifier：
 
 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
 这里UITableViewCellStyleDefault是表示UITableViewCell风格的常数，除此之外，还有其他风格，后面将会用到。
 
 注意参数(NSIndexPath *)indexPath，它将行号row和部分号section合并了，通过[indexPath row];获取行号。之后给cell设置其文本：
 
 cell.textLabel.text = [listData objectAtIndex: row];
 
 
 */

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath { 
    
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier"; 
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: 
                             TableSampleIdentifier]; 
    if (cell == nil) { 
        
        /*
         表示UITableViewCell风格的常量有：
         
         UITableViewCellStyleDefault
         UITableViewCellStyleSubtile
         UITableViewCellStyleValue1
         UITableViewCellStyleValue2
         这几种风格的区别主要体现在Image、Text Label以及Detail Text Label。
         */
        
        cell = [[UITableViewCell alloc] 
                initWithStyle:UITableViewCellStyleValue2 
                reuseIdentifier:TableSampleIdentifier]; 
    } 
    
    NSUInteger row = [indexPath row]; 
    cell.textLabel.text = [listData objectAtIndex:row]; 
    
    cell.detailTextLabel.text = @"Detail Text";
    
    UIImage *image = [UIImage imageNamed:@"blue.png"]; 
    cell.imageView.image = image; 
    UIImage *highLighedImage = [UIImage imageNamed:@"yellow.png"]; 
    cell.imageView.highlightedImage = highLighedImage;
    
   
    
    
	return cell; 
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

//设置缩进：
#pragma mark Table Delegate Methods 
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath { 
    NSUInteger row = [indexPath row]; 
    return row; 
}

- (IBAction)goHome:(id)sender {
    [self performSegueWithIdentifier:@"ViewControllerToHome" sender:self];
}


@end
