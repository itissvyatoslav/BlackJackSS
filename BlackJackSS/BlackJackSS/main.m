//
//  main.m
//  First
//
//  Created by Sergey Vandanov on 15.10.2019.
//  Copyright © 2019 Sergey Vandanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Game.h"

NSString * getInput() {
    NSFileHandle * input = NSFileHandle.fileHandleWithStandardInput;
    NSData *data =input.availableData;
    return [[[NSString alloc]initWithData: data encoding:NSUTF8StringEncoding]stringByTrimmingCharactersInSet:[NSCharacterSet controlCharacterSet]];
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Welcome to BlackJack!");
        NSLog(@"Do you want to play? y/n");
        NSString *check = getInput();
        while ([check isEqualToString:@"y"]){
        
        Game * game = [Game new];
        [game startGame];
        
        if ([game iHaveBlackJack]) {
            NSLog(@"You have BlackJack!");
            return 0;
        }
      
        BOOL result = YES;
        while(result) {
            NSLog(@"Deal new card? y/n");
            NSString *str=getInput();
            
            if([str isEqualToString:@"y"]) {
                [game hitMe];
                [game printMy];
                
                if([game iHaveBlackJack]) {
                    NSLog(@"You win!");
                    result = NO;
                }
                if([game iHaveMore]) {
                    NSLog(@"You Busted! ");
                    result = NO;
                }
            }
            if([str isEqualToString:@"n"]) {
                BOOL dealerTookCard =[game hitDealer];
                if(dealerTookCard) {
                    [game printDealer];
                    if([game delaerHasBlackJack]) {
                        NSLog(@"Dealer win!");
                           result = NO;
                    }
                    if([game dealerHasMore]) {
                        NSLog(@"You win!");
                        result = NO;
                    }
                    else if([game scoreEqual]) {
                        NSLog(@"Equal!");
                        result = NO;
                    }
                }
            }
           
            
//            if ([check isEqualToString:@"n"])
//                result = NO;
        }
           NSLog(@"Do you want to play more? y/n");
           check = getInput();
        }
        return 0;
    }
    return 0;
}
