//
//  DialogViewController.m
//  Pokemon
//
//  Created by Michael Revell on 10/6/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "DialogViewController.h"
#import "InputViewController.h"

@interface DialogViewController ()
@property (strong, nonatomic) UIViewController *nextViewController;
@property (strong, nonatomic) IBOutlet UIImageView *computer;
@property (strong, nonatomic) IBOutlet UILabel *dialog;

@end

@implementation DialogViewController

@synthesize nextViewController;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.computer.image = [UIImage imageNamed:@"pers6.jpg" ];
    self.dialog.numberOfLines = 4;
    self.dialog.text = @"Bitches be tellin' me that you ain't got no name. What's up with that shit?";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)next:(id)sender {
    InputViewController *intputViewController = [[InputViewController alloc] initWithNibName:@"InputViewController" bundle:nil];
    
    //[self.navigationController pushViewController:intputViewController animated:YES];
    self.nextViewController = intputViewController;
    NSLog(@"bitch");
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
