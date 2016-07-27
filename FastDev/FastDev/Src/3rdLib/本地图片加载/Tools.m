//
//  Tools.m
//  Common
//
//  Created by jin xing on 14-5-12.
//  Copyright (c) 2014年 jin xing. All rights reserved.
//

#import "Tools.h"

@implementation Tools
+(UIImage *)imagesNamedFromCustomBundle:(NSString *)imgName bundleName:(NSString *)bundleName
{
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:bundleName];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    NSString *img_path = [bundle pathForResource:imgName ofType:@"png"];
    return [UIImage imageWithContentsOfFile:img_path];
}
@end
