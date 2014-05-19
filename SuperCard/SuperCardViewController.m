//
//  SuperCardViewController.m
//  SuperCard
//
//  Created by Jianbin Lei on 5/12/14.
//  Copyright (c) 2014 ou. All rights reserved.
//

#import "SuperCardViewController.h"
#import "PlayingCardView.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"

@interface SuperCardViewController ()

@property (weak, nonatomic) IBOutlet PlayingCardView *gameCard;
@property (strong, nonatomic) Deck *deck;

@end

@implementation SuperCardViewController

- (Deck *)deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}


- (void)drawRandomPlayingCard
{
    Card *card = [self.deck drawRandomCard];
    if ([card isKindOfClass:[PlayingCard class]]) {
        PlayingCard *playingCard = (PlayingCard *)card;
        self.gameCard.rank = playingCard.rank;
        self.gameCard.suit = playingCard.suit;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.gameCard.rank = 13;
    self.gameCard.suit = @"♥";
	// Do any additional setup after loading the view, typically from a nib.
    [self.gameCard addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.gameCard action:@selector(pinch:)]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swap:(UISwipeGestureRecognizer *)sender {
    
    if (!self.gameCard.faceUp) {
        [self drawRandomPlayingCard];
    }
    self.gameCard.faceUp = !self.gameCard.faceUp;
}


@end
