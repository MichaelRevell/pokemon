//
//  BattleViewController.m
//  Pokemon
//
//  Created by Michael Revell on 10/4/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "BattleViewController.h"
#import "MABattleManager.h"
#import "MATrainer.h"
#import "MAPokemonMove.h"
#import "DialogViewController.h"

@interface BattleViewController ()

@property (strong, nonatomic) UIViewController *nextViewController;

@property (weak, nonatomic) IBOutlet UIButton *bitches;
@property (weak, nonatomic) IBOutlet UILabel *computer_hp;
@property (strong, nonatomic) IBOutlet UILabel *computer_pp;
@property (weak, nonatomic) IBOutlet UIImageView *computer_image;
@property (weak, nonatomic) IBOutlet UILabel *user_hp;
@property (strong, nonatomic) IBOutlet UILabel *user_pp;
@property (weak, nonatomic) IBOutlet UIImageView *user_image;

@property (weak, nonatomic) IBOutlet UIButton *attack;
@property (strong, nonatomic) IBOutlet UIButton *attack2;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (strong, nonatomic) IBOutlet UIButton *continueButton;


@end

@implementation BattleViewController

@synthesize nextViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MATrainer *trainer1 = self.user;
    NSArray *pokemen = @[@"Squirtle", @"Charmander", @"Bulbasaur"];
    MATrainer *trainer2 = [[MATrainer alloc] initWithPokemon:[[MAPokemon alloc] initWithType:pokemen[arc4random() % 3]]];
    
    self.bm = [[MABattleManager alloc] initWithTrainer:trainer1 otherTrainer:trainer2];
    [self.bm addObserver:self forKeyPath:@"user_hp" options:NSKeyValueObservingOptionNew context:NULL];
    [self.bm addObserver:self forKeyPath:@"computer_hp" options:NSKeyValueObservingOptionNew context:NULL];
    
    [self.bm.trainer1.pokemon addObserver:self forKeyPath:@"pp_text" options:NSKeyValueObservingOptionNew context:NULL];
    [self.bm.trainer2.pokemon addObserver:self forKeyPath:@"pp_text" options:NSKeyValueObservingOptionNew context:NULL];
    
    [self.bm addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:NULL];
    [self.bm addObserver:self forKeyPath:@"is_user_move" options:NSKeyValueObservingOptionNew context:NULL];
    [self.bm addObserver:self forKeyPath:@"game_over" options:NSKeyValueObservingOptionNew context:NULL];
    
    self.user_image.image = [UIImage imageNamed:self.bm.trainer1.pokemon.backSpritePath];
    self.computer_image.image = [UIImage imageNamed:self.bm.trainer2.pokemon.frontSpritePath];
    
    self.user_hp.text = [NSString stringWithFormat:@"HP: %d/%d", self.bm.trainer1.pokemon.current_hp, self.bm.trainer1.pokemon.max_hp];
    self.user_pp.text = [NSString stringWithFormat:@"PP: %d/%d", self.bm.trainer1.pokemon.current_pp, self.bm.trainer1.pokemon.max_pp];
    
    
    self.computer_hp.text = [NSString stringWithFormat:@"HP: %d/%d", self.bm.trainer2.pokemon.current_hp, self.bm.trainer2.pokemon.max_hp];
    self.computer_pp.text = [NSString stringWithFormat:@"PP: %d/%d", self.bm.trainer2.pokemon.current_pp, self.bm.trainer2.pokemon.max_pp];
    self.status.numberOfLines = 4;
    self.continueButton.hidden = true;
    
    
    [self.attack setTitle:[NSString stringWithFormat:@"%@ (%d)", [[self.bm.trainer1.pokemon.moves objectAtIndex:0] name], [[self.bm.trainer1.pokemon.moves objectAtIndex:0] pp]] forState:UIControlStateNormal];
    
    [self.attack2 setTitle:[NSString stringWithFormat:@"%@ (%d)", [[self.bm.trainer1.pokemon.moves objectAtIndex:1] name], [[self.bm.trainer1.pokemon.moves objectAtIndex:1] pp]] forState:UIControlStateNormal];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"shit changed %@", keyPath);
    if([keyPath isEqualToString:@"user_hp"]) {
        self.user_hp.text = self.bm.user_hp;
//        self.computer_pp.text = self.bm.trainer2.pokemon.pp_text;
    }
    else if([keyPath isEqualToString:@"computer_hp"]) {
        self.computer_hp.text = self.bm.computer_hp;
//        self.user_pp.text = self.bm.trainer1.pokemon.pp_text;
    }
    else if([keyPath isEqualToString:@"pp_text"]) {
        NSLog(@"balls %@", object);
        // DEBUG: Why isn't this working?
        self.user_pp.text = self.bm.trainer1.pokemon.pp_text;
        self.computer_pp.text = self.bm.trainer2.pokemon.pp_text; // why i must do?
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
            self.status.hidden = true;
            self.continueButton.hidden = false;
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
- (IBAction)bitches:(id)sender {
    self.nextViewController = [[DialogViewController alloc] initWithNibName:@"DialogViewController" bundle:nil];
}
- (IBAction)continuePressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
