//
//  SetGameCard.h
//  Matchers
//
//  Created by Jianbin Lei on 5/2/14.
//  Copyright (c) 2014 oit. All rights reserved.
//

#import "Card.h"

@interface SetGameCard : Card

/*
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
*/
 
@property (nonatomic) NSUInteger number;
@property (nonatomic,strong) NSString *color;
@property (nonatomic,strong) NSString *shade;
@property (nonatomic,strong) NSString *symbol;

+ (NSArray *)validSymbol;
+ (NSArray *)validShade;
+ (NSArray *)validColor;
+ (NSUInteger)maxNumber;

- (NSAttributedString *)getSetCardContent;

@end
