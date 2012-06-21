//
//  PlayersViewController.m
//  MyIOS
//
//  Created by Logic Solutions on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlayersViewController.h"
#import "Player.h"
#import "PlayerCell.h"
@interface PlayersViewController ()

@end

@implementation PlayersViewController

@synthesize players = _players;

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
    NSMutableArray *players = [NSMutableArray arrayWithCapacity:20];
    Player *player = [[Player alloc] init];
    player.name = @"joseph";
    player.game = @"basketball";
    player.rating = 2;
    [players addObject:player];
    
    player = [[Player alloc] init];
    player.name = @"joseph";
    player.game = @"football";
    player.rating = 4;
    [players addObject:player];
    self.players = players;
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.players count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"PlayerCell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    // Configure the cell...
    //Player *player = [self.players objectAtIndex:indexPath.row];
    
    
    
    
    
    //UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
    
    //nameLabel.text = player.name;
    
    //UILabel *gameLabel = (UILabel *)[cell viewWithTag:101];
    
    //gameLabel.text = player.game;
    
    //UIImageView *ratingImageView = (UIImageView *)[cell viewWithTag:102];
    //ratingImageView.image = [self imageForRating:player.rating];
    
    /////////playcell
    
    PlayerCell *cell = (PlayerCell *)[tableView 
                                      dequeueReusableCellWithIdentifier:@"PlayerCell"];
    Player *player = [self.players objectAtIndex:indexPath.row];
    cell.nameLabel.text = player.name;
    cell.gameLabel.text = player.game;
    cell.ratingImageView.image = [self imageForRating:player.rating];
    
    
    
    return cell;
}
- (UIImage *)imageForRating:(int)rating
{
    switch (rating)
	{
		case 1: return [UIImage imageNamed:@"1StarSmall.png"];
		case 2: return [UIImage imageNamed:@"2StarsSmall.png"];
		case 3: return [UIImage imageNamed:@"3StarsSmall.png"];
		case 4: return [UIImage imageNamed:@"4StarsSmall.png"];
		case 5: return [UIImage imageNamed:@"5StarsSmall.png"];
	}
	return nil;
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
 */
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [self.players removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }  
}


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
- (void)playerDetailsViewControllerDidSave:(PlayerDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"save");
}
- (void)playerDetailsViewControllerDidCancel:(PlayerDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"cancel");
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"AddPlayer"])
	{
		UINavigationController *navigationController = 
        segue.destinationViewController;
		PlayerDetailsViewController 
        *playerDetailsViewController = 
        [[navigationController viewControllers] 
         objectAtIndex:0];
		playerDetailsViewController.delegate = self;
	}
}

@end
