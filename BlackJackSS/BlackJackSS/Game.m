//
//  Game.m
//  First
//
//  Created by Sergey Vandanov on 15.10.2019.
//  Copyright © 2019 Sergey Vandanov. All rights reserved.
//

#import "NSArray+Card.h"
#import "Game.h"
#import "Card.h"

@interface Game ()
    -(NSString *) _getCardNames:(NSArray *) cards;
    -(NSInteger) _calcScoreFor:(NSArray*) cards;

@end
@implementation Game
-(instancetype)init
{
    self = [super init];
    if(self) {
        _myCards = [NSMutableArray new];
        _dealerCards = [NSMutableArray new];
    }
    return self;
}
-(void) startGame {
    Card * card1 = [Card new];
    [_busyCards addObject:card1];
    Card * card2 = [Card new];

    Card * card3 = [Card new];
    [_myCards addObjectsFromArray:@[card1,card2]]; // creare array with elem card1,card2
    [_dealerCards addObject:card3];
    [self printMy];
    [self printDealer];
}
-(void) hitMe {
    [self.myCards addObject:[[Card alloc]init]];
}
- (BOOL)hitDealer {
    NSInteger dealerScore = [self _calcScoreFor:self.dealerCards];
    if(dealerScore>17) {
        return NO;
    }
    [self.dealerCards addObject:[[Card alloc] init]];
    return YES;
}
-(BOOL) iHaveBlackJack {
    NSInteger myScore = [self _calcScoreFor:self.myCards];
       if(myScore==21) {
           return YES;
       }
;
       return NO;
}

-(BOOL) delaerHasBlackJack {
    NSInteger dealerScore = [self _calcScoreFor:self.dealerCards];
       if(dealerScore==21) {
           return YES;
       }
       return NO;
}

-(BOOL) iHaveMore {
    NSInteger myScore = [self _calcScoreFor:self.myCards];
       if(myScore>21) {
           return YES;
       }
       return NO;
}


-(BOOL) dealerHasMore {
    NSInteger dealerScore = [self _calcScoreFor:self.dealerCards];
       if(dealerScore>21) {
           return YES;
       }
       return NO;
}

-(BOOL) scoreEqual {
    NSInteger dealerScore = [self _calcScoreFor:self.dealerCards];
    NSInteger myScore = [self _calcScoreFor:self.myCards];
       if(dealerScore==myScore ) {
           return YES;
       }
       return NO;
}

-(BOOL) iHaveHigherScore {
    NSInteger dealerScore =[self.dealerCards _calcScore];
    NSInteger myScore = [self _calcScoreFor:self.myCards];
    if(dealerScore<myScore) {
        return YES;
    }
    return NO;
}
-(void) printMy {
    NSLog(@"You have: %@",[self _getCardNames:self.myCards]);
}
-(void) printDealer {
    NSLog(@"Dealer has: %@",[self _getCardNames:self.dealerCards]);
}

-(NSString *) _getCardNames:(NSArray *) cards{
    return [cards _getCardNames];
}
-(NSInteger) _calcScoreFor:(NSArray*) cards {
    return [cards _calcScore];
}

@end
