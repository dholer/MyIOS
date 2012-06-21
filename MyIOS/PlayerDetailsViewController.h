//
//  PlayerDetailsViewController.h
//  MyIOS
//
//  Created by Logic Solutions on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PlayerDetailsViewController;

@protocol PlayerDetailsViewControllerDelegate <NSObject>

- (void)playerDetailsViewControllerDidCancel:(PlayerDetailsViewController *) controller;

- (void)playerDetailsViewControllerDidSave:(PlayerDetailsViewController *)controller;

@end

@interface PlayerDetailsViewController : UITableViewController

@property (nonatomic,weak) id<PlayerDetailsViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;


@end
