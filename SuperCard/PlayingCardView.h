//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Jianbin Lei on 5/12/14.
//  Copyright (c) 2014 ou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (nonatomic,strong) NSString *suit;
@property (nonatomic) BOOL faceUp;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@end
