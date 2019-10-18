//
//  NSArray+Card.m
//  First
//
//  Created by Sergey Vandanov on 17.10.2019.
//  Copyright © 2019 Sergey Vandanov. All rights reserved.
//

#import "NSArray+Card.h"
#import "Card.h"
@implementation NSArray (Card)

-(NSString *) _getCardNames {
    NSMutableString *cardNames = [[NSMutableString alloc] init];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {//пройдись по обьекту используя
        Card * card = obj;
        [cardNames appendString:[card name]];
        [cardNames appendString:@" - "];
        [cardNames appendString:[card csuit]];
        [cardNames appendString:@" "];

    }];
    return cardNames;
}


//    for(Card * card in self) { //  вместо
//        [cardNames appendString:[card name]];
//        [cardNames appendString:@" "];
//    }
//    return cardNames;
//}
-(NSInteger) _calcScore {
    __block NSInteger score =0;
    __block NSInteger aceCount =0;
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Card * card=obj;
        score += [card score];
             if([card isAce]) {
                 aceCount++;
             }

    }];
    while (aceCount >0 && score >21 ) {
        score-=10;
        aceCount--;
    }
    return score;
}
//    for(Card * card in self) {
//        score += [card score];
//        if([card isAce]) {
//            aceCount++;
//        }
//    }
//    while (aceCount >0 && score >21 ) {
//        score-=10;
//        aceCount--;
//    }
//    return score;
@end

// add enum mast dobavit
// would you like play one more time infinity while
// 52 card - max - propety which save colod
