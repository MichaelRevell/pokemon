//
//  BattleManager.h
//  Pokemon
//
//  Created by Forest on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MATrainer.h"

@interface MABattleManager : NSObject

@property bool whoseTurn;
@property (strong, nonatomic) MATrainer *trainer1, *trainer2;

-(id)initWithTrainer:(MATrainer*)trainer1 otherTrainer:(MATrainer*)trainer2;

@end
