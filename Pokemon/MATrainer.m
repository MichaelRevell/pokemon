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
    //int damage = self.pokemon.attack * ((rand() % 10) / 10);
    self.status = [self.pokemon attackPokemon:trainer.pokemon WithMove:move];
}

-(BOOL)allPokemonDead {
    return [self.pokemon isDead];
}

@end
