//
//  SetGameCard.m
//  Matchers
//
//  Created by Jianbin Lei on 5/2/14.
//  Copyright (c) 2014 oit. All rights reserved.
//

#import "SetGameCard.h"

@interface SetGameCard()

@end

@implementation SetGameCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == 2) {
        SetGameCard *anotherCard1  = otherCards[0];
        SetGameCard *anotherCard2  = otherCards[1];
        NSLog(@"Card1: %d %@ %@ %@", self.number,self.symbol,self.color,self.shade);
        NSLog(@"Card2: %d %@ %@ %@", anotherCard1.number,anotherCard1.symbol,anotherCard1.color,anotherCard1.shade);
        NSLog(@"Card3: %d %@ %@ %@", anotherCard2.number,anotherCard2.symbol,anotherCard2.color,anotherCard2.shade);
        
        bool numberTF = ((self.number == anotherCard1.number)&&(self.number == anotherCard2.number)) || (!(self.number == anotherCard1.number)&&!(self.number == anotherCard2.number)&&!(anotherCard2.number == anotherCard1.number));
        bool colorTF = ([self.color isEqualToString:anotherCard1.color]&&[self.color isEqualToString:anotherCard2.color]) || (![self.color isEqualToString:anotherCard1.color]&&![self.color isEqualToString:anotherCard2.color]&&![anotherCard2.color isEqualToString:anotherCard1.color]);
        bool symbolTF = ([self.symbol isEqualToString:anotherCard1.symbol]&&[self.symbol isEqualToString:anotherCard2.symbol]) || (![self.symbol isEqualToString:anotherCard1.symbol]&&![self.symbol isEqualToString:anotherCard2.symbol]&&![anotherCard2.symbol isEqualToString:anotherCard1.symbol]);
        bool shadeTF = ([self.shade isEqualToString:anotherCard1.shade]&&[self.shade isEqualToString:anotherCard2.shade]) || (![self.shade isEqualToString:anotherCard1.shade]&&![self.shade isEqualToString:anotherCard2.shade]&&![anotherCard2.shade isEqualToString:anotherCard1.shade]);
        if (numberTF && colorTF && symbolTF && shadeTF) {
            score = 1; // match the Set
        }
        
    }
    return score;
}


- (void)setSymbol:(NSString *)symbol
{
    if ([[SetGameCard validSymbol] containsObject:symbol]) {
        _symbol = symbol;
    }
}

- (void)setShade:(NSString *)shade
{
    if ([[SetGameCard validShade] containsObject:shade]) {
        _shade = shade;
    }
}

- (void)setColor:(NSString *)color
{
    if ([[SetGameCard validColor] containsObject:color]) {
        _color = color;
    }
}


- (NSAttributedString *)getSetCardContent
{
    NSMutableAttributedString* cardContent = [[NSMutableAttributedString alloc] init];
    //
    UIColor *symbolColor;
    if ([self.color isEqualToString:@"red"]) {
        symbolColor = [UIColor redColor];
    }
    if ([self.color isEqualToString:@"green"]) {
        symbolColor = [UIColor greenColor];
    }
    
    if ([self.color isEqualToString:@"blue"]) {
        symbolColor = [UIColor blueColor];
    }
    
    float alpha = 1.0;
    NSNumber *width = @0;
    
    if ([self.shade isEqualToString:@"solid"]) {
        alpha = 1.0;
    }

    if ([self.shade isEqualToString:@"striped"]) {
        alpha = 0.2;
    }

    if ([self.shade isEqualToString:@"open"]) {
        alpha = 0.2;
        width = @-3;
    }

    NSAttributedString *singleSymbol = [[NSAttributedString alloc] initWithString:self.symbol attributes:@{ NSForegroundColorAttributeName:[symbolColor colorWithAlphaComponent:alpha], NSStrokeColorAttributeName:[UIColor blackColor],NSStrokeWidthAttributeName:width}];
    
    for (int i = 0; i < self.number; i++) {
        [cardContent appendAttributedString:singleSymbol];
    }
    
    return cardContent;
}

+ (NSArray *)validSymbol
{
    return @[@"▲",@"●",@"◼︎"];
}

+ (NSArray *)validShade
{
    return @[@"solid",@"striped",@"open"];
}

+ (NSArray *)validColor
{
    return @[@"red",@"green",@"blue"];
}

+ (NSUInteger)maxNumber
{
    return 3;
}

@end
