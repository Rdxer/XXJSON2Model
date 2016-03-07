//
//  XLazySettingsWindowController.m
//  XcodePluginDemo
//
//  Created by LXF on 16/1/3.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "XLazySettingsWindowController.h"

#import "XLazySettings.h"

@interface XLazySettingsWindowController ()
@property (weak) IBOutlet NSTextField *patternTextField;
@property (unsafe_unretained) IBOutlet NSTextView *lazyFormatString;

@end

@implementation XLazySettingsWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    [self dataToUI];
}

- (void)dataToUI{
    self.patternTextField.stringValue = [XLazySettings lazySettings].regularText;
    self.lazyFormatString.string = [[XLazySettings lazySettings]formatStringWithType:@"default"];
}

- (IBAction)clickResetButton:(id)sender {
    [[XLazySettings lazySettings]reset];
    [self dataToUI];
}


- (IBAction)clickApplyButton:(id)sender {
    if (self.patternTextField.stringValue.length <= 0) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText: @"请输入正则表达式.."];
        [alert runModal];
        return;
    }
    [XLazySettings lazySettings].regularText = self.patternTextField.stringValue;
//    [XLazySettings lazySettings].for;
}

-(void)dealloc{
    printW(@"释放完毕..");
}

@end
