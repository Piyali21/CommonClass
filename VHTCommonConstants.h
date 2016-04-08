//
//  VHTCommonConstants.h
//  Vhortext
//
//  Created by Piyali Tarafder on 27/07/15.
//  Copyright (c) 2015 Piyali_iOS. All rights reserved.
//


#import <Foundation/Foundation.h>

#import "VHTCommon.h"
#import "AppDelegate.h"
#import "AFNetworking.h"

@protocol HHCCommonConstants <NSObject>

@end

#define DEBUG_VALUE     1
#define RELEASE_VALUE   0

#define DEBUG_MODE      1 // Change this value(1 or 0) to change your server. 0 for live & 1 for development server.

#define kIOS_AppLink @"Apple iTunes Link"
#define kAndroid_AppLink @"Google PlayStore Link"

//----- Font --------//
#define FONT_LIGHT(i)       [UIFont fontWithName:@"Roboto-Light" size:i]
#define FONT_REGULAR(i)     [UIFont fontWithName:@"Roboto-Regular" size:i]

#define REQUEST_TIMEOUT_INTERVAL 90

//http://10.0.0.99/Wachat/v1/
//125.22.76.78
//URLS
//#define VHT_WEBSERVICE_URL_BETA  @"http://125.22.76.78/Wachat/v1/"
#define VHT_WEBSERVICE_URL_BETA @"http://52.6.251.159/~mobapp2/Wachat/v1/" //"http://125.22.76.78/Wachat/v1/"
#define VHT_WEBSERVICE_URL_RELEASE @"http://svn.indusnettechnologies.com/Wachat/v1/"

//Chat Servers
#define VHT_XMPP_SERVER_HOST_BETA       @"162.250.121.118"
#define VHT_XMPP_SERVER_HOST_RELEASE    @"185.3.152.109"

#define VHT_XMPP_SERVER_SECRET_BETA     @"pzao0Hb9"
#define VHT_XMPP_SERVER_SECRET_RELEASE  @"SPj6y0I4"

#define VHT_XMPP_SERVER_DOMAIN_BETA     @"iscoveri.com"
#define VHT_XMPP_SERVER_DOMAIN_RELEASE  @"10.128.130.166"

#if DEBUG_MODE==DEBUG_VALUE
#define VHT_WEBSERVICE_URL              VHT_WEBSERVICE_URL_BETA
#define VHT_XMPP_SERVER_HOST            VHT_XMPP_SERVER_HOST_BETA
#define VHT_XMPP_SERVER_SECRET          VHT_XMPP_SERVER_SECRET_BETA
#define VHT_XMPP_SERVER_DOMAIN          VHT_XMPP_SERVER_DOMAIN_BETA
#else
#define VHT_WEBSERVICE_URL              VHT_WEBSERVICE_URL_RELEASE
#define VHT_XMPP_SERVER_HOST            VHT_XMPP_SERVER_HOST_RELEASE
#define VHT_XMPP_SERVER_SECRET          VHT_XMPP_SERVER_SECRET_RELEASE
#define VHT_XMPP_SERVER_DOMAIN          VHT_XMPP_SERVER_DOMAIN_RELEASE
#endif

// API Endpoints
#define kAPIEndPointCountryList                 @"CountryList"
#define kAPIEndPointRegistration                @"RegisterUser"
#define kAPIEndPointValidateUser                @"ValidateUser"
#define kAPIEndPointContactList                 @"ContactList"
#define KAPIEndPointRegisterChatUser            @"RegisterChat"
#define KAPIEndPointUpdateStatus                @"UpdateStatus"
#define KAPIEndPointValidateUserSession         @"ValidateUserSession"
#define KAPIEndPointRESENDOTP                   @"ResendOTP"
#define KAPIEndPointLeaveGroup                  @"LeaveGroup"
#define KAPIEndPointFriendProfile               @"FriendProfile"
#define KAPIEndPointCreateOrUpdateGroup         @"CreateAndEditGroup"
#define KAPIEndPointEditProfile                 @"EditProfile"
#define KAPIEndPointBlockUser                   @"BlockUser"
#define KAPIEndPointFavUser                     @"FavoriteUser"
#define KAPIEndPointFileUpload                  @"FileUpload"
#define KAPIEndPointInviteFriend                @"InviteFriend"
#define KAPIEndPointDeleteAccount               @"DeleteAccount"
#define KAPIEndPointSendNotification            @"SendNotification"
#define KAPIEndPointFindMeByLocation            @"FindMeByMyLocation"
#define KAPIEndPointFindMeByPhoneno             @"FindMeByMyPhoneNumber"
#define KAPIEndPointUserTranslate               @"userTranslate"
#define KAPIEndPointSearchUser                  @"searchuser"
#define KAPIEndPointUpdateUserLocation          @"UpdateUserLocation"
#define KAPIEndPointSendMail                    @"sendmail"
#define KAPIEndPointGroupAdminAction            @"groupAdminAction"
#define KAPIEndPointSetFriendStatus             @"setFriendStatus"


#define kAPI_KEY                @"hgfyhfyi87hgc67"
#define kDEVICE_TYPE            @"IOS"

#define DOC_PATH(path)[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:path]

#ifdef DEBUG
#define DebugLog(s, ...) NSLog(s, ##__VA_ARGS__)
#else
#define DebugLog(s, ...)
#endif

// Data base file name.
#define kDATABASE_NAME          @"Vhortext.sqlite"
#define kTEMP_DATADASE_NAME     @"Vhortext_New.sqlite"

#define kUSER_ID                        @"userId"
#define kVerificationCode               @"verificationCode"
#define kPairingDevice                  @"pairingDevice"
#define kNonValidatedPhoneNumber        @"nonValidatedNumber"
#define kNonValidatedCountryCode        @"nonValidatedCountryCode"
#define kNonValidatedCountryName        @"nonValidatedCountryName"
#define kValidatedPhoneNumber           @"validatedNumber"

#define KEYCHAIN_KEY            @"deviceId"
#define KEYCHAIN_SERVICE_NAME   @"vhortextDevices"
#define kDeviceToken            @"deviceToken"

#define kContactTimeStamp       @"contactTimeStamp"

#define kShowTabBar             @"showTabBar"

#define kNetworkAvailableNotification       @"networkAvailable"

//----- Seague Identifiers ------//
#define kSplashToRegistrationNoAnimation                @"splashToRegistrationNoAnimation"
#define kRegistrationToCountryList                      @"registrationToCountryList"
#define kRegisterToAuthentication                       @"registerToAuthenticationController"
#define kRegisterToAuthenticationNonAnimated            @"registerToAuthenticationControllerNonAnimated"
#define kAuthenticationToDashboard                      @"authenticationToDashboardController"
#define kAuthenticationToDashboardNonAnimated           @"authenticationToDashboardControllerNonAnimated"
#define kConversationToConversationHistory              @"conversationToConversationHistory"
#define kConversationHistoryToAssetPhotoGallery         @"conversationHistoryToAssetPhotoGallery"
#define kPhotoGalleryToCaptionController                @"photoGalleryToCaptionController"
#define kContactToConversationHistory                   @"contactToConversationHistory"
#define kMoreItemToSettingsController                   @"moreItemToSettingsController"
#define kMoreItemToUpdateStatusController               @"moreItemToUpdateStatusController"
#define kMoreItemToBlockUserController                  @"moreItemToBlockUserController"
#define kConversationHistoryToGroupDetails              @"conversationHistoryToGroupDetails"
#define kConversationHistoryToSketch                    @"conversationHistoryToSketch"
#define kConversationHistoryToYoutube                   @"conversationHistoryToYoutube"
#define KConversationHistoryToYahooNewsController       @"conversationHistoryToYahooNewsController"
#define kMoreItemsToInviteFriendListController          @"moreItemToInviteFriendListController"
#define kMoreItemsToEditProfileScreenController         @"moreItemToEditProfileScreenController"
#define kGroupItemToNewGroupController                  @"groupItemToNewGroupController"
#define kGroupItemToGroupScreenParticipantController    @"groupItemToGroupScreenParticipantController"
#define kFindPeopleControllerToChoosePeopleController   @"findPeopleControllerToChoosePeopleController"
#define kFindPeopleToSettingController                  @"findPeopleToSettingController"
#define kContactScreenToFindPeopleController            @"contactScreenToFindPeopleController"
#define kFindPeopleControllerToSetLocationController    @"findPeopleControllerToSetLocationController"
#define kSetLocationControllerToChoosePeopleController  @"setLocationControllerToChoosePeopleController"
#define kFavoriteToConversationHistory                  @"favoriteToConversationHistory"
#define kSingleConversationToConversationHistory        @"singleConversationToConversationHistory"
#define kGroupConversationToConversationHistory         @"groupConversationToConversationHistory"
#define kconversationHistoryToFriendProfile             @"conversationHistoryToFriendProfile"
#define kBlockControllerToFriendProfile                 @"blockControllerToFriendProfile"
#define KSettingsToSettingsAbout                        @"settingsToSettingsAbout"
#define KSettingsToSettingsHelpFAQ                      @"settingsToSettingsHelpFAQ"
#define KSettingsToSettingsCopyrightInfo                @"settingsToSettingsCopyrightInfo"
#define KConversationHistoryToCaptionControlle          @"conversationHistoryToCaptionControlle"
#define KConversationHistoryToSendContactController     @"conversationHistoryToSendContactController"
#define KConversationHistoryToAddContactController      @"conversationHistoryToAddContactController"
#define KConversationHistoryToChooseLocationController  @"conversationHistoryToChooseLocationController"
#define KConversationHistoryToViewLocationController    @"conversationHistoryToViewLocationController"
#define KChoosePeopleToconversationHistoryController    @"choosePeopleToconversationHistoryController"
#define kSetLocationToconversationHistoryController     @"setLocationToconversationHistoryController"
#define KSettingsToSettingsContactUs                    @"settingsToSettingsContactUs"
#define KGroupDetailToFriendProfile                     @"groupDetailToFriendProfile"
#define KConversationHistoryToPhotoCaption              @"conversationHistoryToPhotoCaption"
#define KGroupDetailsToEditGroupController              @"groupDetailsToEditGroupController"


#define kCHAT_TYPE_MESSAGE          @"Message"
#define kCHAT_TYPE_CONTACTS         @"Contact_Details"
#define kCHAT_TYPE_LOCATIONS        @"Location_Details"
#define kCHAT_TYPE_IMAGE            @"Photo_Details"
#define kCHAT_TYPE_VIDEO            @"Video_Details"
#define kCHAT_TYPE_AUDIO            @"Audio_Details"
#define CHAT_DATE_FORMAT            @"MM-dd-yyyy HH:mm:ss"

#define kCHAT_TYPE_CHAT             @"Chat"
#define kCHAT_TYPE_GROUP            @"Group"
#define kCHAT_TYPE_BROADCAST        @"Broadcast"
///--- User Authentication ---///

#define kUserValidated                  @"userValidated"
#define kUserRegistered                 @"userRegistered"

#define TIMEOUT_ALERT_BODY @"Time out alert body"
#define SERVER_Error_ALERT_BODY @"Error occurred."

#define SERVER_CONNECTION_FAILURE_ALERT_BODY @"Server connection failure alert body"

#define SOME_UNKNOWN_ERROR @"Unknown error occured.\n Please try again later."

#define NONETWORK_TEXT @"No network text"

#define YOUHAVECREATEDTHISGROUP @"You have created this group"
#define YOUAREADDEDTOTHISGROUP(GroupName)  [NSString stringWithFormat:@"You are added to this group: %@",GroupName]

#define CacheDirectory [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define DOCUMENT_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define THUMBNAIL_PATH(path) [[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Thumbnail"] stringByAppendingPathComponent:path]

#define allTrim( object ) [object stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] ]

#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

#define BACK_BUTTON_TAG                     10001

#define MAX_NO_OF_SELECTED_ITEMS            10
#define MAX_CAPTION_LENGTH                  60
#define MAX_STATUS_LENGTH                   30

#define kAlert_Location_Authorize_Tag       110

#define kMediaTypeAudio                 @"Audio"
#define kMediaTypeVideo                 @"Video"
#define kMediaTypeImage                 @"Image"

#define kChatTypeOneToOne               @"Chat"
#define kChatTypeGroup                  @"Group"

#define kMessageTypeMessage             @"Message"
#define kMessageTypeAudio               @"Audio"
#define kMessageTypeImage               @"Image"
#define kMessageTypeSketch              @"Sketch"
#define kMessageTypeVideo               @"Video"
#define kMessageTypeLocation            @"Location"
#define kMessageTypeContact             @"Contact"
#define kMessageTypeImageCaption        @"ImageCaption"
#define kMessageTypeYouTube             @"YouTube"
#define kMessageTypeYahoo               @"Yahoo"
#define kMessageTypeFirstTimeChat       @"FirstTimeChat"

#define userDefNotFirstTime             @"userdefnotfirsttime"
#define userDefUserAllowContact         @"userallowcontact"
#define userDefUserPhoneNo              @"userphoneno"
#define userDefUserID                   @"userid"
#define userDefFindLocation             @"userFindLocation"
#define userDefFindPhoneNo              @"userFindPhoneNo"


#define notifyConversationCellReload    @"conversationcellreload"
#define notifyChatCellReload            @"chatcellreload"
#define notifyChatCellAdded             @"chatcelladded"
#define notifyGroupUpdated              @"groupAdded"
#define notifyLogOutUser                @"logOutUser"
#define notifyXMPPConnectionChanged     @"connectionChanged"
#define notifyNetworkChanged            @"networkchanged"
#define notifyMultipleImageFetched      @"imageFetched"
#define notifyXMPPTypingStatusChanged   @"notifyXMPPTypingStatusChanged"
#define notifyCallApiToCreateGroup      @"callCreateGroupApi"

#define notifyNoNetwork                 @"kNoNetwork"
#define notifyNetworkAvailable          @"kNetworkAvailable"


#define timeFormat                      @"hh:mm a"
#define dateFormatForChat               @"MMM dd, yyyy"
#define dateFormatForConvrList          @"MM-dd-yyyy"
#define dateFormatForGMT                @"yyyy-MM-dd HH:mm:ss"
#define onlyDateFormatForGMT            @"yyyy-MM-dd"


#define kUpdateChatBadgeCount           @"updateBadgeValue"
#define kUpdateGroupDetails             @"updateGroupDetails"


#pragma mark -
#pragma mark - Sketch View 

#define kDefaultLineColor        [UIColor redColor];
#define kDefaultLineWidthPen     4.0f;
#define kDefaultLineWidthBrush   8.0f;


#pragma mark -
#pragma mark - Notification
#define Add_Observer_Notification(parent,Selector_Name,Notification_Name,_object) [[NSNotificationCenter defaultCenter]addObserver:parent selector:@selector(Selector_Name:) name:Notification_Name object:_object];

#define Remove_Observer_Notification(parent,Notification_Name,_object) [[NSNotificationCenter defaultCenter]removeObserver:parent name:Notification_Name object:_object];

#define Post_Notification(Notification_Name,_object) [[NSNotificationCenter defaultCenter]postNotificationName:Notification_Name object:_object];


// First Time Chat

#define JSON_FOR_FIRST_TIME_CHAT_TEXT(t,b,mid,type,online,lang,phnNo,userid,stickertype) [NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"singlechat\",\"senderid\" :\"%@\", \"first_time_sticker_detail\" :{\"sticker_type\" : \"%@\"}}",t,b,mid,type,online,lang,phnNo,userid,stickertype]

#define JSON_FOR_FIRST_TIME_CHAT_ACCEPT(mid,phnNo,sName,sid,schatid) [NSString stringWithFormat:@"{\"messageid\" :\"%@\",\"senderphone\" :\"%@\",\"sendername\" :\"%@\",\"senderid\" :\"%@\",\"senderchatid\" :\"%@\",\"type\" :\"FirstTimeChatAccepted\"}",mid,phnNo,sName,sid,schatid]


// Single Chat

#define JSON_FOR_SINGLE_CHAT_TEXT(t,b,mid,type,online,lang,phnNo,userid) [NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"singlechat\",\"senderid\" :\"%@\"}",t,b,mid,type,online,lang,phnNo,userid]

#define JSON_FOR_DELIVERY_STATUS(mid,status) [NSString stringWithFormat:@"{\"messageid\" :\"%@\", \"type\" :\"deliverystatus\" , \"deliverystatus\" : \"%@\"}",mid,status]

#define JSON_FOR_SINGLE_CHAT_IMAGE(t,b,mid,type,online,lang,phnNo,userid,b64Str,imgUrl,ismasked)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"singlechat\",\"senderid\" :\"%@\", \"Photo_Details\" :{\"Thumb_Base64\" : \"%@\", \"Image_Url\" : \"%@\" , \"ismasked\" : \"%@\"}}",t,b,mid,type,online,lang,phnNo,userid,b64Str,imgUrl,ismasked];

#define JSON_FOR_SINGLE_CHAT_CONTACT(t,b,mid,type,online,lang,phnNo,userid,attachName,attachPhnNo,b64Str)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"singlechat\",\"senderid\" :\"%@\", \"Contact_Details\" : {\"Name\" : \"%@\", \"Phone_Number\" : \"%@\", \"ImageStr\" : \"%@\"}}",t,b,mid,type,online,lang,phnNo,userid,attachName,attachPhnNo,b64Str];

#define JSON_FOR_SINGLE_CHAT_LOCATION(t,b,mid,type,online,lang,phnNo,userid,address,lat,lng)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"singlechat\",\"senderid\" :\"%@\", \"Location_Details\" : {\"address\" : \"%@\", \"latitude\" : \"%f\", \"longitude\" : \"%f\"}}",t,b,mid,type,online,lang,phnNo,userid,address,lat,lng];

#define JSON_FOR_SINGLE_CHAT_VIDEO(t,b,mid,type,online,lang,phnNo,userid,b64Str,videoUrl)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"singlechat\",\"senderid\" :\"%@\", \"Video_Details\" :{\"Thumb_Base64\" : \"%@\", \"Video_Url\" : \"%@\"}}",t,b,mid,type,online,lang,phnNo,userid,b64Str,videoUrl];

#define JSON_FOR_SINGLE_CHAT_VIDEO(t,b,mid,type,online,lang,phnNo,userid,b64Str,videoUrl)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"singlechat\",\"senderid\" :\"%@\", \"Video_Details\" :{\"Thumb_Base64\" : \"%@\", \"Video_Url\" : \"%@\"}}",t,b,mid,type,online,lang,phnNo,userid,b64Str,videoUrl];

#define JSON_FOR_SINGLE_CHAT_YAHOO(t,b,mid,type,online,lang,phnNo,userid,attachtitle,attachdate,description,thumbnailurl,newsurl)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"singlechat\",\"senderid\" :\"%@\", \"Yahoo_Details\" : {\"Title\" : \"%@\", \"Date_of_publication\" : \"%@\", \"Description\" : \"%@\", \"ThumbnailUrlStr\" : \"%@\", \"NewsUrlStr\" : \"%@\"}}",t,b,mid,type,online,lang,phnNo,userid,attachtitle,attachdate,description,thumbnailurl,newsurl];

#define JSON_FOR_SINGLE_CHAT_YOUTUBE(t,b,mid,type,online,lang,phnNo,userid,attachtitle,attachmentdate,attachDescription,thumbnailurl,videourl)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"singlechat\",\"senderid\" :\"%@\", \"YouTube_Details\" : {\"Title\" : \"%@\", \"Date_of_publication\" : \"%@\", \"Description\" : \"%@\", \"ThumbnailUrlStr\" : \"%@\", \"VideoUrlStr\" : \"%@]\"}}",t,b,mid,type,online,lang,phnNo,userid,attachtitle,attachmentdate,attachDescription,thumbnailurl,videourl];


#define JSON_FOR_CHAT_STATUS(userid,chattype) [NSString stringWithFormat:@"{\"senderid\" :\"%@\",\"type\" :\"status\",\"chattype\":\"%@\"}",userid,chattype]


// Group Caht

#define JSON_FOR_GROUP_CHAT_TEXT(t,b,mid,type,online,lang,phnNo,userid,groupid) [NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"groupchat\",\"senderid\" :\"%@\",\"groupid\" :\"%@\"}",t,b,mid,type,online,lang,phnNo,userid,groupid]

#define JSON_FOR_DELIVERY_STATUS(mid,status) [NSString stringWithFormat:@"{\"messageid\" :\"%@\", \"type\" :\"deliverystatus\" , \"deliverystatus\" : \"%@\"}",mid,status]

#define JSON_FOR_GROUP_CHAT_IMAGE(t,b,mid,type,online,lang,phnNo,userid,groupid,b64Str,imgUrl,ismasked)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"groupchat\",\"senderid\" :\"%@\",\"groupid\" :\"%@\", \"Photo_Details\" :{\"Thumb_Base64\" : \"%@\", \"Image_Url\" : \"%@\" , \"ismasked\" : \"%@\"}}",t,b,mid,type,online,lang,phnNo,userid,groupid,b64Str,imgUrl,ismasked];

#define JSON_FOR_GROUP_CHAT_VIDEO(t,b,mid,type,online,lang,phnNo,userid,groupid,b64Str,videoUrl)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"groupchat\",\"senderid\" :\"%@\",\"groupid\" :\"%@\", \"Video_Details\" :{\"Thumb_Base64\" : \"%@\", \"Video_Url\" : \"%@\"}}",t,b,mid,type,online,lang,phnNo,userid,groupid,b64Str,videoUrl];


#define JSON_FOR_GROUP_CHAT_CONTACT(t,b,mid,type,online,lang,phnNo,userid,groupid,attachName,attachPhnNo,b64Str)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"groupchat\",\"senderid\" :\"%@\",\"groupid\" :\"%@\", \"Contact_Details\" : {\"Name\" : \"%@\", \"Phone_Number\" : \"%@\", \"ImageStr\" : \"%@\"}}",t,b,mid,type,online,lang,phnNo,userid,groupid,attachName,attachPhnNo,b64Str];

#define JSON_FOR_GROUP_CHAT_LOCATION(t,b,mid,type,online,lang,phnNo,userid,groupid,address,lat,lng)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"groupchat\",\"senderid\" :\"%@\",\"groupid\" :\"%@\", \"Location_Details\" : {\"address\" : \"%@\", \"latitude\" : \"%f\", \"longitude\" : \"%f\"}}",t,b,mid,type,online,lang,phnNo,userid,groupid,address,lat,lng];

#define JSON_FOR_GROUP_CHAT_YAHOO(t,b,mid,type,online,lang,phnNo,userid,groupid,attachtitle,attachdate,description,thumbnailurl,newsurl)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"groupchat\",\"senderid\" :\"%@\",\"groupid\" :\"%@\", \"Yahoo_Details\" : {\"Title\" : \"%@\", \"Date_of_publication\" : \"%@\", \"Description\" : \"%@\", \"ThumbnailUrlStr\" : \"%@\", \"NewsUrlStr\" : \"%@\"}}",t,b,mid,type,online,lang,phnNo,userid,groupid,attachtitle,attachdate,description,thumbnailurl,newsurl];

#define JSON_FOR_GROUP_CHAT_YOUTUBE(t,b,mid,type,online,lang,phnNo,userid,groupid,attachtitle,attachmentdate,attachDescription,thumbnailurl,videourl)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"groupchat\",\"senderid\" :\"%@\",\"groupid\" :\"%@\", \"YouTube_Details\" : {\"Title\" : \"%@\", \"Date_of_publication\" : \"%@\", \"Description\" : \"%@\", \"ThumbnailUrlStr\" : \"%@\", \"VideoUrlStr\" : \"%@]\"}}",t,b,mid,type,online,lang,phnNo,userid,groupid,attachtitle,attachmentdate,attachDescription,thumbnailurl,videourl];


/*#define JSON_FOR_SINGLE_CHAT_TEXT(t,b,mid,type,online,lang,phnNo,countryCode) [NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"singlechat\", \"countryCode\":\"%@\"}",t,b,mid,type,online,lang,phnNo,countryCode]
 
 #define JSON_FOR_DELIVERY_STATUS(mid,status) [NSString stringWithFormat:@"{\"messageid\" :\"%@\", \"type\" :\"deliverystatus\" , \"deliverystatus\" : \"%@\"}",mid,status]
 
 #define JSON_FOR_SINGLE_CHAT_IMAGE(t,b,mid,type,online,lang,phnNo,countryCode,b64Str,imgUrl)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"singlechat\", \"countryCode\":\"%@\" \"Photo_Details\" :{\"Thumb_Base64\" : \"%@\", \"Image_Url\" : \"%@\"}}",t,b,mid,type,online,lang,phnNo,countryCode,b64Str,imgUrl];
 
 #define JSON_FOR_SINGLE_CHAT_CONTACT(t,b,mid,type,online,lang,phnNo,countryCode,attachName,attachPhnNo,b64Str)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"singlechat\", \"countryCode\":\"%@\", \"Contact_Details\" : {\"Name\" : \"%@\", \"Phone_Number\" : \"%@\", \"ImageStr\" : \"%@\"}}",t,b,mid,type,online,lang,phnNo,countryCode,attachName,attachPhnNo,b64Str];
 
 #define JSON_FOR_SINGLE_CHAT_LOCATION(t,b,mid,type,online,lang,phnNo,contryCode,address,lat,lng)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"singlechat\", \"countryCode\":\"%@\", \"Location_Details\" : {\"address\" : \"%@\", \"latitude\" : \"%f\", \"longitude\" : \"%f\"}}",t,b,mid,type,online,lang,phnNo,contryCode,address,lat,lng];
 
 #define JSON_FOR_SINGLE_CHAT_VIDEO(t,b,mid,type,online,lang,phnNo,countryCode,b64Str,imgUrl)[NSString stringWithFormat:@"{\"timestamp\":\"%@\", \"messagebody\" :\"%@\", \"messageid\" :\"%@\", \"chattype\" :\"%@\", \"online\" :\"%@\", \"lang\" :\"%@\", \"senderphone\" :\"%@\", \"type\" :\"singlechat\", \"countryCode\":\"%@\" \"Photo_Details\" :{\"Thumb_Base64\" : \"%@\", \"Image_Url\" : \"%@\"}}",t,b,mid,type,online,lang,phnNo,countryCode,b64Str,imgUrl];*/
