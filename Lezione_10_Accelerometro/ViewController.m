//
//  ViewController.m
//  Lezione_10_Accelerometro
//
//  Created by Alberto Pasca on 15/11/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  motionManager = [[CMMotionManager alloc] init]; 
  
  if ( motionManager.gyroAvailable ) {
    motionManager.gyroUpdateInterval = 1.0/60.0;
    [motionManager startGyroUpdates];
  }
  
  if ( motionManager.accelerometerAvailable ) {
    motionManager.accelerometerUpdateInterval = 0.01;
    [motionManager startAccelerometerUpdates];
  }
  
  if ( motionManager.isDeviceMotionAvailable ) {
    [motionManager startDeviceMotionUpdates];
    motionManager.deviceMotionUpdateInterval = 0.02;
  }
  
  if ( motionManager.isMagnetometerAvailable ) {
    [motionManager startMagnetometerUpdates];
    motionManager.magnetometerUpdateInterval = 0.02;
  }
  
}

- (BOOL) canBecomeFirstResponder {
  return YES;
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
  NSLog(@"%s", __FUNCTION__);
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
  if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake) 
  {
    NSLog(@"SHAKE SHAKE SHAKE");
  }
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event { 
  NSLog(@"%s", __FUNCTION__);
}

- (void) drawView {
  
  NSLog(@"GYRO X: %f", motionManager.gyroData.rotationRate.x );
  NSLog(@"GYRO Y: %f", motionManager.gyroData.rotationRate.y );
  NSLog(@"GYRO Z: %f", motionManager.gyroData.rotationRate.z );

  NSLog(@"ACCELEROMETER X: %f", motionManager.accelerometerData.acceleration.x );
  NSLog(@"ACCELEROMETER Y: %f", motionManager.accelerometerData.acceleration.y );
  NSLog(@"ACCELEROMETER Z: %f", motionManager.accelerometerData.acceleration.z );

  NSLog(@"MOTION X: %f", motionManager.deviceMotion.rotationRate.x );
  NSLog(@"MOTION Y: %f", motionManager.deviceMotion.rotationRate.y );
  NSLog(@"MOTION Z: %f", motionManager.deviceMotion.rotationRate.z );

  NSLog(@"MAGNET X: %f", motionManager.magnetometerData.magneticField.x );
  NSLog(@"MAGNET Y: %f", motionManager.magnetometerData.magneticField.y );
  NSLog(@"MAGNET Z: %f", motionManager.magnetometerData.magneticField.z );

}

- (void)viewDidUnload
{
  [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
