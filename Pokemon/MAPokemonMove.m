//
//  MAPokemonMove.m
//  Pokemon
//
//  Created by Forest on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "MAPokemonMove.h"

@implementation MAPokemonMove

- initWithType:(NSString *)type andCategory:(NSString*)category andPower:(int)power andAccuracy:(int)accuracy andPP:(int)pp andMoveName:(NSString *)name {
    if(self = [super init]) {
        self.name = name;
        self.type = type;
        self.category = category;
        self.power = power;
        self.accuracy = accuracy;
        self.pp = pp;
    }
    return self;
}

+(MAPokemonMove*)buildMove:(NSString*) moveName {
    if([moveName isEqualToString:@"Tackle"]) {
        return [[MAPokemonMove alloc] initWithType:@"Normal" andCategory:@"Physical" andPower:10 andAccuracy:100 andPP:35 andMoveName:moveName];
    }
    return nil;
}

@end
