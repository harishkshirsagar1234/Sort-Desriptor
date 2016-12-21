//
//  ViewController.h
//  Sort Descriptor
//
//  Created by Student-002 on 18/10/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate>
@property (weak, nonatomic) IBOutlet UIButton *sortbtn;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic, retain) NSMutableArray *array;
@property (weak, nonatomic) IBOutlet UITextField *tf;
@property (weak, nonatomic) IBOutlet UIButton *addbtn;
@property (nonatomic, retain)NSArray *array1;
@property UIRefreshControl *refreshControl;
@property UIView *refreshView;
@end

