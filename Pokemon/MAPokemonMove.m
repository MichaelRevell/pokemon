//
//  MAPokemonMove.m
//  Pokemon
//
//  Created by Forest on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "MAPokemonMove.h"

@implementation MAPokemonMove

+(NSDictionary*)moveTable {
    static NSDictionary *moves = nil;
    
    if(moves != nil)
        return moves;
    
    moves = @{
          @"Scratch": @{
                  @"type": @"Normal",
                  @"category": @"Physical",
                  @"power": @40,
                  @"accuracy": @100,
                  @"pp": @1
            },
          @"Flamethrower": @{
                  @"type": @"Fire",
                  @"category": @"Physical",
                  @"power": @70,
                  @"accuracy": @100,
                  @"pp": @3
                  },
          @"Tackle": @{
                  @"type": @"Normal",
                  @"category": @"Physical",
                  @"power": @50,
                  @"accuracy": @100,
                  @"pp": @1
                  },
          @"Bubble": @{
                  @"type": @"Water",
                  @"category": @"Special",
                  @"power": @20,
                  @"accuracy": @100,
                  @"pp": @3
                  },
          @"Leech Seed": @{
                  @"type": @"Leaf",
                  @"category": @"Special",
                  @"power": @20,
                  @"accuracy": @100,
                  @"pp": @3
                  },
          };
    
    return moves;
}

- (id)initWithName:(NSString *)name {
    if(self = [super init]) {
        NSDictionary *moves = [MAPokemonMove moveTable];
        NSDictionary *moveData = [moves objectForKey:name];
        
        self.name = name;
        self.type = [moveData objectForKey:@"type"];
        self.category = [moveData objectForKey:@"category"];
        self.power = [[moveData objectForKey:@"power"] intValue];
        self.accuracy = [[moveData objectForKey:@"accuracy"] intValue];
        self.pp = [[moveData objectForKey:@"pp"] intValue];
    }
    return self;
}

@end
