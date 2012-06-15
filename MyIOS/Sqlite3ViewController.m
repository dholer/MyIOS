//
//  Sqlite3ViewController.m
//  MyIOS
//
//  Created by Logic Solutions on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Sqlite3ViewController.h"
#import "sqlite3.h"
#define kDatabaseName @"test.sqlite3"

@interface Sqlite3ViewController ()

@end

@implementation Sqlite3ViewController
@synthesize databaseFilePath = _databaseFilePath;

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)goHoume:(id)sender {
    [self performSegueWithIdentifier:@"sqlite3ToHome" sender:self];
}

- (IBAction)btnPressed:(id)sender {
    
    //获取数据库文件路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    self.databaseFilePath = [documentsDirectory stringByAppendingPathComponent:kDatabaseName];
    NSLog(@"db path: %@",self.databaseFilePath);
        
    const char *sqlitePath = [self.databaseFilePath UTF8String];
    
    sqlite3 *database;
    //open or create db
    int result = sqlite3_open(sqlitePath, &database);
    
    NSLog(@"sqlite_ok value :%d",result);
    if (result != SQLITE_OK) {
        //close db
        sqlite3_close(database);
        NSLog(@"failed open db");
        return;
    }else{
        NSLog(@"open database success!!");
    }
    
    //create table
    char *errMsg;
    const char *createSql = "CREATE TABLE IF NOT EXISTS person(id INTEGER PRIMARY KEY AUTOINCREMENT,field_data TEXT)";
    
    if (sqlite3_exec(database, createSql, NULL, NULL, &errMsg) != SQLITE_OK) {        
        NSString *errMessage = [NSString stringWithUTF8String:errMsg];
        NSLog(@"create table failed!\nerrMsg:%@",errMessage);
        return;
    }else {
        NSLog(@"create table person success!");
    }
    //insert table
    //[self insertData:database];
    
    //retrieve a data
    NSString *query = @"SELECT * FROM person limit 20";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil) != SQLITE_OK) {
        NSLog(@"failed retrieve dataq");
        return;
    }else{
        NSLog(@"success retrieve data"); 
        while (sqlite3_step(statement) ==SQLITE_ROW) {
            int rowId = sqlite3_column_int(statement, 0);
            char *rowFieldData = sqlite3_column_text(statement, 1);
            NSString *fieldData = [[NSString alloc] initWithUTF8String:rowFieldData];
            NSLog(@"%@",fieldData);
        }
    
    }
    sqlite3_finalize(statement);
    
    
    
    
    
    
    
    //使用约束变量
    char *sql = "insert into person(field_data) values(?);";
    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2(database, sql, -1, &stmt, nil) == SQLITE_OK) {
        sqlite3_bind_text(stmt, 1, "valueString", -1, NULL);
    }
    if (sqlite3_step(stmt) != SQLITE_DONE)
        NSLog(@"Something is Wrong!");
    sqlite3_finalize(stmt);
    
    
    sqlite3_close(database);
    
    
}
- (void)insertData:(sqlite3 *)database
{
    char * errMsg;
    NSString *insertSql = @"INSERT INTO person(field_data) VALUES('test')";
    if (sqlite3_exec(database, [insertSql UTF8String], NULL, NULL, &errMsg) != SQLITE_OK) {
        NSLog(@"insert data failed! msg:%@",[NSString stringWithUTF8String:errMsg]);
        return;
    }else {
        NSLog(@"insert data success");
    }
}
@end
