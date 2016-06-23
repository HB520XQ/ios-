//
//  SDWebNewImage.m
//  xiaorui
//
//  Created by sswukang on 16/6/21.
//  Copyright © 2016年 huarui. All rights reserved.
//

#import "SDWebNewImage.h"

#import "UIImageView+WebCache.h"

@implementation SDWebNewImage
+ (UIImage *)SDWebNewImageWithURLString:(NSString *)urlString
{
	NSData *imageData = nil;
	BOOL isExit = [[SDWebImageManager sharedManager] diskImageExistsForURL:[NSURL URLWithString:urlString]];
	if (isExit) {
		NSString *cacheImageKey = [[SDWebImageManager sharedManager] cacheKeyForURL:[NSURL URLWithString:urlString]];
		if (cacheImageKey.length) {
			NSString *cacheImagePath = [[SDImageCache sharedImageCache] defaultCachePathForKey:cacheImageKey];
			if (cacheImagePath.length) {
				imageData = [NSData dataWithContentsOfFile:cacheImagePath];
			}
		}
	}
	if (!imageData) {
		imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
	}
	
	UIImage *image = [UIImage imageWithData:imageData];
	
	return image;
}
@end
