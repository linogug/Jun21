//
//  Jun21AppDelegate.h
//  Jun21
//
//  Created by Lino Guglielmo on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyNewView;

@interface Jun21AppDelegate : UIResponder <UIApplicationDelegate>
{
	MyNewView	 *view1;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
