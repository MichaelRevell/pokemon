//
//  MAPokemon.h
//  Pokemon
//
//  Created by Michael Revell on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAPokemonMove.h"

@interface MAPokemon : NSObject

@property (strong, nonatomic) NSString *status;

// Identity
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *name;


// Stats
@property int level;
@property (strong, nonatomic) NSString *element;
@property int max_hp;
@property int current_hp;
@property int max_pp;
@property int current_pp;
@property (strong, nonatomic) NSString *pp_text;
@property int attack;
@property int defense;
@property int special_attack;
@property int special_defense;
@property int speed;

// Moves
@property (strong, nonatomic) NSArray *moves;


// Images
@property (strong, nonatomic)  NSString *frontSpritePath;
@property (strong, nonatomic)  NSString *backSpritePath;

-(NSString *)attackPokemon:(MAPokemon *)enemy WithMove:(int)move;
-(id)initWithType:(NSString *)type;
-(int)getsHitWith:(int)damage;
-(bool)isDead;

@end
