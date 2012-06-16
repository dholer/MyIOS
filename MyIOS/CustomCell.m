//
//  CustomCell.m
//  MyIOS
//
//  Created by Logic Solutions on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize imageView;
@synthesize nameLabel;
@synthesize descLabel;
@synthesize locLable;

@synthesize image;
@synthesize name;
@synthesize dec;
@synthesize loc;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setImage:(UIImage *)img {
    if (![img isEqual:image]) {
        image = [img copy];
        self.imageView.image = image;
    }
}

-(void)setName:(NSString *)n {
    if (![n isEqualToString:name]) {
        name = [n copy];
        self.nameLabel.text = name;
    }
}

-(void)setDec:(NSString *)d {
    if (![d isEqualToString:dec]) {
        dec = [d copy];
        self.descLabel.text = dec;
    }
}

-(void)setLoc:(NSString *)l {
    if (![l isEqualToString:loc]) {
        loc = [l copy];
        self.locLable.text = loc;
    }
}

@end
