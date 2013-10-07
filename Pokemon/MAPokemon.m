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

@synthesize pp_text;

- (id)initWithType:(NSString *)type {
    if (self = [super init]) {
        if ([type isEqualToString:@"squirtle"]) {
            self.level = 5;
            self.max_hp = 20;
            self.current_hp = 20;
            self.max_pp = 10;
            self.current_pp = 10;
            self.pp_text = [NSString stringWithFormat:@"PP: %d/%d", self.current_pp, self.max_pp];
            self.element = @"water";
            self.type = type;
            self.name = @"Squirtle";
            self.attack = 5;
            self.defense = 5;
            self.special_attack = 5;
            self.special_defense = 5;
            self.speed = 5;
            self.moves = @[[[MAPokemonMove alloc] initWithName:@"Tackle"], [[MAPokemonMove alloc] initWithName:@"Bubble"]];
            self.frontSpritePath = @"Squirtle";
            self.backSpritePath = @"Squirtle_back";
        }
        else if([type isEqualToString:@"charmander"]) {
            self.level = 1;
            self.max_hp = 39;
            self.current_hp = 39;
            self.max_pp = 10;
            self.current_pp = 10;
            self.pp_text = [NSString stringWithFormat:@"PP: %d/%d", self.current_pp, self.max_pp];
            self.element = @"fire";
            self.type = type;
            self.name = @"Charmander";
            self.attack = 52;
            self.defense = 42;
            self.special_attack = 60;
            self.special_defense = 50;
            self.speed = 65;
            self.moves = @[[[MAPokemonMove alloc] initWithName:@"Scratch"]];
            self.frontSpritePath = @"Charmander";
            self.backSpritePath = @"Charmander_back";
        }
        else {
            return nil;
        }
    }
    
    return self;
};

-(NSString *)attackPokemon:(MAPokemon *)enemy WithMove:(int)move {
    NSString *status = @"Status";
    MAPokemonMove *current_move = [self.moves objectAtIndex:move];
    if (self.current_pp >= current_move.pp) {
        self.current_pp -= current_move.pp;
        self.pp_text = [NSString stringWithFormat:@"PP: %d/%d", self.current_pp, self.max_pp];
        
        double damage_from_level = (2.0 * self.level + 10)/250.0;
        double attack_over_defense = self.attack / self.defense;
        int base = current_move.power;
        
        double type = 1; // This can be either 0, 0.25, 0.5, 1, 2, or 4 depending on the type of attack and the type of the defending Pokémon. IMPLEMENT THIS LATER
        
        double stab = self.type == current_move.type ? 1.5 : 1;
        double random_mod = (85 + arc4random() % (100 - 85))/100.0;
        int crit = ((arc4random() % 10) > 7) ? 2 : 1;
        NSString *wasCrit = @"";
        if (crit == 2) {
             wasCrit = @"It was a critical attack!";
        }
        
        double modifier = stab * type * crit * random_mod;
        
        int damage = (damage_from_level * attack_over_defense * base + 2) * modifier;
        
        NSLog(@"%f * %f * %d  * %f", stab, type, crit, random_mod);
        
        [enemy getsHitWith:damage];
        
        status = [NSString stringWithFormat:@"%@ attacks %@ with %@. %@ %@ takes %d damage", self.name, enemy.name, current_move.name, wasCrit, enemy.name, damage ];
        //return current_move.power;
    } else {
        status = [NSString stringWithFormat:@"%@ did not have enough PP", self.name ];
        NSLog(@"Not Enough PP");
    }
    return status;
}

-(int)getsHitWith:(int)damage {
    //damage = MAX((damage - 1), 0);
    self.current_hp -= damage;
    self.current_hp = MAX(self.current_hp, 0);
    return damage;
}

-(bool)isDead {
    return self.current_hp <= 0;
}

@end
