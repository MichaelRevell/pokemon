//
//  MAPokemon.m
//  Pokemon
//
//  Created by Michael Revell on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "MAPokemon.h"

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
        }
        else {
            return nil;
        }
    }
    
    return self;
};

@end
