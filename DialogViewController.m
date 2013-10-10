//
//  DialogViewController.m
//  Pokemon
//
//  Created by Michael Revell on 10/6/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "DialogViewController.h"
#import "InputViewController.h"
#import "BattleViewController.h"
#import "PokemonPickerViewController.h"
#import "MATrainer.h"


@interface DialogViewController ()
@property (strong, nonatomic) UIViewController *nextViewController;
@property (strong, nonatomic) IBOutlet UIImageView *computer;
@property (strong, nonatomic) IBOutlet UILabel *dialog;
@property (strong, nonatomic) InputViewController *inputViewController;
@property (strong, nonatomic) PokemonPickerViewController *pokemonPickerViewController;
@property (strong, nonatomic) BattleViewController *battleViewController;
@property (strong, nonatomic) MATrainer *user;
@property int step;
@property NSString *userName;
@property (strong, nonatomic) IBOutlet UIButton *next;

@end

@implementation DialogViewController

@synthesize nextViewController;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.step = 1;
    self.inputViewController = [[InputViewController alloc] initWithNibName:@"InputViewController" bundle:nil];
    self.pokemonPickerViewController = [[PokemonPickerViewController alloc] initWithNibName:@"PokemonPickerViewController" bundle:nil];
    self.battleViewController = [[BattleViewController alloc] initWithNibName:@"BattleView" bundle:nil] ;
    
    self.computer.image = [UIImage imageNamed:@"pers6.jpg" ];
    self.dialog.numberOfLines = 4;
    self.dialog.text = @"Welcome, young trainer. Don't be shy. What is your name?";
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (self.step == 2) {
        if (self.inputViewController.textValue != nil){
            self.userName = self.inputViewController.textValue;
            self.dialog.text = [NSString stringWithFormat:@"Now it's time to Pick your Pokemon, %@", self.userName];
        }
    }
    else if (self.step == 3) {
        self.dialog.text = [NSString stringWithFormat:@"Prepare to Die, %@!", self.userName];
        self.user = [[MATrainer alloc] initWithPokemon:self.pokemonPickerViewController.pokemon];
        self.user.name = self.userName;
        self.battleViewController.user = self.user;
    }
    else if (self.step == 4) {
        self.next.hidden = true;
        if (self.battleViewController.bm.trainer1.allPokemonDead) {
            self.dialog.text = @"You've been defeated, you little bitch! Don't fuck with me again.";
        } else if (self.battleViewController.bm.trainer2.allPokemonDead){
            self.dialog.text = @"Ah! How could you possibly defeat me???";
        }
        else {
            self.dialog.text = @"Huh??";
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)next:(id)sender {
    
    //[self.navigationController pushViewController:intputViewController animated:YES];
    //self.nextViewController = self.inputViewController;
    if (self.step ==1) {
        [self presentViewController:self.inputViewController animated:YES completion:nil];
        self.dialog.text = @"";
        NSLog(@"bitch");
        self.step++;
    } else if (self.step == 2) {
        [self presentViewController:self.pokemonPickerViewController animated:YES completion:nil];
        self.dialog.text = @"";
        self.step++;
    }
    else if (self.step == 3) {
        [self presentViewController:self.battleViewController animated:NO completion:nil];
        self.dialog.text = @"";
        self.step++;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

@end
