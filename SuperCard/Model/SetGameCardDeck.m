//
//  SetGameCardDeck.m
//  Matchers
//
//  Created by Jianbin Lei on 5/4/14.
//  Copyright (c) 2014 oit. All rights reserved.
//

#import "SetGameCardDeck.h"
#import "SetGameCard.h"

@implementation SetGameCardDeck

- (instancetype)init
{
    self = [super init];
    if(self) {
        for(NSString *symbol in [SetGameCard validSymbol]){
            for(NSString *color in [SetGameCard validColor])
            {
                for (NSString *shade in [SetGameCard validShade]) {
                    for(NSUInteger number = 1; number <= [SetGameCard maxNumber] ; number++)
                    {
                        SetGameCard *card = [[SetGameCard alloc]init];
                        card.symbol = symbol;
                        card.color = color;
                        card.shade = shade;
                        card.number = number;
                        [self addCard:card];
                    }
                }
            }
            
        }
        
    }
    return self;
}

@end
