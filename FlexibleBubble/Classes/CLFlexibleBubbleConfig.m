//
//  CLFlexibleBubbleConfig.m
//  FlexibleBubble
//
//  Created by Climb 王 on 2022/5/19.
//

#import "CLFlexibleBubbleConfig.h"

@implementation CLFlexibleBubbleConfig

- (instancetype)init {
  if (self = [super init]) {
      self.bubbleType = FlexibleBubbleTypeArrowTop;
      self.arrowSize = CGSizeMake(8, 4);
      self.labelHPadding = 8;
      self.labelVPadding = 2;
      self.labelNumberOfLines = 0;
      self.cornerRadius = 4.f;
      self.arrowOffset = 0;
      self.arrowSpace = 2.f;
      self.sideEdge = 16.0;
      self.bgColor = UIColor.blueColor;
      self.titleFont = [UIFont systemFontOfSize:12];
      self.titleColor = UIColor.whiteColor;
      self.bubbleMaxWidth = 170.f;
  }
  return self;
}

@end
