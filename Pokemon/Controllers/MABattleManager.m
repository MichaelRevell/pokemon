//
//  BattleManager.m
//  Pokemon
//
//  Created by Forest on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "MABattleManager.h"

@implementation MABattleManager

@synthesize user_hp;
@synthesize computer_hp;
@synthesize status;
@synthesize is_user_move;

-(id)initWithTrainer:(MATrainer*)trainer1 otherTrainer:(MATrainer*)trainer2 {
    if(self = [super init]) {
        self.trainer1 = trainer1;
        self.trainer2 = trainer2;
        self.is_user_move = true;
    }
    return self;
}

-(void)attackWithMove:(int)move {
    self.trainer2.pokemon.current_hp--;
    self.computer_hp = [NSString stringWithFormat:@"HP: %d/%d", self.trainer2.pokemon.current_hp, self.trainer2.pokemon.max_hp];
    self.status = [NSString stringWithFormat:@"You attack for 1 damage"];
    
    self.is_user_move = false;
    
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(doComputerStuff) userInfo:nil repeats:NO];
}

-(void)doComputerStuff {
    self.trainer1.pokemon.current_hp--;
    self.user_hp = [NSString stringWithFormat:@"HP: %d/%d", self.trainer1.pokemon.current_hp, self.trainer1.pokemon.max_hp];
    self.status = [NSString stringWithFormat:@"The Computer attacks for 1 damage"];
    self.is_user_move = true;
}

-(void)battleEnded {
    self.status = @"Battle is OVER!";
}

@end
