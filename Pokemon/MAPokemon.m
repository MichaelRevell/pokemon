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

+(NSDictionary*)pokeTable {
    static NSDictionary *pokes = nil;
    
    if(pokes != nil)
        return pokes;
    
    pokes = @{
              @"Squirtle": @{
                      @"hp": @44,
                      @"type": @"Water",
                      @"attack": @48,
                      @"defense": @65,
                      @"special_attack": @50,
                      @"special_defense": @64,
                      @"speed": @43,
                      @"moves": @[[[MAPokemonMove alloc] initWithName:@"Tackle"], [[MAPokemonMove alloc] initWithName:@"Bubble"]]
                      },
              @"Charmander": @{
                      @"hp": @44,
                      @"type": @"Water",
                      @"attack": @48,
                      @"defense": @65,
                      @"special_attack": @50,
                      @"special_defense": @64,
                      @"speed": @43,
                      @"moves": @[[[MAPokemonMove alloc] initWithName:@"Scratch"], [[MAPokemonMove alloc] initWithName:@"Flamethrower"]]
                      },
              @"Bulbasaur": @{
                      @"hp": @45,
                      @"type": @"Leaf",
                      @"attack": @49,
                      @"defense": @49,
                      @"special_attack": @65,
                      @"special_defense": @65,
                      @"speed": @45,
                      @"moves": @[[[MAPokemonMove alloc] initWithName:@"Tackle"], [[MAPokemonMove alloc] initWithName:@"Bubble"]]
                      },
              };
    
    return pokes;
}

- (id)initWithType:(NSString *)type {
    if (self = [super init]) {
        NSDictionary *pokes = [MAPokemon pokeTable];
        NSDictionary *poke = [pokes objectForKey:type];
        
        self.level = 1;
        self.max_hp = [[poke objectForKey:@"hp"] intValue];
        self.current_hp = [[poke objectForKey:@"hp"] intValue];
        self.element = [poke objectForKey:@"type"];
        self.type = type;
        self.name = type;
        self.attack = [[poke objectForKey:@"attack"] intValue];
        self.defense = [[poke objectForKey:@"defense"] intValue];
        self.special_attack = [[poke objectForKey:@"special_attack"] intValue];
        self.special_defense = [[poke objectForKey:@"special_defense"] intValue];
        self.speed = [[poke objectForKey:@"speed"] intValue];
        self.moves = [poke objectForKey:@"moves"];
        self.frontSpritePath = type;
        self.backSpritePath = [NSString stringWithFormat:@"%@_back", type];
        
        // bcuz michael sucks
        self.current_pp = 20;
        self.max_pp = 20;
        self.pp_text = [NSString stringWithFormat:@"PP: %d/%d", self.current_pp, self.max_pp];
        
        NSLog(@"%@", self);
    }
    
    return self;
};

-(NSString *)attackPokemon:(MAPokemon *)enemy WithMove:(int)move {
    NSString *status = @"Status";
    MAPokemonMove *current_move = [self.moves objectAtIndex:move];
    if (self.current_pp >= current_move.pp) {
        self.current_pp -= current_move.pp;
        self.pp_text = [NSString stringWithFormat:@"PP: %d/%d", self.current_pp, self.max_pp];
        
        // compute modifier
        double stab = [self.type isEqualToString:current_move.type] ? 1.5 : 1;
        double type = 1;
        double crit = 1;
        double r = (85 + arc4random() % 15) / 100.0f;
        double mod = stab * type * crit * r;
        
        NSLog(@"stab: %f, type: %f, crit: %f, r: %f, mod: %f", stab, type, crit, r, mod);
        
        int damage = /*((2 * self.level + 10) / 250.0)
            **/0.5 * (self.attack / (double)enemy.defense)
            * current_move.power
            + 2;
        
        NSLog(@"lvl scale: %f, attack/defense: %f, power: %d",
              ((2 * self.level + 10) / 250.0),
              (self.attack / (double)enemy.defense),
              current_move.power);
        
        damage *= mod;
        
/*        double damage_from_level = (2.0 * self.level + 10)/250.0;
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
        */
        [enemy getsHitWith:damage];
        
        status = [NSString stringWithFormat:@"%@ attacks %@ with %@. %@ %@ takes %d damage", self.name, enemy.name, current_move.name, @"", enemy.name, damage ];
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
