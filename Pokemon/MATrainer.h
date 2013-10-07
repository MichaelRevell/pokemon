//
//  MATrainer.h
//  Pokemon
//
//  Created by Forest on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAPokemon.h"

@interface MATrainer : NSObject

@property (strong, nonatomic) MAPokemon *pokemon;
@property (strong, nonatomic) NSString *status;
@property (strong, nonatomic) NSString *name;


-(id)initWithPokemon:(MAPokemon*)pokemon;
-(void)attackTrainer:(MATrainer *)trainer withMove:(int) move isUser:(bool)is_user;
-(BOOL)allPokemonDead;

@end
