//
//  MAPokemon.m
//  Pokemon
//
//  Created by Michael Revell on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "MAPokemon.h"
#import "MAPokemonMove.h"

@implementation MAPokemon

- (id)initWithType:(NSString *)type {
    if (self = [super init]) {
        if ([type isEqualToString:@"squirtle"]) {
            self.level = 1;
            self.max_hp = 20;
            self.current_hp = 20;
            self.element = @"water";
            self.type = type;
            self.name = @"Squirtle";
            self.attack = 10;
            self.defense = 10;
            self.special_attack = 10;
            self.special_defense = 10;
            self.speed = 10;
            self.moves = @[[MAPokemonMove buildMove:@"Tackle"]];
            self.frontSpritePath = @"Squirtle";
            self.backSpritePath = @"Squirtle_back";
        }
        else {
            return nil;
        }
    }
    
    return self;
};

-(int)getsHitWith:(int)damage {
    self.current_hp -= damage;
    self.current_hp = MAX(self.current_hp, 0);
    return damage;
}

-(bool)isDead {
    return self.current_hp <= 0;
}

@end
