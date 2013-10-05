//
//  ViewController.m
//  Pokemon
//
//  Created by Michael Revell on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "ViewController.h"
#import "MABattleManager.h"
#import "MATrainer.h"
#import "MAPokemonMove.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *computer_hp;
@property (weak, nonatomic) IBOutlet UIImageView *computer_image;
@property (weak, nonatomic) IBOutlet UILabel *user_hp;
@property (weak, nonatomic) IBOutlet UIImageView *user_image;
@property (weak, nonatomic) IBOutlet UIButton *attack;
@property (weak, nonatomic) IBOutlet UILabel *status;

@property (strong, nonatomic) MABattleManager *bm;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MATrainer *trainer1 = [[MATrainer alloc] initWithPokemon:[[MAPokemon alloc] initWithType:@"squirtle"]];
    MATrainer *trainer2 = [[MATrainer alloc] initWithPokemon:[[MAPokemon alloc] initWithType:@"squirtle"]];
    
    self.bm = [[MABattleManager alloc] initWithTrainer:trainer1 otherTrainer:trainer2];
    [self.bm addObserver:self forKeyPath:@"user_hp" options:NSKeyValueObservingOptionNew context:NULL];
    [self.bm addObserver:self forKeyPath:@"computer_hp" options:NSKeyValueObservingOptionNew context:NULL];
    [self.bm addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:NULL];
    [self.bm addObserver:self forKeyPath:@"is_user_move" options:NSKeyValueObservingOptionNew context:NULL];
    
    self.user_image.image = [UIImage imageNamed:@"Squirtle_back" ];
    self.computer_image.image = [UIImage imageNamed:@"Squirtle" ];
    
    self.user_hp.text = [NSString stringWithFormat:@"HP: %d/%d", self.bm.trainer1.pokemon.current_hp, self.bm.trainer1.pokemon.max_hp];
    self.computer_hp.text = [NSString stringWithFormat:@"HP: %d/%d", self.bm.trainer2.pokemon.current_hp, self.bm.trainer2.pokemon.max_hp];
    self.status.numberOfLines = 4;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if([keyPath isEqualToString:@"user_hp"]) {
        self.user_hp.text = self.bm.user_hp;
    }
    else if([keyPath isEqualToString:@"computer_hp"]) {
        self.computer_hp.text = self.bm.computer_hp;
    }
    else if([keyPath isEqualToString:@"status"]) {
        self.status.text = self.bm.status;
    }
    else if([keyPath isEqualToString:@"is_user_move"]) {
        if (self.bm.is_user_move == false) {
            [self.attack setEnabled:NO];
        } else {
            [self.attack setEnabled:YES];
        }
    }
}

- (IBAction)clickedAttack:(id)sender {
    [self.bm attackWithMove:1];
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
