//
//  ViewController.m
//  FamousQuotes
//
//  Created by Bitmorpher 4 on 8/3/21.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "ModelAPIData.h"
#import "ModelAPIQuotesRoot.h"


#define JSON_FILE_URL @"https://goquotes-api.herokuapp.com/api/v1/random?count=20"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray<ModelAPIData *> *quotes;

@property (strong, nonatomic) NSMutableArray *quoteData;

@property (strong, nonatomic) NSString *title;



@end

@implementation ViewController

int n = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.quotes = [[NSMutableArray alloc] init];


    // Download JSON
    NSData *JSONData = [NSData dataWithContentsOfURL:[NSURL URLWithString:JSON_FILE_URL]];
    
    
    // Parse JSON into dictionary
    NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:nil];
    
    //convert JSON to our Model
    NSError *error = nil;
    ModelAPIQuotesRoot *quotesList = [MTLJSONAdapter modelOfClass:[ModelAPIQuotesRoot class] fromJSONDictionary:jsonResult error:&error];
    
    self.quotes = quotesList.quotes;

    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.estimatedRowHeight = 120;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    UINib *cellNib = [UINib nibWithNibName:@"CustomTableViewCell" bundle: NSBundle.mainBundle];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"reUseIdentifier"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.quotes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reUseIdentifier" forIndexPath:indexPath];

//    ModelAPIData *quote = [[ModelAPIData alloc] init];
    cell.quotesLabel.text = self.quotes[n].quote;
    cell.authorLabel.text = [NSString stringWithFormat:@"%@ %@", @"~", self.quotes[n].author];
    
    n = n+1;
    
    return cell;
}

@end
