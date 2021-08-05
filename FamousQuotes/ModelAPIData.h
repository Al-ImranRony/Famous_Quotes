//
//  ModelAPIData.h
//  FamousQuotes
//
//  Created by Bitmorpher 4 on 8/4/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ModelAPIData : NSObject

@property (nonatomic, strong) NSString *quote;
@property (nonatomic, strong) NSString *author;

-(id)initWithQuote:(NSString *)quote withAuthor:(NSString *)author;

@end

NS_ASSUME_NONNULL_END
