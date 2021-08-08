//
//  ModelAPIData.h
//  FamousQuotes
//
//  Created by Bitmorpher 4 on 8/8/21.
//

#import <UIKit/UIKit.h>
#import <Mantle/Mantle.h>

NS_ASSUME_NONNULL_BEGIN

@interface ModelAPIData : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readwrite) NSString *quote;
@property (nonatomic, copy, readwrite) NSString *author;

@end

NS_ASSUME_NONNULL_END
