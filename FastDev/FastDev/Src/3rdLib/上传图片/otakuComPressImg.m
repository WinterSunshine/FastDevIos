//
//  otakuComPressImg.m
//  otakuLife
//
//  Created by Jostr on 14-2-25.
//  Copyright (c) 2014年 ZhangJunjee. All rights reserved.
//

#import "otakuComPressImg.h"

@implementation otakuComPressImg


+(UIImage *)imageWithImageSimple:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}
@end
