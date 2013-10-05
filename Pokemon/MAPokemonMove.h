//
//  MAPokemonMove.h
//  Pokemon
//
//  Created by Forest on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAPokemonMove : NSObject

@property NSString *type;
@property NSString *category;

@property int power;
@property int accuracy;
@property int pp;

+(MAPokemonMove*)buildMove:(NSString*) moveName;

@end
