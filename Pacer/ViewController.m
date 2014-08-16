//
//  ViewController.m
//  Pacer
//
//  Created by Alex Robinson on 1/17/14.
//  Copyright (c) 2014 Alex Robinson. All rights reserved.
//

#import "ViewController.h"
#import "ADVAnimationController.h"
#import "DropAnimationController.h"

@interface ViewController ()
{
    int variableCounter;
    BOOL willResetVariables;
//    UIToolbar *inputAccessoryToolbar;
}

//@property (strong, nonatomic) NSNumber *distance;
//@property (strong, nonatomic) NSNumber *duration;
//@property (strong, nonatomic) NSNumber *rate;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) UITextField *activeField;
//@property (strong, nonatomic) UIToolbar *inputAccessoryToolbar;
@property int variableCounter;
@property BOOL willResetVariables;

@property (nonatomic, strong) id<ADVAnimationController> animationController;
@property (nonatomic, strong) NSNumber *durationHour, *durationMin, *rateMin, *rateSec, *speed;
@end



@implementation ViewController

@synthesize unitOfLengthString;
@synthesize variableCounter = _variableCounter;
@synthesize willResetVariables = _willResetVariables;
//@synthesize inputAccessoryToolbar = _inputAccessoryToolbar;
@synthesize distance = _distance;
@synthesize duration = _duration;
@synthesize rate = _rate;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _paceValues = [[PaceValues alloc] init];
    
    // Register for PaceValues changes
    [_paceValues addObserver:self
                  forKeyPath:@"distance"
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:NULL];
    [_paceValues addObserver:self
                  forKeyPath:@"durationHour"
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:NULL];
    [_paceValues addObserver:self
                  forKeyPath:@"durationMin"
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:NULL];
    [_paceValues addObserver:self
                  forKeyPath:@"durationSec"
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:NULL];
    [_paceValues addObserver:self
                  forKeyPath:@"rateMin"
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:NULL];
    [_paceValues addObserver:self
                  forKeyPath:@"rateSec"
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:NULL];
    [_paceValues addObserver:self
                  forKeyPath:@"speed"
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:NULL];
    
    _variableCounter = 0;
    _willResetVariables = NO;
    
    
    // Register for notifications
    [self registerForKeyboardNotifications];
    
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    [self.view addGestureRecognizer:singleTap];
    
    
    //Default values
    self.coordinates.text = @"x:0, y:0";
    
    // UI element default values
    [_distanceButton setTitle:@"this distance" forState:UIControlStateNormal];
    unitOfLengthString = @"";
    
    
    //Set default values for distance, duration, and rate
//    _distance = [NSNumber numberWithDouble:0.0];
//    _duration = [NSNumber numberWithDouble:0.0];
//    _rate = [NSNumber numberWithDouble:0.0];
    
    
    //Modify the look of the textfields
    _distanceTextField.backgroundColor = [UIColor colorWithRed:250.0f/255.0f green:235.0f/255.0f blue:215.0f/255.0f alpha:0.5f];
    _durationTextField.backgroundColor = [UIColor colorWithRed:250.0f/255.0f green:235.0f/255.0f blue:215.0f/255.0f alpha:0.5f];
    _rateTextField.backgroundColor = [UIColor colorWithRed:250.0f/255.0f green:235.0f/255.0f blue:215.0f/255.0f alpha:0.5f];
    
    
      //Add custom button to textfields
//    _distanceTextField.rightView = [self addButtonToUITextfield];
//    _distanceTextField.rightViewMode = UITextFieldViewModeAlways;
    
    
//    //Create accessory toolbar above the keyboard
//    _inputAccessoryToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, 44.0)];
//    _inputAccessoryToolbar.items = [NSArray arrayWithObjects:
//                                    [[UIBarButtonItem alloc] initWithTitle:@"<" style:UIBarButtonItemStyleBordered target:self action:@selector(previousTextField:)],
//                                    [[UIBarButtonItem alloc] initWithTitle:@"＞" style:UIBarButtonItemStyleBordered target:self action:@selector(nextTextField:)],
//                                    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],
//                                    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(textFieldShouldReturn:)], nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"distance"]) {
        _distance = [change objectForKey:NSKeyValueChangeNewKey];
        [_distanceButton setTitle:[NSString stringWithFormat:@"%@ %@", _distance, self.unitOfLengthString] forState:UIControlStateNormal];
    }
    else if ([keyPath isEqualToString:@""])
    {
        
    }
}

-(void)dealloc
{
    [_paceValues removeObserver:self forKeyPath:@"distance"];
    [_paceValues removeObserver:self forKeyPath:@"durationHour"];
    [_paceValues removeObserver:self forKeyPath:@"durationMin"];
    [_paceValues removeObserver:self forKeyPath:@"durationSec"];
    [_paceValues removeObserver:self forKeyPath:@"rateMin"];
    [_paceValues removeObserver:self forKeyPath:@"rateSec"];
    [_paceValues removeObserver:self forKeyPath:@"speed"];
}

-(void)viewDidLayoutSubviews
{
    // If distance is not empty, reset the button text
//    if ([_distance doubleValue] > 0.0f) {
//        [_distanceButton setTitle:[NSString stringWithFormat:@"%@ %@", _distance, unitOfLengthString] forState:UIControlStateNormal];
//    }
//    // Else reset to its default value
//    else
//    {
//        [_distanceButton setTitle:@"this distance" forState:UIControlStateNormal];
//    }
    
    if ([_rate doubleValue] > 0.0f) {
        [_rateButton setTitle:[NSString stringWithFormat:@"%@", _rate] forState:UIControlStateNormal];
    }
    else
    {
        [_rateButton setTitle:@"this speed" forState:UIControlStateNormal];
    }
    
    if ([_duration doubleValue] > 0.0f) {
        [_durationButton setTitle:[NSString stringWithFormat:@"%@", _duration] forState:UIControlStateNormal];
    }
    else
    {
        [_durationButton setTitle:@"this duration" forState:UIControlStateNormal];
    }
    
    [super viewDidLayoutSubviews];
    [self.view layoutIfNeeded];
    [self.scrollView layoutIfNeeded];
    self.scrollView.contentSize = self.contentView.bounds.size;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
    //Get touch point
    CGPoint touchPoint = [gesture locationInView:self.view];
    self.coordinates.text = [NSString stringWithFormat:@"x: %f, y: %f", touchPoint.x, touchPoint.y];
    
    //Hide keyboard
    [self.view endEditing:YES];
}


-(void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyboardWasShown:(NSNotification *)aNotification
{
    NSDictionary *info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
    
    //If active text field is hidden by keyboard, scroll it so it's visible
    //Your app might not need or want this behavior
    CGRect aRect = self.view.frame;
    aRect.size.height -=kbSize.height;
    if(!CGRectContainsPoint(aRect, _activeField.frame.origin))
    {
        [_scrollView scrollRectToVisible:_activeField.frame animated:YES];
    }
}

-(void)keyboardWillBeHidden:(NSNotification *)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
}

//Customize UITextFields
//-(UIButton *)addButtonToUITextfield
//{
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 53, 21)];
//    [button setTitle:@"Race" forState:UIControlStateNormal];
//    [button setBackgroundColor:[UIColor colorWithRed:217.0f/255.0f green:73.0f/255.0f blue:0.0f/255.0f alpha:1.0f]];
//    button.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
////    [button addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventTouchUpInside];
//    
//    return button;
//}

//Events
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    double number = [[f numberFromString:textField.text] doubleValue];
    
    if (!number) {
        NSLog(@"Not a number");
        textField.text = @"";
    }
    else
    {
        switch (textField.tag) {
            case 0:
                _distance = [NSNumber numberWithDouble:number];
                NSLog(@"%@", _distanceTextField.text);
                break;
            case 1:
                _duration = [NSNumber numberWithDouble:number];
                NSLog(@"%@", _durationTextField.text);
                break;
            case 2:
                _rate = [NSNumber numberWithDouble:number];
                NSLog(@"%@", _rateTextField.text);
                break;
            default:
                break;
        }
        _variableCounter += 1;
        if (_variableCounter == 2) {
            [self calculateFormula];
        }
    }
    
//    _testLabel.text = [NSString stringWithFormat:@"Distance: %.2f, Duration: %.2f, Rate: %.2f, %d", _distance, _duration, _rate, _variableCounter];
    
    _activeField = nil;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    _activeField = textField;
//    _activeField.inputAccessoryView = _inputAccessoryToolbar;
    if (_willResetVariables) {
        [self resetPacerVariables];
    }
}

-(void)resetPacerVariables
{
    /*
    distance = 0;
    rate = 0;
    duration = 0;
    
    _willResetVariables = NO;
    _variableCounter = 0;
     */
}

-(void)calculateFormula
{
    _willResetVariables = YES;
    
    if (_distance && _duration)
    {
        _rate = [NSNumber numberWithDouble:[_distance doubleValue]/[_duration doubleValue]];
        _rateTextField.text = [NSString stringWithFormat:@"%@", _rate];
    }
    else if (_distance && _rate)
    {
        _duration = [NSNumber numberWithDouble:[_distance doubleValue]/[_rate doubleValue]];
        _durationTextField.text = [NSString stringWithFormat:@"%@", _duration];
    }
    else if (_duration && _rate)
    {
        _distance = [NSNumber numberWithDouble:[_duration doubleValue] * [_rate doubleValue]];
        _distanceTextField.text = [NSString stringWithFormat:@"%@", _distance];
    }
    NSLog(@"Calculate formula");
}

- (IBAction)gotoDistanceView:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    DistanceViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"DistanceViewController"];
    
    //Set controller as the protocol delegate!!
    [controller setDelegate:self];
    
    self.animationController = [[DropAnimationController alloc] init];
    
    controller.transitioningDelegate  = self;
    [controller setModalPresentationStyle:UIModalPresentationCustom];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)gotoDurationView:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    DurationViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"DurationViewController"];
    
    //Set controller as the protocol delegate!!
    [controller setDelegate:self];
    
    self.animationController = [[DropAnimationController alloc] init];
    
    controller.transitioningDelegate  = self;
    [controller setModalPresentationStyle:UIModalPresentationCustom];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)gotoRateView:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    RateViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"RateViewController"];
    
    //Set controller as the protocol delegate!!
    [controller setDelegate:self];
    
    self.animationController = [[DropAnimationController alloc] init];
    
    controller.transitioningDelegate  = self;
    [controller setModalPresentationStyle:UIModalPresentationCustom];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)rateSegmentChanged:(UISegmentedControl *)sender {
    switch (_paceSpeed.selectedSegmentIndex) {
        case 0:
            _paceView.hidden = NO;
            _speedView.hidden = YES;
            
//            _speedViewController.speedView.hidden = YES;
            break;
        case 1:
            _paceView.hidden = YES;
            _speedView.hidden = NO;
//            _speedViewController.speedView.hidden = NO;
        default:
            break;
    }
}

// Is there enough information available to calculate?
-(BOOL)canDoCalculationWith:(NSNumber *)thisVariableCount
{
    if ([thisVariableCount intValue] == 2)
    {
        return YES;
    }
    return NO;
}

#pragma mark -
#pragma mark Protocols
#pragma mark passDurationData Protocol Methods
-(void)setDurationValuesHour:(NSNumber *)durationHour minutes:(NSNumber *)durationMinutes seconds:(NSNumber *)durationSeconds
{
//    _paceValues.durationHour = durationHour;
//    _paceValues.durationMin = durationMinutes;
//    _paceValues.durationSec = durationSeconds;
//    _paceValues.durationTotalSeconds = [_paceValues convertToSecondsUsingHours:_paceValues.durationHour
//                                                                       minutes:_paceValues.durationMin
//                                                                       seconds:_paceValues.durationSec];
//    _duration = _paceValues.durationTotalSeconds;
}


#pragma mark passRateData Protocol Methods
-(void)setSpeedValue:(NSNumber *)speedData
{
    if (willResetVariables) {
        [self resetPacerVariables];
    }
    
    _paceValues.speed = speedData;
    _paceValues.distanceUnitPerSecond = [_paceValues convertDistancePerHourIntoPerSecond:speedData];
    _rate = _paceValues.distanceUnitPerSecond;
    
    _variableCounter += 1;
    if ([self canDoCalculationWith:[NSNumber numberWithInteger:_variableCounter]]) {
        [self calculateFormula];
    }
    //Todo
}

-(void)setPaceValuesMinutes:(NSNumber *)minuteData seconds:(NSNumber *)secondData
{
    _paceValues.rateMin = minuteData;
    _paceValues.rateSec = secondData;
    _paceValues.secondsPerDistanceUnit = [_paceValues convertToSecondsUsingHours:@(0) minutes:minuteData seconds:secondData];
    _rate = _paceValues.secondsPerDistanceUnit;
}


#pragma mark passDistanceValues Protocol Methods
-(void)setUnitOfLength:(NSString *)unitOfLength
{
    _paceValues.unitOfLength = unitOfLength;
    unitOfLengthString = unitOfLength;
    NSLog(@"%@", unitOfLengthString);
//    [_distanceButton setTitle:[NSString stringWithFormat:@"%@%@", self.distance, unitOfLength] forState:UIControlStateNormal];
}

-(void)setDistanceValue:(NSNumber *)distanceValue
{
    if (willResetVariables) {
        [self resetPacerVariables];
    }
    _paceValues.distance = distanceValue;
//    _distance = _paceValues.distance;
    _variableCounter += 1;
    if ([self canDoCalculationWith:[NSNumber numberWithInteger:_variableCounter]]) {
        [self calculateFormula];
    }
    NSLog(@"%@", _distance);
}



#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    self.animationController.isPresenting = YES;
    
    return self.animationController;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.animationController.isPresenting = NO;
    
    return self.animationController;
}



@end