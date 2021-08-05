//
//  ViewController.h
//  FamousQuotes
//
//  Created by Bitmorpher 4 on 8/3/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

