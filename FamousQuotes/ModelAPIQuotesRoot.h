//
//  ModelAPIQuotesRoot.h
//  FamousQuotes
//
//  Created by Bitmorpher 4 on 8/8/21.
//

#import "ModelAPIData.h"
#import <Mantle/Mantle.h>

NS_ASSUME_NONNULL_BEGIN

@interface ModelAPIQuotesRoot : MTLModel <MTLJSONSerializing>

//@property (nonatomic, readwrite) NSString *status;
//@property (nonatomic, readwrite) NSString *message;
//@property (nonatomic, readwrite) NSString *count;
@property (copy, nonatomic) NSMutableArray<ModelAPIData *> *quotes;


@end

NS_ASSUME_NONNULL_END
