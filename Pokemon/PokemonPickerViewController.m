//
//  PokemonPickerViewController.m
//  Pokemon
//
//  Created by Michael Revell on 10/6/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "PokemonPickerViewController.h"

@interface PokemonPickerViewController ()

@property (strong, nonatomic) IBOutlet UIButton *squirtle;
@property (strong, nonatomic) IBOutlet UIButton *charmander;
@property (strong, nonatomic) IBOutlet UIButton *bulbasaur;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UIButton *choose;

@end

@implementation PokemonPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameLabel.hidden = true;
    self.nameField.hidden = true;
    self.choose.hidden = true;
    // Do any additional setup after loading the view from its nib.
}
-(void)pokemonSelected:(NSString *)type {
    self.pokemon = [[MAPokemon alloc] initWithType:type];
    self.nameField.text = type;
    self.nameLabel.hidden = false;
    self.nameField.hidden = false;
    self.choose.hidden = false;
    
}
- (IBAction)pickSquirtle:(id)sender {
    [self pokemonSelected:@"Squirtle"];
}
- (IBAction)pickCharmander:(id)sender {
    [self pokemonSelected:@"Charmander"];
}
- (IBAction)pickBulbasaur:(id)sender {
    [self pokemonSelected:@"Bulbasaur"];
}
- (IBAction)choose:(id)sender {
    self.pokemon.name = self.nameField.text;
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
