//
//  MATrainer.m
//  Pokemon
//
//  Created by Forest on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "MATrainer.h"

@implementation MATrainer

-(id)initWithPokemon:(MAPokemon*)pokemon {
    if(self = [super init]) {
        self.pokemon = pokemon;
    }
    return self;
}

@end
