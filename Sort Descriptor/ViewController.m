//
//  ViewController.m
//  Sort Descriptor
//
//  Created by Student-002 on 18/10/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _array=[[NSMutableArray alloc]init];
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    
    //Pull to Refresh
//    self.refreshControl = [[UIRefreshControl alloc] init];
//    self.refreshControl.backgroundColor = [UIColor purpleColor];
//    self.refreshControl.tintColor = [UIColor whiteColor];
//    [self.refreshControl addTarget:self.table
//                            action:@selector(refresh)
//                  forControlEvents:UIControlEventValueChanged];


    _refreshView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.table insertSubview:_refreshView atIndex:0];//the tableView is a IBOutlet
    
    _refreshControl = [[UIRefreshControl alloc] init];
    _refreshControl.tintColor = [UIColor redColor];
    [_refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
     NSMutableAttributedString *refreshString = [[NSMutableAttributedString alloc] initWithString:@"Pull To Refresh"];
     [refreshString addAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor]} range:NSMakeRange(0, refreshString.length)];
     _refreshControl.attributedTitle = refreshString;
    _refreshControl.backgroundColor=[UIColor lightGrayColor];
    [_refreshView addSubview:_refreshControl];
}
-(void)refresh
{
    [self.table reloadData];
    [self.refreshControl endRefreshing];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{return 1;}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{return _array.count;}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[_array objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sortbtnclick:(id)sender
{
    if(sender==_addbtn)
{
    
     NSString *temp=_tf.text;
    [_array addObject:temp];
//    [self.table reloadData];
}
else
    {
        NSSortDescriptor *sort=[[NSSortDescriptor alloc]initWithKey:nil ascending:YES];
//        NSSortDescriptor *sort=[NSSortDescriptor sortDescriptorWithKey:@"studadd" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
         _array1=[self.array sortedArrayUsingDescriptors:@[sort]];
        [_array removeAllObjects];
        self.array=[[NSMutableArray alloc]initWithArray:_array1];
        [self.table reloadData];
}
}


@end
