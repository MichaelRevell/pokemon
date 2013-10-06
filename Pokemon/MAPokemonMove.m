//
//  MAPokemonMove.m
//  Pokemon
//
//  Created by Forest on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "MAPokemonMove.h"

@implementation MAPokemonMove

- (id)initWithName:(NSString *)name {
    if(self = [super init]) {
        if([name isEqualToString:@"Tackle"]) {
            self.name = @"Tackle";
            self.type = @"Normal";
            self.category = @"Physical";
            self.power = 10;
            self.accuracy = 100;
            self.pp = 1;
        }
        else if ([name isEqualToString:@"Squirt"]) {
            self.name = @"Squirt";
            self.type = @"Water";
            self.category = @"Special";
            self.power = 10;
            self.accuracy = 90;
            self.pp = 5;
        }
    }
    return self;
}

+(MAPokemonMove*)buildMove:(NSString*) moveName {
   /* if([moveName isEqualToString:@"Tackle"]) {
        return [[MAPokemonMove alloc] initWithType:@"Normal" andCategory:@"Physical" andPower:10 andAccuracy:100 andPP:35 andMoveName:moveName];
    }*/
    return nil;
}

@end
