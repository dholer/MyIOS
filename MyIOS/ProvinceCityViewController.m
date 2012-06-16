//
//  ProvinceCityViewController.m
//  MyIOS
//
//  Created by Logic Solutions on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProvinceCityViewController.h"

@interface ProvinceCityViewController ()

@end

@implementation ProvinceCityViewController

@synthesize picker;
@synthesize provinceCities;
@synthesize provinces;
@synthesize cities;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"provinceCities" withExtension:@"plist"];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    self.provinceCities = dictionary;
    NSArray *components = [self.provinceCities allKeys];
    NSArray *sorted = [components sortedArrayUsingSelector:@selector(compare:)];
    self.provinces = sorted;
    
    NSString *selectedState = [self.provinces objectAtIndex:0];
    NSArray *array = [provinceCities objectForKey:selectedState];
    self.cities = array;
}

- (void)viewDidUnload
{
    [self setPicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.picker = nil;
    self.provinceCities = nil;
    self.provinces = nil;
    self.cities = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonPressed:(id)sender {
    NSInteger provinceRow = [picker selectedRowInComponent:kProvinceComponent];
    NSInteger cityRow = [picker selectedRowInComponent:kCityComponent];
    
    NSString *province = [self.provinces objectAtIndex:provinceRow];
    NSString *city = [self.cities objectAtIndex:cityRow];
    
    NSString *title = [[NSString alloc] initWithFormat:@"你选择了%@.", city];
    NSString *message = [[NSString alloc] initWithFormat:@"%@属于%@", city, province];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
    [alert show];
}


#pragma mark -
#pragma mark Picker Date Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == kProvinceComponent) {
        return [self.provinces count];
    }
    return [self.cities count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == kProvinceComponent) {
        return [self.provinces objectAtIndex:row];
    }
    return [self.cities objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == kProvinceComponent) {
        NSString *selectedState = [self.provinces objectAtIndex:row];
        NSArray *array = [provinceCities objectForKey:selectedState];
        self.cities = array;
        [picker selectRow:0 inComponent:kCityComponent animated:YES];
        [picker reloadComponent:kCityComponent];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == kCityComponent) {
        return 150;
    }
    return 140;
}


@end
