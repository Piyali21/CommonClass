//
//  VHTCommon.h
//  Vhortext
//
//  Created by Piyali Tarafder on 27/07/15.
//  Copyright (c) 2015 Piyali_iOS. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import "VHTUser.h"
#import "VHTSpinner.h"
#import "VHTContactList.h"
#import <CRToast/CRToast.h>
#import "VHTNavigationController.h"
#import "VHTConversationSectionDetails.h"
#import "FGTranslator.h"
#import "VHTRegistrationController.h"
#import <Photos/Photos.h>

#define NONETWORK_VIEWTAG 2222
#define CHATNOTIFY_VIEWTAG 11111

typedef enum {
    Left,
    Right,
    Top,
    Bottom
}AnimationDirection;

typedef enum {
    eSingleChatController,
    eGroupChatController
}ChatControllerType;

typedef enum {
    kChatDataTypeText,
    kChatDataTypeImage,
    kChatDataTypeVideo,
    kChatDataTypeURL,
    kChatDataTypeLocation,
    kChatDataTypeContact
}kChatDataType;

typedef enum
{
    DataAvilable,
    DataUnAvailable,
    
    
}FordataAvilability;

@interface VHTCommon : NSObject<CLLocationManagerDelegate>
{
    NSString *strSenderChatID;
    NSString *strGroupChatJID;
    NSString *strSenderID;
    NSString *strSenderPohoneNo;
    UILabel *lblName;
    UILabel *lblMessage;
    UIImageView *imgSenderPic;
    BOOL isGroupChat;
    UIButton *btnTapNotify;
    CLLocationManager *locationManager;
}


@property (nonatomic,strong) AppDelegate *appDelegate;
@property (nonatomic, strong) VHTNavigationController *mNavigationController;
@property (nonatomic, strong) UINavigationController *selectedNavController;
@property (nonatomic,readwrite) NSInteger selectedTag;

@property (nonatomic,readwrite) FordataAvilability _forAvilityChek;

@property (nonatomic,assign) BOOL shouldSlideViewOpen;

@property (nonatomic, readwrite, getter = isUploadInProgress) BOOL uploadInProgress;

@property (nonatomic, strong) NSString *selectedCountry;
@property (nonatomic, strong) NSString *selectedCountryCode;

@property (nonatomic, strong) NSString *deviceId;

@property (nonatomic, strong) NSString *translated_Text;

@property (nonatomic, strong) NSString *detectedLang;

@property (nonatomic, strong) VHTUser *user;

@property (nonatomic, copy) void (^completionBlock)(int);

@property (nonatomic,strong) NSString *currentLocLat;
@property (nonatomic,strong) NSString *currentLocLong;
@property (nonatomic,weak) CLLocation *currentLocation;
@property (strong, nonatomic) CLLocation *lastUpdatedLocation;
@property (nonatomic,strong) NSString *currentLocAddress;

@property (nonatomic,strong) NSString *selectedAddress;
@property (nonatomic,strong) NSString *selectedLatitude;
@property (nonatomic,strong) NSString *selectedLongitude;

@property (nonatomic,strong) NSString *firstTimeChatSenderId;
@property (nonatomic,strong) NSString *firstTimeChatSenderStatus;


/** Date Formatter */
@property (nonatomic, strong) NSDateFormatter *formatter;

+ (VHTCommon *)sharedInstance;
+ (AFImageResponseSerializer *)imageSerialiser;

-(void)showTabbar:(BOOL)show;

//-(BOOL)CheckNetAvailability;

-(BOOL)isiPhone5;
-(BOOL)isiPad;

-(NSString *)getUniqueID:(NSString *)senderid;

-(NSString *)replaceNULLInputinitWithString:(NSString*)InputString;
-(BOOL)isNullString:(NSString*)_inputString;
- (NSString *)nullExceptionForString:(NSString *)inputStr;

-(float)getSystemVersion;
-(NSString*)getNibName:(NSString*)OriginalnibName;
-(NSString*)getImageName:(NSString*)OriginalImageName;
-(NSString*)getStoryboardName:(NSString*)storyboardname;

-(IBAction)buttonTouchDown:(id)sender;

-(UIImage*)setImageToImageView:(NSString*)imageName;
-(void)PushWithPopEffect:(UIView*)view;
-(void)PopWithPushEffect:(UIView *)view;
-(void)switchViewControllerWithFadeTransition:(UIView *)view;

-(void)enableWndowInteraction;
-(void)disableWindowInteraction;

+(NSString*)getNonEmptyString:(NSString *)value;

-(BOOL)ifContainChatViewController:(UINavigationController *)navcontroller;

+(NSString*)getSlashreplaceString:(NSString *)value;
+(NSString*)trimString:(NSString*)value;
+(CGFloat)heightForLabel:(UILabel *)label withText:(NSString *)text width:(CGFloat )width;
//+(void)PassWordMatch:(NSString *)strEmail strConfirmEmai:(UITextField*)txtconfirmEmail;
//+(void)Validatetextfield:(UITextField *)txtField;

-(NSString *)replaceString:(NSString *)stringToReplace;
-(NSString *)GetOriginalString:(NSString *)stringToReplace;

- (BOOL) validateEmail: (NSString *) checkString;

-(BOOL)isKeyInDictionary: (NSString *)key  dictionary:(NSDictionary *)dict;

-(NSString *)capitalizeFirstCharacter:(NSString *)categoryName;


-(CGSize)getLabelSizeFortext:(NSString *)text forWidth:(float)_width WithFont:(UIFont *)font;
-(CGSize)getAttributedSizeFortext:(NSMutableAttributedString *)text forWidth:(float)_width WithFont:(UIFont *)font;

-(UIImage *)resizeImage:(UIImage *)tImg targetSize:(CGSize)targetSize;

-(NSString *)replaceSpecialCharactersAndWhiteSpaces:(NSString *)message;

-(NSURL *)getImageURL:(NSString *)friendUrlString;

-(void)addNoNetworkViewOverView:(UIView *)inview OriginY:(CGFloat)originy;

-(void)removeNoNetworkViewFrombutton:(UIButton *)sender;

-(void)removeNoNetworkView:(UIView *)inview;

-(void)addChatNotificationViewOverView:(VHTConversationSectionDetails *)mDetails GroupId:(NSString *)groupId;

-(NSString *)getContactNo:(NSString *)_phnNo;

-(BOOL)ifContainRegistraionController:(UINavigationController *)nav class:(Class)_class;

-(void)initializeTranslator;
- (FGTranslator *)translator;
- (NSLocale *)currentLocale;
- (void)getSupportedLanguages;
//- (void)translateText:(NSString *)text;
- (void)detectLanguage:(NSString *)text withCompletion:(void (^)(NSString *detectedLang, NSError*error))completionHandler;
- (void)translateText:(NSString *)text withSourceLang:(NSString *)sourcelang withCompletion:(void (^)(NSString *transText, NSError*error))completionHandler;
-(void)GetCurrentlocation;
-(void)locationStopUpdating;
-(NSString *)GetCompleteAddress:(NSString *)address;

@property (nonatomic, strong) VHTSpinner *spinner;
- (void)showSpinner:(UIView *)superView parentView:(UIView *)parentView shouldDisableUserInteraction:(BOOL)shouldDisableUserInteraction;
- (void)hideSpinner:(UIView *)superView shouldRemoveParentView:(BOOL)shouldRemoveParentView;

#pragma mark - DocumentDirectory -
@property (strong, nonatomic) NSString *filePath;

#pragma mark -AlertView
-(void)showAlert:(NSString *)message actions:(NSArray *)actions completion:(void (^)(int))completion;

#pragma mark - CRToast
@property (strong, nonatomic) NSMutableDictionary *dicCRToastOptions;
- (UIImage *)fixrotation:(UIImage *)image;

#pragma mark - save file in Cache
-(void)saveFile:(NSData *)tumbImgData imagePath:(NSString*)_imagePath;
@end

extern float width(UIView *view);
extern float height(UIView *view);
extern float originX(UIView *view);
extern float originY(UIView *view);
extern void updateUserDefaults(NSString *key,NSString *value);
extern void deleteUserDefaults(NSString *key);
extern NSString *getUserDefaults(NSString *key);
extern BOOL isTextEmpty(NSString *text);
extern NSString *getContactName(VHTContactList *contact);

//DateTime Convertion

extern NSString *convertCurrentDateToGMT();
extern NSString *convertGMTDateToLocalDate(NSString *dateTime,NSString *dateFormat,BOOL showTime,BOOL showDate4Email);

NSString *randomID(NSString *type);

/*
extern NSString *timeStamp();
extern NSString *dateFromDateTimeInGMT(NSString *dateTime);
extern NSString *dateFromDateInLocal(NSString *dateTime);
extern NSString *timeFromDateInLocal(NSString *dateTime);
extern NSString *dateTimeFromTimeStampINGMT(NSString *timeStamp);
extern NSString *timeFromTimeStamp(NSString *timeStamp);
extern NSString *dateFromTimeStamp(NSString *timeStamp);
extern NSString *currentGmtTime();*/

extern NSString *getLocalTimeFromGMTTime(NSString *gmtTime,NSString *gmtFormat, NSString *dateFormat);
extern NSString *timeStampFromDate(NSString *dateTime,NSString *dateFormat);
extern NSString *convertTimestampToDateForWorkList(NSString *timestamp);
extern NSString *encodeEmojiString(NSString *actualString);
extern NSString *decodeEmojiString(NSString *encodedString);