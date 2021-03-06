//
//  RoomListViewController.m
//  GrandHotel
//
//  Created by Matthew McClure on 9/11/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

#import "RoomListViewController.h"
#import "HotelListViewController.h"
#import "AppDelegate.h"
#import "Hotel.h"
#import "Room.h"


@interface RoomListViewController ()

@property (strong, nonatomic) NSArray *rooms;
@property (strong, nonatomic) NSMutableArray *roomNumbers;

@end

@implementation RoomListViewController

-(void)loadView {
  UIView *rootView = [[UIView alloc] init];
  
  _rooms = self.passedHotel.rooms.allObjects;
  
  UITableView *tableView = [[UITableView alloc] initWithFrame:rootView.frame style:UITableViewStylePlain];
  self.tableView = tableView;
  [tableView setTranslatesAutoresizingMaskIntoConstraints:false];
  [rootView addSubview:tableView];
  
  NSDictionary *views = @{@"tableView" : tableView};
  
  NSArray *tableViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:views];
  [rootView addConstraints:tableViewVerticalConstraints];
  NSArray *tableViewHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views];
  [rootView addConstraints:tableViewHorizontalConstraints];
  
  self.view = rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  
//  
//  for (Room *room in self.rooms) {
//    NSLog(@"#####%@", room.number);
//    [self.roomNumbers addObject:room.number.description];
//  }
  
  NSLog(@"here here: %lu", (unsigned long)self.rooms.count);
  NSLog(@"%@", self.passedHotel.name);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.rooms.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *cellIdentifier = @"roomCell";
  UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
  if (cell == nil)
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }
  
  cell.backgroundColor = [UIColor colorWithRed:249.0/255 green:237.0/255 blue:224.0/255 alpha:1.0];
  
  int dataIndex = (int) indexPath.row % [self.rooms count];
  
//  for (Room *room in self.rooms){
//
//  }
  
  Room *thisRoom = self.rooms[dataIndex];
  cell.textLabel.text = [NSString stringWithFormat:@"Room #%@", [thisRoom number]];
  cell.textLabel.numberOfLines = 0;
  cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
  
  NSDictionary *views = @{@"label":cell.textLabel};
  NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[label]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views];
  [cell.contentView addConstraints:constraints];
  
  constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[label]|"
                                                        options: 0
                                                        metrics:nil
                                                          views:views];
  [cell.contentView addConstraints:constraints];
  
  return cell;
  
}




@end
