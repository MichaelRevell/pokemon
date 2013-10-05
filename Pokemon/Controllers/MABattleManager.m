//
//  BattleManager.m
//  Pokemon
//
//  Created by Forest on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "MABattleManager.h"
#import "MATrainer.h"

@implementation MABattleManager

@synthesize user_hp;
@synthesize computer_hp;
@synthesize status;
@synthesize is_user_move;
@synthesize game_over;

-(id)initWithTrainer:(MATrainer*)trainer1 otherTrainer:(MATrainer*)trainer2 {
    if(self = [super init]) {
        self.trainer1 = trainer1;
        self.trainer2 = trainer2;
        [self.trainer1 addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:NULL];
        [self.trainer2 addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:NULL];
        self.is_user_move = true;
        self.game_over = false;
    }
    return self;
}

-(void)attackWithMove:(int)move {
    [self.trainer1 attackTrainer:self.trainer2 withMove:move isUser:true];
    self.computer_hp = [NSString stringWithFormat:@"HP: %d/%d", self.trainer2.pokemon.current_hp, self.trainer2.pokemon.max_hp];
    
    self.is_user_move = false;
    
    if ([self.trainer2 allPokemonDead]) {
        [self battleEnded];
    }
    
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(doComputerStuff) userInfo:nil repeats:NO];
}

-(void)doComputerStuff {
    [self.trainer2 attackTrainer:self.trainer1 withMove:0 isUser:false];
    self.user_hp = [NSString stringWithFormat:@"HP: %d/%d", self.trainer1.pokemon.current_hp, self.trainer1.pokemon.max_hp];
    if ([self.trainer1 allPokemonDead]) {
        [self battleEnded];
    }
    self.is_user_move = true;
}

-(void)battleEnded {
    self.game_over = true;
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(alertBattleEnded) userInfo:nil repeats:NO];
}
-(void)alertBattleEnded {
    self.status = @"Battle is OVER!";
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    MATrainer *m = object;
    NSLog(@"SETTING STATUS MOTHER FUCKER (%@ heehee)", keyPath);
    self.status = m.status;
}

@end
