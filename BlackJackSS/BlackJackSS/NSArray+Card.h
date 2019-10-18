//
//  NSArray+Card.h
//  First
//
//  Created by Sergey Vandanov on 17.10.2019.
//  Copyright © 2019 Sergey Vandanov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray(Card)
-(NSString *) _getCardNames;
-(NSInteger) _calcScore;
@end

NS_ASSUME_NONNULL_END
