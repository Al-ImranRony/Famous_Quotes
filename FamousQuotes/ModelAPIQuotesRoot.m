//
//  ModelAPIQuotesRoot.m
//  FamousQuotes
//
//  Created by Bitmorpher 4 on 8/8/21.
//

#import "ModelAPIQuotesRoot.h"

@implementation ModelAPIQuotesRoot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
//             @"status" : @"status",
//             @"message" : @"message",
//             @"count": @"count",
             @"quotes": @"quotes",
             
             };
}

+ (NSValueTransformer *)quotesJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:ModelAPIData.class];
}

@end
