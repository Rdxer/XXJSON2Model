//
//  ViewController.m
//  XXCodeGeneration_MacApp
//
//  Created by LXF on 16/2/3.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "ViewController.h"

#import "OCClass.h"
#import "JavaClass.h"
#import "JSON2Model-Swift.h"

@interface ViewController ()


@property (unsafe_unretained) IBOutlet NSTextView *jsonStringTextView;

@property (unsafe_unretained) IBOutlet NSTextView *resultTextView;


@end
@implementation ViewController
- (IBAction)gSwiftCode:(id)sender {
    NSString *string = self.jsonStringTextView.string;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    if (dict == nil || ![dict isKindOfClass:[NSDictionary class]]) {
        [self showAlertWithMsg:@"json 字符串不合法"];
        return;
    }
    
    SwiftClass2 *sc = [SwiftClass2 model_InitWith:dict];
    
    self.resultTextView.string = sc.makeInterfaceCode;
}

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

- (IBAction)generationJAVAModel:(id)sender {
    NSString *string = self.jsonStringTextView.string;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    if (dict == nil || ![dict isKindOfClass:[NSDictionary class]]) {
        [self showAlertWithMsg:@"json 字符串不合法"];
        return;
    }
    JavaClass *javac = [JavaClass classWithModelDict:dict];
    self.resultTextView.string = javac.makeInterfaceCode;
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
