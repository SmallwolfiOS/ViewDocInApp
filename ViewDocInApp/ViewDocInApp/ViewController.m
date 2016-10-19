//
//  ViewController.m
//  ViewDocInApp
//
//  Created by 马海平 on 2016/10/19.
//  Copyright © 2016年 马海平. All rights reserved.
//

#import "ViewController.h"
#import <QuickLook/QuickLook.h>


@interface ViewController ()<UIDocumentInteractionControllerDelegate,UIWebViewDelegate,QLPreviewControllerDataSource>
@property (nonatomic, strong) UIDocumentInteractionController *documentInteractionController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [self readDocWithDucument];
//    [self performSelectorOnMainThread:@selector(readDocWithDucument) withObject:nil waitUntilDone:NO];
        [self performSelectorOnMainThread:@selector(quickLook) withObject:nil waitUntilDone:NO];
//        [self readDocfile];
//        [self  createImageView];
    
}
- (void)readDocWithDucument{
    NSString * ducumentLocation = [[NSBundle mainBundle]pathForResource:@"用户模块接口" ofType:@"docx"];
    NSURL *url = [NSURL fileURLWithPath:ducumentLocation];
    _documentInteractionController= [UIDocumentInteractionController interactionControllerWithURL:url];
    _documentInteractionController.delegate = self;
    
    //    [_documentInteractionController presentPreviewAnimated:YES];
    
    [_documentInteractionController presentOptionsMenuFromRect:CGRectZero inView:self.view animated:YES];
}
- (void)readDocfile{
    NSString * ducumentLocation = [[NSBundle mainBundle]pathForResource:@"用户模块接口" ofType:@"docx"];
    NSURL *url = [NSURL fileURLWithPath:ducumentLocation];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    webView.delegate = self;
    webView.multipleTouchEnabled = YES;
    webView.scalesPageToFit = YES;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
}
- (void)createImageView{
    
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"学期总结" ofType:@"png"];
    UIImage * image = [UIImage imageWithContentsOfFile:filePath];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.image = image;
    
    [self.view addSubview:imageView];
}

- (void)quickLook{
    self.view.backgroundColor = [UIColor grayColor];
    QLPreviewController * preVC = [[QLPreviewController alloc]init];
    preVC.dataSource = self;
    [self presentViewController:preVC animated:YES completion:nil];
    
}
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller{
    return 1;
}
- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index{
    NSString * ducumentLocation = [[NSBundle mainBundle]pathForResource:@"用户模块接口" ofType:@"docx"];
    NSURL *url = [NSURL fileURLWithPath:ducumentLocation];
    return  url;
}


#pragma mark - UIDocumentInteractionController 代理方法
- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller{
    return self;
}

- (UIView *)documentInteractionControllerViewForPreview:(UIDocumentInteractionController *)controller{
    return self.view;
}

- (CGRect)documentInteractionControllerRectForPreview:(UIDocumentInteractionController *)controller{
    return self.view.bounds;
}













- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
