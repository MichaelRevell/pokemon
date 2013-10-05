//
//  MyScene.m
//  Pokemon
//
//  Created by Michael Revell on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "MyScene.h"

@interface MyScene ()

@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:1 green:1 blue:1 alpha:1.0];
        
        SKSpriteNode *squirt = [SKSpriteNode spriteNodeWithImageNamed:@"Squirtle"];
        squirt.position = CGPointMake(CGRectGetMaxX(self.frame),
                                      CGRectGetMidY(self.frame));
        [self addChild:squirt];
        
        SKSpriteNode *squirt2 = [SKSpriteNode spriteNodeWithImageNamed:@"Squirtle_back"];
        squirt2.position = CGPointMake(CGRectGetMinX(self.frame) + squirt2.size.width,
                                      CGRectGetMinY(self.frame) + squirt2.size.height);
        [self addChild:squirt2];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        /*CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];*/
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
