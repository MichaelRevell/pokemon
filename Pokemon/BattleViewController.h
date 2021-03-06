//
//  BattleViewController.h
//  Pokemon
//

//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "MATrainer.h"
#import "MABattleManager.h"

@interface BattleViewController : UIViewController

@property (strong, nonatomic) MATrainer *user;
@property (strong, nonatomic) MABattleManager *bm;

@end
