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
@property (strong, nonatomic) IBOutlet UILabel *computer_pp;
@property (weak, nonatomic) IBOutlet UIImageView *computer_image;
@property (weak, nonatomic) IBOutlet UILabel *user_hp;
@property (strong, nonatomic) IBOutlet UILabel *user_pp;
@property (weak, nonatomic) IBOutlet UIImageView *user_image;

@property (weak, nonatomic) IBOutlet UIButton *attack;
@property (strong, nonatomic) IBOutlet UIButton *attack2;
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
    
    [self.bm.trainer1.pokemon.pp_text addObserver:self forKeyPath:@"user_pp" options:NSKeyValueObservingOptionNew context:NULL];
    [self.bm.trainer2.pokemon.pp_text addObserver:self forKeyPath:@"computer_pp" options:NSKeyValueObservingOptionNew context:NULL];
    
    
    [self.bm addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:NULL];
    [self.bm addObserver:self forKeyPath:@"is_user_move" options:NSKeyValueObservingOptionNew context:NULL];
    [self.bm addObserver:self forKeyPath:@"game_over" options:NSKeyValueObservingOptionNew context:NULL];
    
    self.user_image.image = [UIImage imageNamed:@"Squirtle_back" ];
    self.computer_image.image = [UIImage imageNamed:@"Squirtle" ];
    
    self.user_hp.text = [NSString stringWithFormat:@"HP: %d/%d", self.bm.trainer1.pokemon.current_hp, self.bm.trainer1.pokemon.max_hp];
    self.user_pp.text = [NSString stringWithFormat:@"PP: %d/%d", self.bm.trainer1.pokemon.current_pp, self.bm.trainer1.pokemon.max_pp];
    
    
    self.computer_hp.text = [NSString stringWithFormat:@"HP: %d/%d", self.bm.trainer2.pokemon.current_hp, self.bm.trainer2.pokemon.max_hp];
    self.computer_pp.text = [NSString stringWithFormat:@"PP: %d/%d", self.bm.trainer2.pokemon.current_pp, self.bm.trainer2.pokemon.max_pp];
    self.status.numberOfLines = 4;
    
    
    [self.attack setTitle:[NSString stringWithFormat:@"%@ (%d)", [[self.bm.trainer1.pokemon.moves objectAtIndex:0] name], [[self.bm.trainer1.pokemon.moves objectAtIndex:0] pp]] forState:UIControlStateNormal];
    
    [self.attack2 setTitle:[NSString stringWithFormat:@"%@ (%d)", [[self.bm.trainer1.pokemon.moves objectAtIndex:1] name], [[self.bm.trainer1.pokemon.moves objectAtIndex:1] pp]] forState:UIControlStateNormal];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // NSLog(@"%@", keyPath);
    if([keyPath isEqualToString:@"user_hp"]) {
        self.user_hp.text = self.bm.user_hp;
        self.computer_pp.text = self.bm.trainer2.pokemon.pp_text;
    }
    else if([keyPath isEqualToString:@"computer_hp"]) {
        self.computer_hp.text = self.bm.computer_hp;
        self.user_pp.text = self.bm.trainer1.pokemon.pp_text;
    }
    else if([keyPath isEqualToString:@"user_pp"]) {
        // DEBUG: Why isn't this working?
        self.user_pp.text = self.bm.trainer1.pokemon.pp_text;
    }
    else if([keyPath isEqualToString:@"computer_pp"]) {
        // DEBUG: Why isn't this working?
        self.computer_pp.text = self.bm.trainer2.pokemon.pp_text;
    }
    else if([keyPath isEqualToString:@"status"]) {
        self.status.text = self.bm.status;
    }
    else if([keyPath isEqualToString:@"game_over"]) {
        if (self.bm.game_over == true) {
            [self.attack setEnabled:NO];
            [self.attack2 setEnabled:NO];
        } else {
            [self.attack setEnabled:YES];
            [self.attack2 setEnabled:YES];
        }
    }
    else if([keyPath isEqualToString:@"is_user_move"]) {
        if (self.bm.is_user_move == true) {
            [self.attack setEnabled:YES];
             [self.attack2 setEnabled:YES];
        } else {
            [self.attack setEnabled:NO];
            [self.attack2 setEnabled:NO];
        }
    }
    
}

- (IBAction)clickedAttack:(id)sender {
    if (self.bm.is_user_move && ! self.bm.game_over) {
        [self.bm attackWithMove:0];
    }
}
- (IBAction)clickedAttack2:(id)sender {
    // REFACTOR THIS INTO clickedAttack
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
