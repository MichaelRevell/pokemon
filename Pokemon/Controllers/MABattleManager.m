//
//  BattleManager.m
//  Pokemon
//
//  Created by Forest on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "MABattleManager.h"

@implementation MABattleManager

-(id)initWithTrainer:(MATrainer*)trainer1 otherTrainer:(MATrainer*)trainer2 {
    if(self = [super init]) {
        self.trainer1 = trainer1;
        self.trainer2 = trainer2;
    }
    return self;
}

@end
