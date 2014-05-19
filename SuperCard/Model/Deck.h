//
//  Deck.h
//  Matchers
//
//  Created by Jianbin Lei on 4/20/14.
//  Copyright (c) 2014 oit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card
          atTop:(BOOL)atTop;


- (void)addCard:(Card *)card;


- (Card *)drawRandomCard;

@end
