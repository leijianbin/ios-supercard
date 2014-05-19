//
//  PlayingCardView.m
//  SuperCard
//
//  Created by Jianbin Lei on 5/12/14.
//  Copyright (c) 2014 ou. All rights reserved.
//

#import "PlayingCardView.h"


@interface PlayingCardView()

@property (nonatomic) CGFloat faceSacleFactor;

@end

@implementation PlayingCardView

@synthesize faceSacleFactor = _faceSacleFactor; //

#pragma mark - Property

- (void)setFaceSacleFactor:(CGFloat)faceSacleFactor
{
    _faceSacleFactor = faceSacleFactor;
    [self setNeedsDisplay];
}

- (CGFloat)faceSacleFactor
{
    if (!_faceSacleFactor) {
        _faceSacleFactor = 0.90; //
    }
    return _faceSacleFactor;
}


- (void)setSuit:(NSString *)suit
{
    _suit = suit;
    [self setNeedsDisplay];
}

- (void)setRank:(NSUInteger)rank
{
    _rank = rank;
    [self setNeedsDisplay];
}

- (void)setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}


- (void)pinch:(UIPinchGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged ||
         gesture.state == UIGestureRecognizerStateEnded)) {
        self.faceSacleFactor *= gesture.scale;
        gesture.scale = 1.0;
    }
}

#define CORNER_FONT_STAND_HEIGHT 180.0
#define CORNER_RADIUS 12.0

- (CGFloat)cornerScaleFactor { return self.bounds.size.height / CORNER_FONT_STAND_HEIGHT; }
- (CGFloat)cornerRadius { return CORNER_RADIUS * [self cornerScaleFactor]; }
- (CGFloat)cornerOffset { return [self cornerRadius] / 3.0; }


- (void)drawRect:(CGRect)rect
{
    //draw code
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    [roundedRect addClip];
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    
    //draw face
    
    NSString * cardName = [NSString stringWithFormat:@"%@%@",[self rankAsString],self.suit];
    
    UIImage *faceImage = [UIImage imageNamed:cardName];
    
    if (self.faceUp) {
        if (faceImage) {
            //
            CGRect imageRect = CGRectInset(self.bounds,
                                           self.bounds.size.width * (1.0 - self.faceSacleFactor),
                                           self.bounds.size.height * (1.0 - self.faceSacleFactor));
            [faceImage drawInRect:imageRect];
            
        } else {
            [self drawPips];
        }
        
        [self drawCorner];
    } else {
        [[UIImage imageNamed:@"cardback"] drawInRect:self.bounds];
    }
    
}

- (void)drawPips
{
    //
}

- (NSString *)rankAsString
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"][self.rank];
}

- (void)drawCorner
{
    //font
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];
    //pragraph
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    
    //ns as
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@",[self rankAsString],self.suit] attributes:@{NSFontAttributeName:cornerFont, NSParagraphStyleAttributeName: paragraph}];
    
    //draw
    CGRect textBound;
    textBound.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    textBound.size = [cornerText size];
    
    //
    [cornerText drawInRect:textBound];
    
    //context ref
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
    
    //
    [cornerText drawInRect:textBound];
    
}

#pragma mark - Initialization

- (void)setup
{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib //view cycle
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
    }
    return self;
}

@end
