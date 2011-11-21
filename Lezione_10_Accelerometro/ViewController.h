//
//  ViewController.h
//  Lezione_10_Accelerometro
//
//  Created by Alberto Pasca on 15/11/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController {
  
  CMMotionManager *motionManager;

}

@end


/*** iOS < 5 *****

 @interface ViewController : UIViewController <UIAccelerometerDelegate> {

 }
 @end
 
 @implementation...
 
 - (void) didAccelerate(UIAccelerometer*)acc {
 
 }
 
 @end

*/