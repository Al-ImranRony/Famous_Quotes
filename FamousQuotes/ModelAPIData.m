//
//  ModelAPIData.m
//  FamousQuotes
//
//  Created by Bitmorpher 4 on 8/4/21.
//

#import "ModelAPIData.h"

@implementation ModelAPIData

- (id)initWithQuote:(NSString *)quote withAuthor:(NSString *)author
{
    self = [super init];
    
    self.quote = quote;
    self.author = author;
    
    return self;
}


@end
