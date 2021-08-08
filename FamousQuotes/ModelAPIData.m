//
//  ModelAPIData.m
//  FamousQuotes
//
//  Created by Bitmorpher 4 on 8/8/21.
//

#import "ModelAPIData.h"

@implementation ModelAPIData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {

       return @{
         @"quote": @"text",
         @"author": @"author",

         };
    }

@end
