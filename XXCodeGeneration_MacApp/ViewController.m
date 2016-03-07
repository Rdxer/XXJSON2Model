//
//  ViewController.m
//  XXCodeGeneration_MacApp
//
//  Created by LXF on 16/2/3.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "ViewController.h"

#import "OCClass.h"

@interface ViewController ()


@property (unsafe_unretained) IBOutlet NSTextView *jsonStringTextView;

@property (unsafe_unretained) IBOutlet NSTextView *resultTextView;


@end
@implementation ViewController

- (IBAction)generationOCModel:(id)sender {
    NSString *string = self.jsonStringTextView.string;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    if (dict == nil || ![dict isKindOfClass:[NSDictionary class]]) {
        [self showAlertWithMsg:@"json 字符串不合法"];
        return;
    }
    OCClass *occ = [OCClass classWithModelDict:dict];
    self.resultTextView.string = occ.makeInterfaceCode;
}
- (IBAction)generationAndCopyOCModel:(id)sender {
    [self generationOCModel:sender];
    [self copyOCModel:sender];
}
- (IBAction)copyOCModel:(id)sender {
    // 保存当前内容到粘贴板
    NSPasteboard *_pasteBoard = [NSPasteboard generalPasteboard];
    [_pasteBoard declareTypes:[NSArray arrayWithObject:NSStringPboardType] owner:nil];
    [_pasteBoard setString:self.resultTextView.string forType:NSStringPboardType];
}

- (void)showAlertWithMsg:(NSString *)msg{
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText: msg];
    [alert runModal];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
