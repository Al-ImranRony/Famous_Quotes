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

@property (strong, nonatomic) NSMutableArray<ModelAPIData *> *quotes;

@property (strong, nonatomic) NSMutableArray *quoteData;
//@property (strong, nonatomic) NSMutableArray *authorS;
//@property (strong, nonatomic) NSString *qt;
//@property (strong, nonatomic) NSString *at;



@end

@implementation ViewController

int n = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
     
//    quotes.author = @"";
//    quotes.quote = @"";
    self.quotes = [[NSMutableArray alloc] init];


    
    self.title = @"Famous Quotes";
     
    // Download JSON
    NSData *JSONData = [NSData dataWithContentsOfURL:[NSURL URLWithString:JSON_FILE_URL]];
    
    // Parse JSON
    NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:nil];
    
    self.quoteData = [[jsonResult valueForKey:@"quotes"] mutableCopy];
    
    for (id item in self.quoteData)
    {
        ModelAPIData *quote = [[ModelAPIData alloc] init];
        quote.quote = [item objectForKey:@"text"];
        quote.author = [item objectForKey:@"author"];
        [self.quotes addObject:quote];
    }
     
//    NSLog(@"%@", [_quotes]);
    
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

    cell.quotesLabel.text = self.quotes[n].quote;
    cell.authorLabel.text = [NSString stringWithFormat:@"%@ %@", @"~", self.quotes[n].author];
    
    n = n+1;
    
    return cell;
}

@end
