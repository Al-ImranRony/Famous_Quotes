//
//  CustomTableViewCell.h
//  FamousQuotes
//
//  Created by Bitmorpher 4 on 8/3/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *quotesLabel;

@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

@end

NS_ASSUME_NONNULL_END
