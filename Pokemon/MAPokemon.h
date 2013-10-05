//
//  MAPokemon.h
//  Pokemon
//
//  Created by Michael Revell on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAPokemon : NSObject

@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *element;

@property int level;
@property int max_hp;
@property int current_hp;
@property int attack;
@property int defense;
@property int special_attack;
@property int special_defense;
@property int speed;


@end