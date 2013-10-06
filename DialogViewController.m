//
//  DialogViewController.m
//  Pokemon
//
//  Created by Michael Revell on 10/6/13.
//  Copyright (c) 2013 Michael Revell. All rights reserved.
//

#import "DialogViewController.h"

@interface DialogViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *computer;
@property (strong, nonatomic) IBOutlet UILabel *dialog;

@end

@implementation DialogViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
