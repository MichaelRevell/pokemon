//
//  BattleManager.h
//  Pokemon
//
//  Created by Forest on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MATrainer.h"

@interface MABattleManager : NSObject

@property (strong, nonatomic) MATrainer *trainer1, *trainer2;
@property (strong, nonatomic) NSString *user_hp;
@property (strong, nonatomic) NSString *computer_hp;
@property (strong, nonatomic) NSString *status;
@property BOOL game_over;
@property BOOL is_user_move;

-(id)initWithTrainer:(MATrainer*)trainer1 otherTrainer:(MATrainer*)trainer2;
-(void)attackWithMove:(int)move;
-(void)battleEnded;
-(void)alertBattleEnded;

@end
