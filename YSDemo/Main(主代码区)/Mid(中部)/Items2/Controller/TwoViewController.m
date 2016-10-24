//
//  TwoViewController.m
//  YSDemo
//
//  Created by huweiya on 16/8/19.
//  Copyright © 2016年 5i5j. All rights reserved.
//

#import "TwoViewController.h"
#import "ThreeViewController.h"
@interface TwoViewController ()
@property (nonatomic, strong) UILabel *firstLabel;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

//    typedef NS_ENUM(NSInteger, UIReturnKeyType) {
//        UIReturnKeyDefault,
//        UIReturnKeyGo,
//        UIReturnKeyGoogle,
//        UIReturnKeyJoin,
//        UIReturnKeyNext,
//        UIReturnKeyRoute,
//        UIReturnKeySearch,
//        UIReturnKeySend,
//        UIReturnKeyYahoo,
//        UIReturnKeyDone,
//        UIReturnKeyEmergencyCall,
//        UIReturnKeyContinue NS_ENUM_AVAILABLE_IOS(9_0),
//    };

    
    UITextField *textF = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, YSWidth, 44)];
    
    textF.backgroundColor = [UIColor yellowColor];
    
    textF.returnKeyType = UIReturnKeyGo;
    
    
//    typedef NS_ENUM(NSInteger, UIKeyboardType) {
//        UIKeyboardTypeDefault,                // Default type for the current input method.
//        UIKeyboardTypeASCIICapable,           // Displays a keyboard which can enter ASCII characters
//        UIKeyboardTypeNumbersAndPunctuation,  // Numbers and assorted punctuation.
//        UIKeyboardTypeURL,                    // A type optimized for URL entry (shows . / .com prominently).
//        UIKeyboardTypeNumberPad,              // A number pad with locale-appropriate digits (0-9, ۰-۹, ०-९, etc.). Suitable for PIN entry.
//        UIKeyboardTypePhonePad,               // A phone pad (1-9, *, 0, #, with letters under the numbers).
//        UIKeyboardTypeNamePhonePad,           // A type optimized for entering a person's name or phone number.
//        UIKeyboardTypeEmailAddress,           // A type optimized for multiple email address entry (shows space @ . prominently).
//        UIKeyboardTypeDecimalPad NS_ENUM_AVAILABLE_IOS(4_1),   // A number pad with a decimal point.
//        UIKeyboardTypeTwitter NS_ENUM_AVAILABLE_IOS(5_0),      // A type optimized for twitter text entry (easy access to @ #)
//        UIKeyboardTypeWebSearch NS_ENUM_AVAILABLE_IOS(7_0),    // A default keyboard type with URL-oriented addition (shows space . prominently).
//        UIKeyboardTypeASCIICapableNumberPad NS_ENUM_AVAILABLE_IOS(10_0), // A number pad (0-9) that will always be ASCII digits.
//        
//        UIKeyboardTypeAlphabet = UIKeyboardTypeASCIICapable, // Deprecated
//        
//    };

    
    textF.keyboardType = UIKeyboardTypeDecimalPad;
    
    [self.view addSubview:textF];
}



- (UILabel *)firstLabel
{
    if (!_firstLabel) {
        
        _firstLabel = [[UILabel alloc] init];
        
        _firstLabel.backgroundColor = [UIColor yellowColor];
        
        
        _firstLabel.numberOfLines = 0;
        
        [_firstLabel sizeToFit];
        
    }
    
    return _firstLabel;
}


@end
