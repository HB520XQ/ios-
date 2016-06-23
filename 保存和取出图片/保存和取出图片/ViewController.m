//
//  ViewController.m
//  保存和取出图片
//
//  Created by sswukang on 16/6/21.
//  Copyright © 2016年 jezong. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "SDWebNewImage.h"

@interface ViewController ()
/** <#name#> */
@property(nonatomic, weak) UIImageView *imagev;
@end

@implementation ViewController

//第一种方法
//- (void)viewDidLoad {
//	[super viewDidLoad];
//	NSURL *url = [NSURL URLWithString:@"http://e.hiphotos.baidu.com/image/pic/item/9825bc315c6034a852fd0096c81349540923768d.jpg"];
//	[[SDWebImageManager sharedManager] downloadImageWithURL:url options:kNilOptions progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//		
//	} completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
////		NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES).lastObject;
////		path = [path stringByAppendingPathComponent:@"image.png"];
////		[UIImagePNGRepresentation(image) writeToFile:path atomically:YES];
//		
//	}];
//	UIImageView *imagev = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//	[self.view addSubview:imagev];
//	self.imagev = imagev;
//}
//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//	UIImage *image = [SDWebNewImage SDWebNewImageWithURLString:@"http://e.hiphotos.baidu.com/image/pic/item/9825bc315c6034a852fd0096c81349540923768d.jpg"];
//	self.imagev.image = image;
//}

//第二种方法

- (void)viewDidLoad {
	[super viewDidLoad];
	NSURL *url = [NSURL URLWithString:@"http://e.hiphotos.baidu.com/image/pic/item/9825bc315c6034a852fd0096c81349540923768d.jpg"];
	[[SDWebImageManager sharedManager] downloadImageWithURL:url options:kNilOptions progress:^(NSInteger receivedSize, NSInteger expectedSize) {
		
	} completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
		NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES).lastObject;
		path = [path stringByAppendingPathComponent:@"image.png"];
		[UIImagePNGRepresentation(image) writeToFile:path atomically:YES];
		
	}];
	UIImageView *imagev = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
	[self.view addSubview:imagev];
	self.imagev = imagev;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES).lastObject;
	path = [path stringByAppendingPathComponent:@"image.png"];

	self.imagev.image = [UIImage imageWithContentsOfFile:path];
}

@end
