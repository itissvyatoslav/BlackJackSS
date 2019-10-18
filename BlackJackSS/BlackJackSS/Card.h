//
//  Card.h
//  First
//
//  Created by Sergey Vandanov on 15.10.2019.
//  Copyright © 2019 Sergey Vandanov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CardType) {
    CardType2, 
    CardType3,
    CardType4,
    CardType5,
    CardType6,
    CardType7,
    CardType8,
    CardType9,
    CardType10,
    CardTypeJ,
    CardTypeQ,
    CardTypeK,
    CardTypeA
};

typedef NS_ENUM(NSInteger, CardSuit) {
    CardSuitC,
    CardSuitD,
    CardSuitH,
    CardSuitS,    
};

@interface Card : NSObject {
    CardType _type;
    CardSuit _suit;
}

- (NSString *) name;
- (NSInteger) score;
- (NSString *) csuit;

- (BOOL) isAce;
@end

NS_ASSUME_NONNULL_END
