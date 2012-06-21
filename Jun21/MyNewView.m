//
//  MyNewView.m
//  Jun21
//
//  Created by Lino Guglielmo on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyNewView.h"

@implementation MyNewView

float fontsize;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];		
		i = 1;
		
    }
    return self;
}

-(void) reDrawme{

	[self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

	//Fill and stroke a right triangle.

	
	CGSize size = self.bounds.size;
	CGFloat min = MIN(size.width, size.height);
	CGFloat length = min * 5 / 8;           //of side
	
	fontsize = 32.0;
	UIFont *font = [UIFont systemFontOfSize:fontsize] ;
	//NSString *mystring = @"Let's count is " +(i);
	NSString *mystring = [NSString stringWithFormat:@"%i", i];
	NSString *string = [mystring stringByAppendingString:@" taking a ride!"];	
	
	if (i<=size.height-fontsize) {
		CGPoint point = CGPointMake (0,i);
		[string drawAtPoint: point withFont: font];
	}else if (i>=size.height) {
		CGPoint point = CGPointMake (0,size.height-fontsize);
		[string drawAtPoint: point withFont: font];
	}	
	
	
	CGMutablePathRef p = CGPathCreateMutable();   //right triangle
	CGPathMoveToPoint(p, NULL, 0, 0);          //origin
	CGPathAddLineToPoint(p, NULL, length/2, 0);  //
	CGPathAddLineToPoint(p, NULL, length/2, length/3); //up
	CGPathAddLineToPoint(p, NULL, -length/2,length/3); //up
	CGPathAddLineToPoint(p, NULL, -length/2,0); //up
	CGPathCloseSubpath(p);

	
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);
	
	CGContextTranslateCTM(c, size.width / 2, size.height / 2); //origin at center of view
	CGContextRotateCTM(c, i * M_PI / 180.0);
	CGContextScaleCTM(c, 1, -1);                               //make Y axis point up
	

	CGContextAddPath(c, p);
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.1,1);
	CGContextFillPath(c);
	
		
	
	[self performSelector: @selector(reDrawme)
				   withObject: nil
				   afterDelay: 0.01];	
	
	CGContextBeginPath(c);
	CGContextAddPath(c, p);
	CGContextSetLineWidth(c, 10.0);
	CGContextSetRGBStrokeColor(c, 0.0, 0.0, 1.0, 1);
	CGContextSetShadow(c, CGSizeMake(10, -20), 5);	
	CGContextStrokePath(c);
	CGPathRelease(p);	
	
	
	i++;
}


@end	
