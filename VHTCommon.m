                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         //
//  VHTCommon.h
//  Vhortext
//
//  Created by Piyali Tarafder on 27/07/15.
//  Copyright (c) 2015 Piyali_iOS. All rights reserved.
//

#import "VHTCommon.h"
#import <SDWebImage/UIImageView+WebCache.h>

NSString *const kUIActivityIndicatorView = @"UIActivityIndicatorView";
NSString *const kTJActivityIndicator = @"TJActivityIndicator";
NSString *const kTJCircularSpinner = @"TJCircularSpinner";
NSString *const kTJBeachBallSpinner = @"TJBeachBallSpinner";

#define allTrim( object ) [object stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] ]

@implementation VHTCommon

+ (VHTCommon *)sharedInstance
{
    static VHTCommon *sharedInstance_ = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        sharedInstance_ = [[VHTCommon alloc] init];
        sharedInstance_.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        sharedInstance_.user = [[VHTUser alloc] init];
    });
    return sharedInstance_;
    
}

-(id)init
{
    self = [super init];
    if (self) {
        _dicCRToastOptions = [[NSMutableDictionary alloc] initWithDictionary: @{
                                                                                    kCRToastTextAlignmentKey            : @(NSTextAlignmentLeft),
                                                                                    kCRToastBackgroundColorKey          : [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7],
                                                                                    kCRToastAnimationInTypeKey          : @(CRToastAnimationTypeGravity),
                                                                                    kCRToastAnimationOutTypeKey         : @(CRToastAnimationTypeGravity),
                                                                                    kCRToastAnimationInDirectionKey     : @(CRToastAnimationDirectionLeft),
                                                                                    kCRToastAnimationOutDirectionKey    : @(CRToastAnimationDirectionRight),
                                                                                    kCRToastTextColorKey                : [UIColor whiteColor],
                                                                                    kCRToastSubtitleTextColorKey        : [UIColor whiteColor]
                                                                                    }];
        
    }
    return self;
}

+ (AFImageResponseSerializer *)imageSerialiser{
    AFImageResponseSerializer *serializer = [[AFImageResponseSerializer alloc] init];
    serializer.acceptableContentTypes = [serializer.acceptableContentTypes setByAddingObject:@"binary/octet-stream"];
    return serializer;
}

-(void)showTabbar:(BOOL)show
{
    NSNumber *num = [NSNumber numberWithBool:show];
    [[NSNotificationCenter defaultCenter] postNotificationName:kShowTabBar object:num];
}


#pragma mark-
#pragma mark  Device Types Related

+(BOOL)isiPad{
	return (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad);
}

#pragma mark-
#pragma mark  iOS Types Related

-(float)getSystemVersion
{
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    return version;
}

#pragma mark-
#pragma mark  Device Related

-(NSString*)getNibName:(NSString*)OriginalnibName{
    
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        return [NSString stringWithFormat:@"%@_iPad",OriginalnibName];
    }
    else
    {
        return [NSString stringWithFormat:@"%@_iPhone",OriginalnibName];
    }
}

-(NSString*)getImageName:(NSString*)OriginalImageName{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        return [NSString stringWithFormat:@"%@_iPad",OriginalImageName];
    }
    else
    {
        return [NSString stringWithFormat:@"%@_iPhone",OriginalImageName];
    }
}

-(NSString*)getStoryboardName:(NSString*)storyboardname{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        return [NSString stringWithFormat:@"%@_iPad",storyboardname];
    }
    else
    {
        return [NSString stringWithFormat:@"%@_iPhone",storyboardname];
    }
}


-(BOOL)isiPhone5
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        
        if(result.height==568)
            
            return YES;
        else
            return NO;
    }
    return NO;
}

-(BOOL)isiPad
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - Generate UniqueID

-(NSString *)getUniqueID:(NSString *)senderid
{
    NSTimeInterval interval= [[NSDate date] timeIntervalSince1970];
    
    NSNumberFormatter * nf = [[NSNumberFormatter alloc] init];
    [nf setMaximumFractionDigits:0];
    
    NSString * trimmed = [nf stringFromNumber:[NSNumber numberWithDouble:interval*1000]];
    
    return [NSString stringWithFormat:@"%@_%@",senderid,trimmed];
}


-(NSString *)replaceNULLInputinitWithString:(NSString*)InputString {
    
    //||[allTrim( InputString ) length] == 0||
    if( (InputString == nil) ||(InputString ==(NSString*)[NSNull null])||([InputString isEqual:nil])||([InputString length] == 0)||([InputString isEqualToString:@""])||([InputString isEqualToString:@"(NULL)"])||([InputString isEqualToString:@"<NULL>"])||([InputString isEqualToString:@"<null>"]||([InputString isEqualToString:@"(null)"])||([InputString isEqualToString:@"NULL"])||([InputString isEqualToString:@"nil"])||([InputString isEqualToString:@"Nil"])||([InputString isEqualToString:@"null"])))
        
        return @"";
    else
        return InputString ;
    
}


-(BOOL)isNullString:(NSString*)_inputString
{
    NSString *InputString=_inputString;
    
    //InputString=[NSString stringWithFormat:@"%@",_inputString];
    if( (InputString == nil) ||(InputString ==(NSString *)[NSNull null])||([InputString isEqual:nil])||([InputString length] == 0)||[allTrim( InputString ) length] == 0||([InputString isEqualToString:@""])||([InputString isEqualToString:@"(NULL)"])||([InputString isEqualToString:@"<NULL>"])||([InputString isEqualToString:@"<null>"]||([InputString isEqualToString:@"(null)"])||([InputString isEqualToString:@"nil"])||([InputString isEqualToString:@"Nil"])||([InputString isEqualToString:@""]))
       
       )
        return YES;
    else
        return NO ;
}

- (NSString *)nullExceptionForString:(NSString *)inputStr
{
    if([self isNullString:inputStr])
        return @"";
    
    else
        return inputStr;
}

#pragma mark -
#pragma mark  Set image

-(UIImage*)setImageToImageView:(NSString*)imageName
{
    NSString *strFilepath=[self getFilePathInBundle:imageName];
    if([[NSFileManager  defaultManager]fileExistsAtPath:strFilepath])
        return [UIImage imageWithContentsOfFile:strFilepath];
    else
        return nil;
}

-(NSString*)getFilePathInBundle:(NSString*)imageName
{
    NSString *path = [NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] resourcePath],imageName ];
    return path;
}

#pragma mark-
#pragma mark Control Multiple Button Tapping

-(IBAction)buttonTouchDown:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    self.selectedTag = btn.tag;
}

#pragma mark-
#pragma mark Custom Animation To Push ViewControllers

-(void)PushWithPopEffect:(UIView*)view
{
    CATransition* transition = [CATransition animation];
    [transition setDuration:0.37];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    [transition setFillMode:kCAFillModeBoth];
    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [view.layer addAnimation:transition forKey:kCATransition];
}

-(void)PopWithPushEffect:(UIView *)view{
    CATransition* transition = [CATransition animation];
    [transition setDuration:0.37];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    [transition setFillMode:kCAFillModeBoth];
    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [view.layer addAnimation:transition forKey:kCATransition];
}

-(void)switchViewControllerWithFadeTransition:(UIView *)view
{
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    //transition.subtype = kCATransitionFromTop; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    [view.layer addAnimation:transition forKey:kCATransition];
}

#pragma mark-
#pragma mark Enable/Disable Window Interaction

-(void)enableWndowInteraction
{
    UIWindow *keyWin = [[UIApplication sharedApplication] keyWindow];
    [keyWin setUserInteractionEnabled:YES];
}

-(void)disableWindowInteraction
{
    UIWindow *keyWin = [[UIApplication sharedApplication] keyWindow];
    [keyWin setUserInteractionEnabled:NO];
}


+(NSString*)getNonEmptyString:(NSString *)value{
    if (value==NULL || value.length<=0 || [value isEqualToString:@"(null)"]){
        return @"";
    }
    return value;
}

+(NSString*)getSlashreplaceString:(NSString *)value{
    NSString *str=[value stringByReplacingOccurrencesOfString:@"/" withString:@":"];
    return str;
}

+(NSString*)trimString:(NSString*)value{
    NSString *trimmedString = [value stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceCharacterSet]];
    return trimmedString;
}

+(CGFloat)heightForLabel:(UILabel *)label withText:(NSString *)text width:(CGFloat )width{
    CGSize maximumLabelSize = CGSizeMake(width, MAXFLOAT);
    
    CGRect titleRect = [text boundingRectWithSize:maximumLabelSize options:(NSStringDrawingUsesLineFragmentOrigin| NSStringDrawingTruncatesLastVisibleLine) attributes:@{NSFontAttributeName:label.font} context:nil];
    return titleRect.size.height;
}


#pragma mark- Special Characters Get and Replace Methods

-(NSString *)replaceString:(NSString *)stringToReplace
{
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"&"    withString:@"amp;#38;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"\n"   withString:@"amp;#8221;n"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"\r"   withString:@"amp;#8221;r"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"<"    withString:@"amp;#60;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@">"    withString:@"amp;#62;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"\""   withString:@"amp;#8221;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"'"    withString:@"amp;#8217;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"\\\\" withString:@"amp;#34;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"!"    withString:@"amp;#33;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"$"    withString:@"amp;#36;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"%"    withString:@"amp;#37;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"*"    withString:@"amp;#42;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"¢"    withString:@"amp;#162;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"£"    withString:@"amp;#163;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"¤"    withString:@"amp;#164;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"¥"    withString:@"amp;#165;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"¦"    withString:@"amp;#166;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"§"    withString:@"amp;#167;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"©"    withString:@"amp;#169;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"\'"   withString:@"amp;#39;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"¡"    withString:@"amp;#161;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"¿"    withString:@"amp;#191;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"“"    withString:@"amp;#8220;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"”"    withString:@"amp;#8221;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"‘"    withString:@"amp;#8216;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"’"    withString:@"amp;#8217;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"«"    withString:@"amp;#171;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"»"    withString:@"amp;#187;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"÷"    withString:@"amp;#247;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"µ"    withString:@"amp;#181;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"·"    withString:@"amp;#183;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"¶"    withString:@"amp;#182;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"±"    withString:@"amp;#177;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"€"    withString:@"amp;#8364;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"®"    withString:@"amp;#174;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"™"    withString:@"amp;#153;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"á"    withString:@"amp;#225;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Á"    withString:@"amp;#193;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"à"    withString:@"amp;#224;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"À"    withString:@"amp;#192;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"â"    withString:@"amp;#226;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Â"    withString:@"amp;#194;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"å"    withString:@"amp;#229;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"á"    withString:@"amp;#225;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Å"    withString:@"amp;#197;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"ã"    withString:@"amp;#227;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ã"    withString:@"amp;#195;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"ä"    withString:@"amp;#228;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ä"    withString:@"amp;#196;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"æ"    withString:@"amp;#230;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Æ"    withString:@"amp;#198;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"ç"    withString:@"amp;#231;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ç"    withString:@"amp;#199;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"é"    withString:@"amp;#233;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"É"    withString:@"amp;#201;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"è"    withString:@"amp;#232;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"È"    withString:@"amp;#200;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ê"    withString:@"amp;#202;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"ë"    withString:@"amp;#235;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ë"    withString:@"amp;#203;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"í"    withString:@"amp;#237;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ì"    withString:@"amp;#204;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"î"    withString:@"amp;#238;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Î"    withString:@"amp;#206;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ï"    withString:@"amp;#207;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"ñ"    withString:@"amp;#241;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ñ"    withString:@"amp;#209;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"ó"    withString:@"amp;#243;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ó"    withString:@"amp;#211;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"ò"    withString:@"amp;#242;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ò"    withString:@"amp;#210;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"ô"    withString:@"amp;#244;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ô"    withString:@"amp;#212;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"ø"    withString:@"amp;#248;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ø"    withString:@"amp;#216;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"õ"    withString:@"amp;#245;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Õ"    withString:@"amp;#213;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"ö"    withString:@"amp;#246;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ö"    withString:@"amp;#214;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"ß"    withString:@"amp;#223;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"ú"    withString:@"amp;#250;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ú"    withString:@"amp;#218;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"ù"    withString:@"amp;#249;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ù"    withString:@"amp;#217;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"û"    withString:@"amp;#251;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Û"    withString:@"amp;#219;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"ü"    withString:@"amp;#252;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"Ü"    withString:@"amp;#220;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"ÿ"    withString:@"amp;#255;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"´"    withString:@"amp;#180;"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"`"    withString:@"amp;#96;"];
    
    return stringToReplace;
}

- (NSString *)GetOriginalString:(NSString *)stringToReplace
{
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#38;"     withString:@"&"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#8221;n"  withString:@"\n"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#8221;r"  withString:@"\r"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#60;"     withString:@"<"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#62;"     withString:@">"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#8221;"   withString:@"\""];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#8217;"   withString:@"'"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#34;"     withString:@"\\\\"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#33;"     withString:@"!"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#36;"     withString:@"$"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#37;"     withString:@"%"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#42;"     withString:@"*"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#162;"    withString:@"¢"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#163;"    withString:@"£"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#164;"    withString:@"¤"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#165;"    withString:@"¥"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#166;"    withString:@"¦"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#167;"    withString:@"§"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#169;"    withString:@"©"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#39;"     withString:@"\'"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#161;"    withString:@"¡"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#191;"    withString:@"¿"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#8220;"   withString:@"“"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#8221;"   withString:@"”"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#8216;"   withString:@"‘"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#8217;"   withString:@"’"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#171;"    withString:@"«"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#187;"    withString:@"»"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#247;"    withString:@"÷"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#181;"    withString:@"µ"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#183;"    withString:@"·"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#182;"    withString:@"¶"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#177;"    withString:@"±"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#8364;"   withString:@"€"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#174;"    withString:@"®"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#153;"    withString:@"™"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#225;"    withString:@"á"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#193;"    withString:@"Á"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#224;"    withString:@"à"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#192;"    withString:@"À"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#226;"    withString:@"â"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#194;"    withString:@"Â"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#229;"    withString:@"å"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#225;"    withString:@"á"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#197;"    withString:@"Å"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#227;"    withString:@"ã"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#195;"    withString:@"Ã"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#228;"    withString:@"ä"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#196;"    withString:@"Ä"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#230;"    withString:@"æ"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#198;"    withString:@"Æ"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#231;"    withString:@"ç"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#199;"    withString:@"Ç"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#233;"    withString:@"é"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#201;"    withString:@"É"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#232;"    withString:@"è"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#200;"    withString:@"È"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#202;"    withString:@"Ê"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#235;"    withString:@"ë"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#203;"    withString:@"Ë"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#237;"    withString:@"í"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#204;"    withString:@"Ì"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#238;"    withString:@"î"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#206;"    withString:@"Î"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#207;"    withString:@"Ï"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#241;"    withString:@"ñ"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#209;"    withString:@"Ñ"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#243;"    withString:@"ó"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#211;"    withString:@"Ó"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#242;"    withString:@"ò"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#210;"    withString:@"Ò"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#244;"    withString:@"ô"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#212;"    withString:@"Ô"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#248;"    withString:@"ø"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#216;"    withString:@"Ø"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#245;"    withString:@"õ"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#213;"    withString:@"Õ"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#246;"    withString:@"ö"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#214;"    withString:@"Ö"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#223;"    withString:@"ß"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#250;"    withString:@"ú"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#218;"    withString:@"Ú"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#249;"    withString:@"ù"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#217;"    withString:@"Ù"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#251;"    withString:@"û"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#219;"    withString:@"Û"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#252;"    withString:@"ü"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#220;"    withString:@"Ü"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#255;"    withString:@"ÿ"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#180;"    withString:@"´"];
    stringToReplace = [stringToReplace stringByReplacingOccurrencesOfString:@"amp;#96;"     withString:@"`"];
    
    return stringToReplace;
}

-(NSDateFormatter *)dateFormatter
{
    if (!self.formatter) {
        _formatter = [[NSDateFormatter alloc] init];
    }
    return self.formatter;
}

#pragma mark-
#pragma mark  Email Validation
- (BOOL) validateEmail: (NSString *) checkString {
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

-(NSString *)capitalizeFirstCharacter:(NSString *)categoryName
{
    @autoreleasepool {
        NSString *capitalisedSentence = @"";
        //Does the string live in memory and it has atleast one letter?
        if (categoryName && [categoryName length]>0) {
            //Yes. It is
            capitalisedSentence = [categoryName stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                                        withString:[[categoryName substringToIndex:1] capitalizedString]];
        }
        return capitalisedSentence;
    }
}

#pragma mark -
#pragma mark check  Key In Dictionary

-(BOOL)isKeyInDictionary: (NSString *)key  dictionary:(NSDictionary *)dict
{
    if([[dict allKeys] containsObject:key])
        return  YES;
    
    return NO;
}


#pragma mark- Get Label Size for Text

-(CGSize)getLabelSizeFortext:(NSString *)text forWidth:(float)_width WithFont:(UIFont *)font
{
    CGSize constraint = CGSizeMake(_width, 20000.0f);
    // Get the size of the text given the CGSize we just made as a constraint
    CGRect titleRect = [text boundingRectWithSize:constraint options:(NSStringDrawingUsesLineFragmentOrigin| NSStringDrawingTruncatesLastVisibleLine) attributes:@{NSFontAttributeName:font} context:nil];
    return titleRect.size;
}

-(CGSize)getAttributedSizeFortext:(NSMutableAttributedString *)text forWidth:(float)_width WithFont:(UIFont *)font
{
    CGSize constraint = CGSizeMake(_width, 20000.0f);
    // Get the size of the text given the CGSize we just made as a constraint
    CGRect titleRect = [text boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];//[text boundingRectWithSize:constraint options:(NSStringDrawingUsesLineFragmentOrigin| NSStringDrawingTruncatesLastVisibleLine) attributes:@{NSFontAttributeName:font} context:nil];
    return titleRect.size;
}

#pragma mark Resize Image

-(UIImage *)resizeImage:(UIImage *)tImg targetSize:(CGSize)targetSize
{
    UIImage *sourceImage = tImg;
    if (tImg.size.height > tImg.size.width) {
        //NSLog(@"Portrait Image");
        if(tImg.size.height > targetSize.height)
        {
            CGSize newSize = CGSizeMake(targetSize.height*(tImg.size.width/tImg.size.height),targetSize.height );
            UIGraphicsBeginImageContext( newSize );
            [tImg drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
            UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return   newImage;
        }
        else
            return tImg;
    }
    else {
        //NSLog(@"Landscape Image");
        if(tImg.size.width>targetSize.width)
        {
            CGSize newSize = CGSizeMake(targetSize.width, targetSize.width*(tImg.size.height/tImg.size.width));
            UIGraphicsBeginImageContext( newSize );
            [tImg drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
            UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return   newImage;
        }
        else
            return tImg;
    }
    return sourceImage;
}

-(NSString *)replaceSpecialCharactersAndWhiteSpaces:(NSString *)message
{
    message = [message stringByReplacingOccurrencesOfString:@"(" withString:@""];
    message = [message stringByReplacingOccurrencesOfString:@")" withString:@""];
    message = [message stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    message = [message stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    message = [message stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return message;
}

-(void)DeleteFilesFromCacheDirectoryPath:(NSString *)path
{
    //NSLog(@"%@",path);
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if ([fileMgr fileExistsAtPath:path]) {
        [fileMgr removeItemAtPath:path error:nil];
    }
}

#pragma mark - save file in Cache

-(void)saveFile:(NSData *)tumbImgData imagePath:(NSString*)_imagePath
{
    if([self isNullString:_imagePath])return;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:_imagePath]
        )
    {
        [[NSFileManager defaultManager] createFileAtPath:_imagePath contents:tumbImgData attributes:nil];
    }
    else if ([[NSFileManager defaultManager] fileExistsAtPath:_imagePath])
    {
        [[NSFileManager defaultManager] removeItemAtPath:_imagePath error:NULL];
        
        [[NSFileManager defaultManager] createFileAtPath:_imagePath contents:tumbImgData attributes:nil];
    }
    
    tumbImgData=nil;
}

-(NSString *)Base64Encode:(NSData *)data{
    //Point to start of the data and set buffer sizes
    int inLength = (int)[data length];
    int outLength = ((((inLength * 4)/3)/4)*4) + (((inLength * 4)/3)%4 ? 4 : 0);
    const char *inputBuffer = [data bytes];
    char *outputBuffer = malloc(outLength);
    outputBuffer[outLength] = 0;
    
    //64 digit code
    static char Encode[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    
    //start the count
    int cycle = 0;
    int inpos = 0;
    int outpos = 0;
    char temp = '\0';
    
    //Pad the last to bytes, the outbuffer must always be a multiple of 4
    outputBuffer[outLength-1] = '=';
    outputBuffer[outLength-2] = '=';
    
    /* http://en.wikipedia.org/wiki/Base64
     Text content   M           a           n
     ASCII          77          97          110
     8 Bit pattern  01001101    01100001    01101110
     
     6 Bit pattern  010011  010110  000101  101110
     Index          19      22      5       46
     Base64-encoded T       W       F       u
     */
    
    
    while (inpos < inLength){
        switch (cycle) {
            case 0:
                outputBuffer[outpos++] = Encode[(inputBuffer[inpos]&0xFC)>>2];
                cycle = 1;
                break;
            case 1:
                temp = (inputBuffer[inpos++]&0x03)<<4;
                outputBuffer[outpos] = Encode[temp];
                cycle = 2;
                break;
            case 2:
                outputBuffer[outpos++] = Encode[temp|(inputBuffer[inpos]&0xF0)>> 4];
                temp = (inputBuffer[inpos++]&0x0F)<<2;
                outputBuffer[outpos] = Encode[temp];
                cycle = 3;
                break;
            case 3:
                outputBuffer[outpos++] = Encode[temp|(inputBuffer[inpos]&0xC0)>>6];
                cycle = 4;
                break;
            case 4:
                outputBuffer[outpos++] = Encode[inputBuffer[inpos++]&0x3f];
                cycle = 0;
                break;
            default:
                cycle = 0;
                break;
        }
    }
    NSString *pictemp = [NSString stringWithUTF8String:outputBuffer];
    free(outputBuffer);
    return pictemp;
}


-(NSString *)getCompleteAddress:(NSString *)address
{
    NSString *_address = @"";
    if ([address length] > 0) {
        _address = [NSString stringWithFormat:@"%@, ",address];
    }
    else{
        _address = @"";
    }
    return _address;
}

#pragma mark- Get Friend Image URL

-(NSURL *)getImageURL:(NSString *)friendUrlString
{
    if([friendUrlString hasPrefix:@"http://"] ||  [friendUrlString hasPrefix:@"https://"])
    {
        return [NSURL URLWithString:friendUrlString];
    }
    else
    {
        NSString *filePath = friendUrlString;
        NSString *fileName = [[filePath componentsSeparatedByString:@"/"] lastObject];
        return [NSURL fileURLWithPath:DOC_PATH(fileName)];
    }
}

+(void)animateViewToAppear:(UIView *)vw direction:(AnimationDirection)direction
{
    [vw.layer removeAllAnimations];
    NSString *animationType = @"";
    switch (direction) {
        case Bottom:
            animationType = kCATransitionFromBottom;
            break;
        case Top:
            animationType = kCATransitionFromTop;
            break;
        case Left:
            animationType = kCATransitionFromLeft;
            break;
        case Right:
            animationType = kCATransitionFromRight;
            break;
    }
    CATransition *transition = [CATransition animation];
    transition.duration = 0.2;
    transition.type = kCATransitionPush;
    transition.subtype = animationType;
    [vw.layer addAnimation:transition forKey:nil];
    vw.hidden = FALSE;
}

+(void)animateViewToDisappear:(UIView *)vw direction:(AnimationDirection)direction
{
    [vw.layer removeAllAnimations];
    NSString *animationType = @"";
    switch (direction) {
        case Bottom:
            animationType = kCATransitionFromBottom;
            break;
        case Top:
            animationType = kCATransitionFromTop;
            break;
        case Left:
            animationType = kCATransitionFromLeft;
            break;
        case Right:
            animationType = kCATransitionFromRight;
            break;
    }
    CATransition *transition = [CATransition animation];
    transition.duration = 0.2;
    transition.type = kCATransitionPush;
    transition.subtype = animationType;
    [vw.layer addAnimation:transition forKey:nil];
    vw.hidden = TRUE;
}

-(UIToolbar *)createToolBar_WithDoneBtnTitle:(NSString *)doneBtnTitle CancelBtnTitle:(NSString *)cancelBtnTitle donebtnSelector:(SEL)doneSelector CancelButtonSelector:(SEL)cancelBtnSelector Parent:(id)_parent
{
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    
    UIBarButtonItem *spaceBarBtn=  [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *spaceBarBtn1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:doneBtnTitle
                                                                   style:UIBarButtonItemStylePlain target:_parent
                                                                  action:doneSelector];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:cancelBtnTitle
                                                                   style:UIBarButtonItemStylePlain target:_parent
                                                                  action:cancelBtnSelector];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:spaceBarBtn,spaceBarBtn1,cancelButton,doneButton, nil]];
    
    return keyboardDoneButtonView;
}

-(void)hideCustomSpinner:(UIView *)inView WithTag:(NSInteger)indicatorTag
{
    UIView *indicatorView = (UIView *)[inView viewWithTag:indicatorTag];
    
    if (indicatorView)
    {
        [indicatorView removeFromSuperview];
        indicatorView = nil;
    }
}

#pragma mark - Spinner -

- (void)showSpinner:(UIView *)superView parentView:(UIView *)parentView shouldDisableUserInteraction:(BOOL)shouldDisableUserInteraction {
    [_spinner stopAnimating];
    [_spinner removeFromSuperview];
    _spinner = [[VHTSpinner alloc] initWithSpinnerType:kVHTSpinnerTypeCircular];
    _spinner.hidesWhenStopped=YES;
    _spinner.radius = 8;
    _spinner.pathColor = [UIColor darkGrayColor];
    _spinner.fillColor = [UIColor lightGrayColor];
    _spinner.thickness = 2;
    [_spinner setTranslatesAutoresizingMaskIntoConstraints:NO];
    [parentView addSubview:_spinner];
    [_spinner startAnimating];
    superView.userInteractionEnabled = !shouldDisableUserInteraction;
}

- (void)hideSpinner:(UIView *)superView shouldRemoveParentView:(BOOL)shouldRemoveParentView {
    [_spinner stopAnimating];
    if(shouldRemoveParentView)
        [_spinner.superview removeFromSuperview];
    superView.userInteractionEnabled = YES;
    [_spinner removeFromSuperview];
}

#pragma mark -ALertView

-(void)showAlert:(NSString *)message actions:(NSArray *)actions completion:(void (^)(int))completion
{
    [[VHTAlertController sharedController] showAlert:@"" message:message delegate:self actions:actions completion:^(int buttonIndex) {
        self.completionBlock=completion;
    }];
}

#pragma mark - CRToast - 

- (void)showToastWithTitle:(NSString *)title subTitle:(NSString *)subtitle {

    [_dicCRToastOptions setValue:title forKey:kCRToastTextKey];
    [_dicCRToastOptions setValue:subtitle forKey:kCRToastSubtitleTextKey];
    [CRToastManager showNotificationWithOptions:_dicCRToastOptions
                                completionBlock:^{
                                    NSLog(@"Completed");
                                }];
}

#pragma mark - Image - 
- (UIImage *)fixrotation:(UIImage *)image{
    
    
    if (image.imageOrientation == UIImageOrientationUp) return image;
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (image.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, image.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,
                                             CGImageGetBitsPerComponent(image.CGImage), 0,
                                             CGImageGetColorSpace(image.CGImage),
                                             CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (image.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.width,image.size.height), image.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

#pragma mark-
#pragma mark- No network view
-(void)addNoNetworkViewOverView:(UIView *)inview OriginY:(CGFloat)originy{
    
    [[VHTAlertController sharedController] showAlert:@"" message:kNoNetworkAlert delegate:[self.mNavigationController.viewControllers lastObject] actions:@[kALERT_OPTION_CANCEL, kALERT_OPTION_SETTING] completion:^(int buttonIndex) {
        if (buttonIndex == 1) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }
    }];
}

-(void)removeNoNetworkViewFrombutton:(UIButton *)sender {
    __block UIView *view= sender.superview;
    if (view.tag==NONETWORK_VIEWTAG) {
        [view.layer removeAllAnimations];
        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromTop;
        transition.duration = 0.3f;
        [view.layer addAnimation:transition forKey:nil];
        view.hidden=YES;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [view.layer removeAllAnimations];
            [view removeFromSuperview];
            view = nil;
        });
    }
}

-(void)removeNoNetworkView:(UIView *)inview{
    __block UIView *view=[self.appDelegate.window viewWithTag:NONETWORK_VIEWTAG];
    if (view) {
        [view.layer removeAllAnimations];
        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromTop;
        transition.duration = 0.3f;
        [view.layer addAnimation:transition forKey:nil];
        view.hidden=YES;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [view.layer removeAllAnimations];
            [view removeFromSuperview];
            view = nil;
        });
    }
}

#pragma mark-
#pragma mark- Chat Notification view
-(void)addChatNotificationViewOverView:(VHTConversationSectionDetails *)mDetails GroupId:(NSString *)groupId{
    
    UIView *view=(UIView *)[self.appDelegate.window viewWithTag:CHATNOTIFY_VIEWTAG];
    
    if (!view) {
        
        UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.appDelegate.window.frame.size.width, 54)];
        view.autoresizingMask=UIViewAutoresizingFlexibleWidth;
        view.backgroundColor=[UIColor colorWithRed:184.0/255.0 green:72.0/255.0 blue:97.0/255.0 alpha:1.0];
        view.tag=CHATNOTIFY_VIEWTAG;
        
        UIImageView *backImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
        backImg.image = [UIImage imageNamed:@"ChatsFooterTabBar"];
        [view addSubview:backImg];
        
        imgSenderPic=[[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 40,40)];
        [imgSenderPic setBackgroundColor:[UIColor grayColor]];
        imgSenderPic.layer.cornerRadius = 20.0;
        imgSenderPic.clipsToBounds=YES;
        [view addSubview:imgSenderPic];
        
        lblName=[[UILabel alloc]initWithFrame:CGRectMake(65, 10, self.appDelegate.window.frame.size.width-65,15)];
        [lblName setBackgroundColor:[UIColor clearColor]];
        [lblName setTextAlignment:NSTextAlignmentLeft];
        [lblName setFont:FONT_REGULAR(14.0f)];
        [lblName setTextColor:[UIColor whiteColor]];
        [lblName setText:@"No network connection!"];
        [view addSubview:lblName];
        
        lblMessage=[[UILabel alloc]initWithFrame:CGRectMake(65, 25, self.appDelegate.window.frame.size.width-65,25)];
        [lblMessage setBackgroundColor:[UIColor clearColor]];
        [lblMessage setTextAlignment:NSTextAlignmentLeft];
        [lblMessage setFont:FONT_REGULAR(12.0f)];
        [lblMessage setTextColor:[UIColor whiteColor]];
        [view addSubview:lblMessage];
        
        
        btnTapNotify = [UIButton buttonWithType:UIButtonTypeCustom];
        btnTapNotify.frame = backImg.frame;
        [btnTapNotify addTarget:self action:@selector(removeChatNotificationViewFrombutton:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btnTapNotify];
        [self.appDelegate.window addSubview:view];
        [self.appDelegate.window bringSubviewToFront:view];
    }
    isGroupChat = mDetails.isGroupChat;
    
    
    if(mDetails.isGroupChat){
        
        NSMutableArray *arrGroups = [[VHTDatabaseInteraction sharedDB] getGroupDetailByGroupId:groupId];
        
        VHTGroup *groupObject = (VHTGroup *)[arrGroups objectAtIndex:0];
        
        strSenderChatID     = groupObject.strGroupID;
        strGroupChatJID     = groupObject.strGroupJId;
        
        lblName.text = groupObject.strGroupName;
        
        if([mDetails.messageType isEqualToString:kMessageTypeMessage]){
            lblMessage.text =[self isNullString:mDetails.translatedText]?decodeEmojiString(mDetails.messageBody):decodeEmojiString(mDetails.translatedText);
        }
        else{
            lblMessage.text = mDetails.messageType;
        }
        
        [imgSenderPic sd_setImageWithURL:[[VHTCommon sharedInstance] getImageURL:groupObject.strGroupImage]
                        placeholderImage:[UIImage imageNamed:@"ChatsNoimageProfile"]];
        
    }
    else{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [[VHTDatabaseInteraction sharedDB]getSenderInfoForConversation:mDetails.senderChatID phoneNo:mDetails.friendContactNo dict:dict];
    
    strSenderChatID     = mDetails.senderChatID;
    strSenderID         = mDetails.senderID;
    strSenderPohoneNo   = [self getContactNo:[dict valueForKey:@"friendPhoneNo"]];
    
    lblName.text = [self isNullString:[dict valueForKey:@"friendName"]] ? strSenderPohoneNo: decodeEmojiString([dict valueForKey:@"friendName"]);
    if([mDetails.messageType isEqualToString:kMessageTypeMessage]){
        lblMessage.text =[self isNullString:mDetails.translatedText]?decodeEmojiString(mDetails.messageBody):decodeEmojiString(mDetails.translatedText);
    }
    else{
        lblMessage.text = mDetails.messageType;
    }

    [imgSenderPic sd_setImageWithURL:[[VHTCommon sharedInstance] getImageURL:[dict valueForKey:@"imageLink"]]
                           placeholderImage:[UIImage imageNamed:@"ChatsNoimageProfile"]];
    }
    
    [[[[UIApplication sharedApplication] delegate] window] setWindowLevel:UIWindowLevelStatusBar+1];
    
    if(view.hidden){
        [view.layer removeAllAnimations];
        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromBottom;
        transition.duration = 0.5f;
        [view.layer addAnimation:transition forKey:nil];
        view.hidden = NO;
    }
    else{
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(removeChatNotificationView) object:nil];
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
    }
    
    [self performSelector:@selector(removeChatNotificationView) withObject:nil afterDelay:10.0f];
}

-(NSString *)getContactNo:(NSString *)_phnNo
{
    if([_phnNo containsString:@"+"]){
        return _phnNo;
    }
    else{
        return [NSString stringWithFormat:@"+%@",_phnNo];
    }
}

-(void)removeChatNotificationViewFrombutton:(UIButton *)sender {
    
    if([self ifContainChatViewController:self.selectedNavController]){
        
         for (UIViewController *vc in self.selectedNavController.viewControllers)
         {
             if([vc isKindOfClass:[VHTConversationHistoryController class]]){
                 
                 VHTConversationHistoryController *controller = (VHTConversationHistoryController *)vc;
                 controller.chat_group_ID    = strSenderChatID;
                 controller.chat_group_JID   = strGroupChatJID;
                 controller.friend_contactNo = strSenderPohoneNo;
                 controller.friend_Id        = strSenderID;
                 
                 if(isGroupChat){
                    controller.chatController   = eGroupChatController;
                 }
                 else{
                    controller.chatController   = eSingleChatController;
                 }
                 
                 [controller refreshHistoryDetails];
             }
         }
    }
    else{
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        VHTConversationHistoryController *controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"VHTConversationHistoryController"];
        controller.chat_group_ID    = strSenderChatID;
        controller.chat_group_JID   = strGroupChatJID;
        controller.friend_contactNo = strSenderPohoneNo;
        controller.friend_Id        = strSenderID;
        
        if(isGroupChat){
            controller.chatController   = eGroupChatController;
        }
        else{
            controller.chatController   = eSingleChatController;
        }
        
        [self.selectedNavController pushViewController:controller animated:YES];

    }
    
    [self removeChatNotificationView];
}

-(BOOL)ifContainChatViewController:(UINavigationController *)navcontroller{
    
    for (UIViewController *vc in navcontroller.viewControllers) {
        
        if([vc isKindOfClass:[VHTConversationHistoryController class]]){
            return YES;
        }
    }
    return NO;
}

-(BOOL)ifContainRegistraionController:(UINavigationController *)nav class:(Class)_class{
    
    for (UIViewController *vc in nav.viewControllers) {
        
        if([vc isKindOfClass:_class]){
            return YES;
        }
    }
    return NO;
}

-(void)removeChatNotificationView{
    
    [[[[UIApplication sharedApplication] delegate] window] setWindowLevel:UIWindowLevelNormal];

    __block UIView *view=[self.appDelegate.window viewWithTag:CHATNOTIFY_VIEWTAG];
    if (view) {
        [view.layer removeAllAnimations];
        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromTop;
        transition.duration = 0.3f;
        [view.layer addAnimation:transition forKey:nil];
        view.hidden=YES;
        
    }
}


#pragma mark-
#pragma mark- Language Translator

-(void)initializeTranslator{
    [FGTranslator flushCache];
    [FGTranslator flushCredentials];
}

- (FGTranslator *)translator {
    
    FGTranslator *translator = [[FGTranslator alloc] initWithGoogleAPIKey:@"AIzaSyDjibCl95-l978-X8zo4A2AVRJ7KqBDYok"];
    
    return translator;
}

- (NSLocale *)currentLocale {
    NSLocale *locale = [NSLocale currentLocale];
#if TARGET_IPHONE_SIMULATOR
    // handling Apple bug
    // http://stackoverflow.com/a/26769277/211692
    return [NSLocale localeWithLocaleIdentifier:[locale localeIdentifier]];
#else
    return locale;
#endif
}


- (void)getSupportedLanguages
{
    [self.translator supportedLanguages:^(NSError *error, NSArray *languageCodes)
     {
         if (error)
         {
            NSLog(@"%@",error);
             [self getSupportedLanguages];
         }
         else
         {
             NSMutableArray *languageArr = [NSMutableArray new];
             NSLocale *locale = [self currentLocale];
             for (NSString *code in languageCodes){
                 
                 NSMutableDictionary *dict = [NSMutableDictionary dictionary];
                 [dict setObject:[locale displayNameForKey:NSLocaleIdentifier value:code] forKey:@"languageName"];
                 [dict setObject:code forKey:@"languageCode"];
                 
                 [languageArr addObject:dict];
            }
             
             [[VHTDatabaseInteraction sharedDB] deleteAllLanguages];
             [[VHTDatabaseInteraction sharedDB]insertLanguageDetails:languageArr];
         }
         
        }];
}

- (void)detectLanguage:(NSString *)text withCompletion:(void (^)(NSString *detectedLang, NSError*error))completionHandler
{
    [self.translator detectLanguage:text completion:^(NSError *error, NSString *detectedSource, float confidence)
     {
         if (error)
         {
           completionHandler(@"",error);
         }
         else
         {
             NSString *fromLanguage = [[self currentLocale] displayNameForKey:NSLocaleIdentifier value:detectedSource];
             self.detectedLang = fromLanguage;
             
             completionHandler(detectedSource,nil);
         }
     }];
}

- (void)translateText:(NSString *)text withSourceLang:(NSString *)sourcelang withCompletion:(void (^)(NSString *transText, NSError*error))completionHandler
{
    [self detectLanguage:text withCompletion:^(NSString *detectedLang, NSError *error) {
        if (error)
        {
            completionHandler(text,nil);
        }
        else
        {
            if([detectedLang isEqualToString:[self isNullString:self.user.languageIdentifire]? @"en":self.user.languageIdentifire]){
               completionHandler(text,nil);
            }
            else{
                [self.translator translateText:text withSource:detectedLang target:[self isNullString:self.user.languageIdentifire]?@"en":self.user.languageIdentifire completion:^(NSError *error, NSString *translated, NSString *sourceLanguage) {
                    
                    if (error)
                    {
                        completionHandler(text,nil);
                    }
                    else
                    {
                        completionHandler(translated,nil);
                    }
                }];
            }
        }
    }];
    
}


-(void)GetCurrentlocation
{
    if(!locationManager){
    locationManager = [[CLLocationManager alloc] init];
    }
    [locationManager setDelegate:self];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 20;
    
    [locationManager startUpdatingLocation];
    
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
        [locationManager requestAlwaysAuthorization];
    }
}

-(void)locationStopUpdating
{
     [locationManager stopUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = [locations objectAtIndex:0];
    if (!self.lastUpdatedLocation) {
        self.lastUpdatedLocation = newLocation;
        
        CLLocationCoordinate2D coordinate;
        coordinate = [newLocation coordinate];
        
        self.currentLocation = newLocation;
        
        self.currentLocLat = [NSString stringWithFormat:@"%f", coordinate.latitude];
        self.currentLocLong = [NSString stringWithFormat:@"%f", coordinate.longitude];
        
        if(![self isNullString:self.currentLocLat] && ![self isNullString:self.currentLocLong]){
            
            CLGeocoder *geocoder = [[CLGeocoder alloc] init];
            [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
                if ([placemarks count] > 0) {
                    // Pick the best out of the possible placemarks
                    CLPlacemark *placemark = [placemarks objectAtIndex:0];
                    
                    NSString *Addresses = [NSString stringWithFormat:@"%@%@%@%@%@",[self isNullString:[self GetCompleteAddress:[placemark name]]]?@"":[self GetCompleteAddress:[placemark name]],[self isNullString:[self GetCompleteAddress:[placemark subLocality]]]?@"":[self GetCompleteAddress:[placemark subLocality]],[self isNullString:[self GetCompleteAddress:[placemark locality]]]?@"":[self GetCompleteAddress:[placemark locality]],[self GetCompleteAddress:[NSString stringWithFormat:@"%@ %@",[self isNullString:[placemark administrativeArea]]?@"":[placemark administrativeArea],[self isNullString:[placemark postalCode] ]?@"":[placemark postalCode]]],[self isNullString:[placemark country]]?@"":[placemark country]];
                    
                    self.currentLocAddress = Addresses;
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateMapView" object:nil];
                }
            }];
        }
    }
    else {
        CLLocationDistance distance = [newLocation distanceFromLocation:self.lastUpdatedLocation];
        if (distance >= 500) {
            self.lastUpdatedLocation = newLocation;
            
            CLLocationCoordinate2D coordinate;
            coordinate = [newLocation coordinate];
            
            self.currentLocation = newLocation;
            
            self.currentLocLat = [NSString stringWithFormat:@"%f", coordinate.latitude];
            self.currentLocLong = [NSString stringWithFormat:@"%f", coordinate.longitude];
            
            if(![self isNullString:self.currentLocLat] && ![self isNullString:self.currentLocLong]){
                
                CLGeocoder *geocoder = [[CLGeocoder alloc] init];
                [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
                    if ([placemarks count] > 0) {
                        // Pick the best out of the possible placemarks
                        CLPlacemark *placemark = [placemarks objectAtIndex:0];
                        
                        NSString *Addresses = [NSString stringWithFormat:@"%@%@%@%@%@",[self isNullString:[self GetCompleteAddress:[placemark name]]]?@"":[self GetCompleteAddress:[placemark name]],[self isNullString:[self GetCompleteAddress:[placemark subLocality]]]?@"":[self GetCompleteAddress:[placemark subLocality]],[self isNullString:[self GetCompleteAddress:[placemark locality]]]?@"":[self GetCompleteAddress:[placemark locality]],[self GetCompleteAddress:[NSString stringWithFormat:@"%@ %@",[self isNullString:[placemark administrativeArea]]?@"":[placemark administrativeArea],[self isNullString:[placemark postalCode] ]?@"":[placemark postalCode]]],[self isNullString:[placemark country]]?@"":[placemark country]];
                        
                        self.currentLocAddress = Addresses;
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateMapView" object:nil];
                    }
                }];
            }
        }
    }
    
    
}

-(NSString *)GetCompleteAddress:(NSString *)address
{
    NSString *_address = @"";
    if ([address length] > 0) {
        
        _address = [NSString stringWithFormat:@"%@, ",address];
    }
    else{
        
        _address = @"";
    }
    return _address;
}

@end
#pragma mark -
float width(UIView *view) {
    return view.frame.size.width;
}

float height(UIView *view) {
    return view.frame.size.height;
}

float originX(UIView *view) {
    return view.frame.origin.x;
}

float originY(UIView *view) {
    return view.frame.origin.y;
}

void updateUserDefaults(NSString *key,NSString *value) {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

void deleteUserDefaults(NSString *key) {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

NSString *getUserDefaults(NSString *key) {
    
    return [[NSUserDefaults standardUserDefaults] stringForKey:key];
}

BOOL isTextEmpty(NSString *text) {
    NSString *rawString = text;
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [rawString stringByTrimmingCharactersInSet:whitespace];
    if ([trimmed length] == 0) {
        return YES;
    } else {
        return NO;
    }
}



NSString *getContactName(VHTContactList *contact) {
    if(contact.appName && !isTextEmpty(contact.appName)) {
        return contact.appName;
    } else if(contact.contactName && !isTextEmpty(contact.contactName)) {
        return contact.contactName;
    } else if(contact.phoneNumber && !isTextEmpty(contact.phoneNumber)) {
        return contact.phoneNumber;
    } else {
        //Should not come to this as there will always be phone number there
        return @"Unknow User";
    }
}

NSString *convertCurrentDateToGMT(){
    [[[VHTCommon sharedInstance] dateFormatter] setDateFormat:dateFormatForGMT];
    NSTimeZone *gmt = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    [[[VHTCommon sharedInstance] dateFormatter] setTimeZone:gmt];
    NSString *timeStamp = [[[VHTCommon sharedInstance] dateFormatter] stringFromDate:[NSDate date]];
    return timeStamp;
}

NSString *convertGMTDateToLocalDate(NSString *dateTime,NSString *dateFormat,BOOL showTime,BOOL showDate4Email){
  
    NSDateComponents *components;
    NSInteger days;
    
    [[[VHTCommon sharedInstance] dateFormatter] setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    [[[VHTCommon sharedInstance] dateFormatter] setDateFormat:dateFormatForGMT];
    NSDate *inDate = [[[VHTCommon sharedInstance] dateFormatter] dateFromString:dateTime];
    
    if(showDate4Email){
        
        [[[VHTCommon sharedInstance] dateFormatter] setTimeZone:[NSTimeZone localTimeZone]];
        [[[VHTCommon sharedInstance] dateFormatter] setDateFormat:dateFormat];
        
        return [[[VHTCommon sharedInstance] dateFormatter] stringFromDate:inDate];
    }
    else{
    
        if(![dateFormat isEqualToString:timeFormat]){
            
            [[[VHTCommon sharedInstance] dateFormatter] setDateFormat:onlyDateFormatForGMT];
            NSString *str =[[[VHTCommon sharedInstance] dateFormatter] stringFromDate:inDate];
            NSString *str1 =[[[VHTCommon sharedInstance] dateFormatter] stringFromDate:[NSDate date]];
            
            components = [[NSCalendar currentCalendar] components: NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute fromDate:[[[VHTCommon sharedInstance] dateFormatter] dateFromString:str] toDate:[[[VHTCommon sharedInstance] dateFormatter] dateFromString:str1] options:1];
            
            days = [components day];
            
            if(days>0){
                if(days>1){
                    [[[VHTCommon sharedInstance] dateFormatter] setTimeZone:[NSTimeZone localTimeZone]];
                    [[[VHTCommon sharedInstance] dateFormatter] setDateFormat:dateFormat];
                    
                    return [[[VHTCommon sharedInstance] dateFormatter] stringFromDate:inDate];
                }
                else{
                    if(showTime){
                        [[[VHTCommon sharedInstance] dateFormatter] setTimeZone:[NSTimeZone localTimeZone]];
                        [[[VHTCommon sharedInstance] dateFormatter] setDateFormat:timeFormat];
                        
                        return [NSString stringWithFormat:@"Yesterday at %@",[[[VHTCommon sharedInstance] dateFormatter] stringFromDate:inDate]];;
                    }
                    else{
                        return @"Yesterday";
                    }
                }
            }
            else{
                if(showTime){
                    [[[VHTCommon sharedInstance] dateFormatter] setTimeZone:[NSTimeZone localTimeZone]];
                    [[[VHTCommon sharedInstance] dateFormatter] setDateFormat:timeFormat];
                    
                    return [NSString stringWithFormat:@"Today at %@",[[[VHTCommon sharedInstance] dateFormatter] stringFromDate:inDate]];
                }
                else{
                    return @"Today";
                }
            }
        }
        else{
            [[[VHTCommon sharedInstance] dateFormatter] setTimeZone:[NSTimeZone localTimeZone]];
            [[[VHTCommon sharedInstance] dateFormatter] setDateFormat:dateFormat];
            
            return [[[VHTCommon sharedInstance] dateFormatter] stringFromDate:inDate];
        }
    }
}

NSString *randomID(NSString *type) {
    return [NSString stringWithFormat:@"%f%@",[[NSDate date] timeIntervalSince1970],type];
}


NSString *getLocalTimeFromGMTTime(NSString *gmtTime,NSString *gmtFormat, NSString *dateFormat) {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *gmtTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    [dateFormatter setDateFormat:gmtFormat];
    [dateFormatter setTimeZone:gmtTimeZone];
    NSDate *dateFromString = [dateFormatter dateFromString:gmtTime];
    
    
    NSDateFormatter *dateFormatter_ = [[NSDateFormatter alloc] init];
    [dateFormatter_ setDateFormat:dateFormat];
    [dateFormatter setTimeZone: [NSTimeZone localTimeZone]];
    NSString *timeStamp = [dateFormatter stringFromDate:dateFromString];
    
    return timeStamp;
}

NSString *convertTimestampToDateForWorkList(NSString *timestamp){
    double time_stamp = [timestamp doubleValue]/1000;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss "];
    NSDate *dates = [NSDate dateWithTimeIntervalSince1970:time_stamp];
    NSString *getDate = [dateFormatter stringFromDate:dates];
    
    return getDate;
}

NSString *timeStampFromDate(NSString *dateTime,NSString *dateFormat) {
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:dateFormat] ;
    NSDate *date = [dateFormatter dateFromString:dateTime] ;
    NSTimeInterval interval  = [date timeIntervalSince1970] ;
    return [NSString stringWithFormat:@"%f",interval];
}

NSString *encodeEmojiString(NSString *actualString) {
    actualString = [actualString stringByReplacingOccurrencesOfString:@"'" withString:@"¶¶1"];
    actualString = [actualString stringByReplacingOccurrencesOfString:@"," withString:@"¶¶2"];
    actualString = [actualString stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    actualString = [actualString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return actualString;
}

NSString *decodeEmojiString(NSString *encodedString) {
    encodedString = [encodedString stringByRemovingPercentEncoding];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"¶¶2" withString:@","];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"¶¶1" withString:@"'"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"&#39;" withString:@"'"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"%20" withString:@" "];
    
    return encodedString;
}


