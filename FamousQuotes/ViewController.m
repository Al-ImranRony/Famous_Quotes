//
//  ViewController.m
//  FamousQuotes
//
//  Created by Bitmorpher 4 on 8/3/21.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "ModelAPIData.h"


#define JSON_FILE_URL @"https://goquotes-api.herokuapp.com/api/v1/random?count=20"

@interface ViewController ()

@property (strong, nonatomic) NSMutableDictionary *quotes;

@property (strong, nonatomic) NSMutableArray *quoteS;
@property (strong, nonatomic) NSMutableArray *authorS;
@property (strong, nonatomic) NSString *qt;
@property (strong, nonatomic) NSString *at;



@end

@implementation ViewController

ModelAPIData *quotesData;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    quotesData = [[ModelAPIData alloc] init];
    quotesData.author = @"";
    quotesData.quote = @"";
    self.quoteS = [[NSMutableArray alloc] init];
    self.authorS = [[NSMutableArray alloc] init];


    
    self.title = @"Famous Quotes";
     
    // Download JSON
    NSData *JSONData = [NSData dataWithContentsOfURL:[NSURL URLWithString:JSON_FILE_URL]];
    
    // Parse JSON
    NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:nil];
    
    self.quotes = [[jsonResult valueForKey:@"quotes"] mutableCopy];
    
    for (id item in self.quotes)
    {
        quotesData.author = [item objectForKey:@"author"];
        [self.authorS addObject:quotesData.author];
        quotesData.quote = [item objectForKey:@"text"];
        [self.quoteS addObject:quotesData.quote];
    }
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.estimatedRowHeight = 120;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    UINib *cellNib = [UINib nibWithNibName:@"CustomTableViewCell" bundle: NSBundle.mainBundle];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"reUseIdentifier"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.quoteS.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reUseIdentifier" forIndexPath:indexPath];

    cell.quotesLabel.text = [self.quoteS objectAtIndex:indexPath.row];
  
    cell.authorLabel.text = [NSString stringWithFormat:@"%@ %@", @"~", [self.authorS objectAtIndex:indexPath.row]];
    
    return cell;
}

@end
