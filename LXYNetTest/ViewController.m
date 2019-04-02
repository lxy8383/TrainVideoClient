//
//  ViewController.m
//  LXYNetTest
//
//  Created by liuxy on 2019/3/26.
//  Copyright © 2019年 liuxy. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 50, 80, 40);
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(netAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)netAction:(UIButton *)sender
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/javascript",@"text/plain",@"text/html", nil];
    NSString *URLStr = @"http://localhost:9090/";
    [manager GET:URLStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"这里打印请求成功要做的事");
         
    }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
        
        
         NSLog(@"%@",error);  //这里打印错误信息
         
    }];

}
@end
