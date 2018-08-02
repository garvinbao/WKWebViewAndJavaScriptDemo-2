//
//  ViewController.m
//  WKWebViewAndJavaScriptDemo
//
//  Created by Garvin on 2018/7/26.
//  Copyright © 2018年 Garvin. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController () <WKScriptMessageHandler> {
    WKWebView *_wkWeb;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self loadUI];
}

- (void)loadUI {
    WKUserContentController *_userContentController = [[WKUserContentController alloc] init];
    
    
    NSString *baiduButtonId = @"index-bn";
    NSString *baiduMessage = @"myFun";
    NSString *scriptStr = [NSString stringWithFormat:@"function fun(){window.webkit.messageHandlers.%@.postMessage(null);}(function(){var btn=document.getElementById(\"%@\");btn.addEventListener('click',fun,false);}());", baiduMessage, baiduButtonId];
    WKUserScript *userScript = [[WKUserScript alloc] initWithSource:scriptStr injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    [_userContentController addUserScript:userScript];
    
    [_userContentController addScriptMessageHandler:self name:baiduMessage];
    
    WKWebViewConfiguration *_configuration = [[WKWebViewConfiguration alloc] init];
    _configuration.userContentController = _userContentController;
    
    _wkWeb = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds configuration:_configuration];
    _wkWeb.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_wkWeb];
    
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_wkWeb loadRequest:request];
}

#pragma mark --- WKScriptMessageHandler ---
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"message.name:%@", message.name);
    NSLog(@"message.body:%@", message.body);
    
    // 根据name做想做的操作
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
