//
//  FMDBViewController.m
//  MyIOS
//
//  Created by Logic Solutions on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FMDBViewController.h"
#import "FMDatabase.h"

#define   PRODUCTIMAGESPATH @"ProductImages"
#define   FILE_PATH @"Files"
#define   DOCUMENT_FOLDER_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define   PRODUCT_IMAGE_SOURCE_PATH  [DOCUMENT_FOLDER_PATH stringByAppendingPathComponent:PRODUCTIMAGESPATH]

#define FILE_SOURCE_PATH [DOCUMENT_FOLDER_PATH stringByAppendingPathComponent:FILE_PATH]

#define kDatabaseName @"fmdb.sqlite"

#define FMDBQuickCheck(SomeBool) { if (!(SomeBool)) { NSLog(@"Failure on line %d", __LINE__); abort(); } }

@interface FMDBViewController ()

@end

@implementation FMDBViewController
@synthesize textView;

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
    NSLog(@"DOCUMENT_FOLDER_PATH : %@",DOCUMENT_FOLDER_PATH);
    NSLog(@"PRODUCT_IMAGE_SOURCE_PATH : %@",PRODUCT_IMAGE_SOURCE_PATH);
    NSLog(@"FILE_SOURCE_PATH : %@",FILE_SOURCE_PATH);
    NSLog(@"kDatabaseName : %@",kDatabaseName);
    
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)execSql:(id)sender {
    NSString *sql = self.textView.text;
    NSLog(@"sql:%@",sql);
    
    NSString *dbPath = [DOCUMENT_FOLDER_PATH stringByAppendingPathComponent:kDatabaseName];
    
    // delete the old db.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:dbPath error:nil];
    
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    
    NSLog(@"Is SQLite compiled with it's thread safe options turned on? %@!", [FMDatabase isSQLiteThreadSafe] ? @"Yes" : @"No");
    
    {
        // -------------------------------------------------------------------------------
        // Un-opened database check.
        FMDBQuickCheck([db executeQuery:@"select * from table"] == nil);
        NSLog(@"%d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    if (![db open]) {
        NSLog(@"Could not open db.");
        
        return;
    }
    
    // kind of experimentalish.
    [db setShouldCacheStatements:YES];
    
    // create a bad statement, just to test the error code.
    [db executeUpdate:@"blah blah blah"];
    
    FMDBQuickCheck([db hadError]);
    
    if ([db hadError]) {
        NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    
    NSError *err = 0x00;
    FMDBQuickCheck(![db update:@"blah blah blah" withErrorAndBindings:&err]);
    FMDBQuickCheck(err != nil);
    FMDBQuickCheck([err code] == SQLITE_ERROR);
    NSLog(@"err: '%@'", err);
    
        
    
    // but of course, I don't bother checking the error codes below.
    // Bad programmer, no cookie.
    
    [db executeUpdate:@"create table test (a text, b text, c integer, d double, e double)"];
    
    
    [db beginTransaction];
    int i = 0;
    while (i++ < 20) {
        [db executeUpdate:@"insert into test (a, b, c, d, e) values (?, ?, ?, ?, ?)" ,
         @"hi'", // look!  I put in a ', and I'm not escaping it!
         [NSString stringWithFormat:@"number %d", i],
         [NSNumber numberWithInt:i],
         [NSDate date],
         [NSNumber numberWithFloat:2.2f]];
    }
    [db commit];
    
    
    
    // do it again, just because
    [db beginTransaction];
    i = 0;
    while (i++ < 20) {
        [db executeUpdate:@"insert into test (a, b, c, d, e) values (?, ?, ?, ?, ?)" ,
         @"hi again'", // look!  I put in a ', and I'm not escaping it!
         [NSString stringWithFormat:@"number %d", i],
         [NSNumber numberWithInt:i],
         [NSDate date],
         [NSNumber numberWithFloat:2.2f]];
    }
    [db commit];
    
    
}
-(void)createDirectoryifNeed:(NSString *)path
{
	BOOL isDir = YES;
	if (![[NSFileManager defaultManager] fileExistsAtPath:[DOCUMENT_FOLDER_PATH stringByAppendingPathComponent:path] isDirectory: &isDir]) {
        if ([[NSFileManager defaultManager] createDirectoryAtPath:[DOCUMENT_FOLDER_PATH stringByAppendingPathComponent:path] withIntermediateDirectories:YES attributes:nil error:nil]==NO) {
        }
	}
    
}


- (void)createEditableDatabaseOfDataCacheStoreIfNeeded:(NSString *)destPath
{
	//
    // First, test for existence.
	//
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL success = [fileManager fileExistsAtPath:destPath];
    if (success)return;
    
	// The writable plist does not exist, so copy the default to the appropriate location.
	NSString *defaultPlistPath = [[NSBundle mainBundle] pathForResource:@"furniture_db" ofType:@"sqlite"];
	
    NSError *error;
    success = [fileManager copyItemAtPath:defaultPlistPath toPath:destPath error:&error];
    if (!success) 
	{
        NSAssert1(0, @"Failed to create writable image cache plist file with message '%@'.", [error localizedDescription]);
    }
}


@end
