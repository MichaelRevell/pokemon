//
//  MATrainer.m
//  Pokemon
//
//  Created by Forest on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "MATrainer.h"

@implementation MATrainer

@synthesize status;

-(id)initWithPokemon:(MAPokemon*)pokemon {
    if(self = [super init]) {
        self.pokemon = pokemon;
    }
    return self;
}

-(void)attackTrainer:(MATrainer *)trainer withMove:(int) move isUser:(bool)is_user {
    int damage = rand() % 5;
    trainer.pokemon.current_hp -= damage;
    if (is_user) {
        self.status = [NSString stringWithFormat:@"You attack computer for %d damage", damage];
    } else {
        self.status = [NSString stringWithFormat:@"Computer attacks you for %d damage", damage];
    }
}

@end
