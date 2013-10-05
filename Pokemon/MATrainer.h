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

-(id)initWithPokemon:(MAPokemon*)pokemon;

@end
