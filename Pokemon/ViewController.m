//
//  ViewController.m
//  Pokemon
//
//  Created by Michael Revell on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"
#import "MABattleManager.h"
#import "MATrainer.h"
#import "MAPokemonMove.h"

@interface ViewController ()
    
@property (weak, nonatomic) IBOutlet UILabel *user_hp;
@property (weak, nonatomic) IBOutlet UILabel *computer_hp;
@property (weak, nonatomic) IBOutlet UIButton *attack;
@property (strong, nonatomic) MABattleManager *bm;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MATrainer *trainer1 = [[MATrainer alloc] initWithPokemon:[[MAPokemon alloc] initWithType:@"squirtle"]];
    
    MATrainer *trainer2 = [[MATrainer alloc] initWithPokemon:[[MAPokemon alloc] initWithType:@"squirtle"]];
    
    
    self.bm = [[MABattleManager alloc] initWithTrainer:trainer1 otherTrainer:trainer2];
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    
    self.user_hp.text = @"HP: 18/20";
    self.computer_hp.text = @"HP: 16/20";
    
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (IBAction)clickedAttack:(id)sender {
    NSLog(@"ATTACK!");
    //[bm attackWithMove:1];
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
