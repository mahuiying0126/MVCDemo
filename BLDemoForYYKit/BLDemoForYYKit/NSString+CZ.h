//
//  NSString+CZ.h
//
//  Created by Vincent_Guo on 14-6-28.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CZ)


/** 返回分与秒的字符串 如:01:60*/
+(NSString *)getMinuteSecondWithSecond:(NSTimeInterval)time;

/** * 读取文件 */
+ (NSString *)readFromCachesDirectory:(NSString*)filename;

/** * 删除空格 */
+ (NSString *)deletSpaceInString:(NSString *)text;

/** * 返回用户名 */
+ (NSString *)userNameString;


/** * 通过字符数, 获取宽高, 传入字号font, 一个最大宽 */
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

/** * 通过字符数, 获取宽 */
- (CGSize)sizeWithFont:(UIFont *)font;

/** * 解析HTML */
+ (NSString *)flattenHTML:(NSString *)html trimWhiteSpace:(BOOL)trim;


/**  * 通过. 截取字符串 */
+ (NSString *)cutOutString:(NSString *)string Char:(NSString *)chars;

/**  * 数字格式， 超过1k  进万 */
+ (NSString *)setCount:(int)count title:(NSString *)title;

+ (NSString *)createTime:(NSString *)createTime;


/** md5 一般加密 */
+ (NSString *)MD5String:(NSString *)string;
/** * 牛逼加密 */
+ (NSString *)MD5StringNB:(NSString *)string;

/** * 随机生成字符串 */
+ (NSString *)generateRandomString;



/** * 判断邮箱格式 */
+ (BOOL)CheckInputEmail:(NSString *)email;

/** * 密码 6 ~ 16位 */
+ (BOOL)CheckInputPassword:(NSString *)text;

/** * 英文数字. 下划线, 横线  */
+ (BOOL)checkUserNameWithChar:(NSString *)text;

/** *  手机号码验证 MODIFIED BY HELENSONG */
+ (BOOL)mobileNumber:(NSString *)mobileNum;


+ (NSString *)cutOutStringWithPeriod:(NSString *)string;


@end
