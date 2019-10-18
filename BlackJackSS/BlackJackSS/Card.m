
#import "Card.h"

@implementation Card

-(instancetype)init
{
    self = [super init];
    if(self) {
        _type = arc4random_uniform(12);
        _suit = arc4random_uniform(4);
    }
    return self;
}

- (NSString *) name {
    switch (_type) {
        case CardType2:
            return @"Two";
            break;
        case CardType3:
            return @"Three";
            break;
        case CardType4:
           return @"Four";
           break;
       case CardType5:
            return @"Five";
            break;
        case CardType6:
            return @"Six";
            break;
        case CardType7:
            return @"Seven";
            break;
            case CardType8:
          return @"Eight";
            break;
        case CardType9:
            return @"Nine";
            break;
       case CardType10:
          return @"Ten";
          break;
      case CardTypeJ:
           return @"Jack";
           break;
       case CardTypeQ:
           return @"Queen";
           break;
       case CardTypeK:
           return @"King";
           break;
       case CardTypeA:
         return @"Ace";
         break;
    }
    
}

- (NSString *) csuit {
    switch (_suit){
        case CardSuitC:
            return @"Clubs";
            break;
        case CardSuitD:
            return @"Diamonds";
            break;
        case CardSuitH:
            return @"Hearts";
            break;
        case CardSuitS:
            return @"Spades";
            break;
    }
};

- (NSInteger) score {
 switch (_type) {
     case CardType2:
         return 2;
    case CardType3:
        return 3;
     case CardType4:
          return 4;
     case CardType5:
         return 5;
     case CardType6:
          return 6;
     case CardType7:
         return 7;
      case CardType8:
           return 8;
      case CardType9:
          return 9;
     case CardType10:
             return 10;
         case CardTypeJ:
              return 10;
         case CardTypeQ:
             return 10;
          case CardTypeK:
               return 10;
          case CardTypeA:
              return 11;
 }
}
- (BOOL) isAce {
    if(_type==CardTypeA) {
        return YES;

    }
    return NO;
}

@end
