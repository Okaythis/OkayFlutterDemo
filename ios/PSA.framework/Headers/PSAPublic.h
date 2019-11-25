//
//  PSAPublic.h
//  PSA
//
//  Created by Pivulski, Nikolai on 28.06.2018.
//

#import <Foundation/Foundation.h>
#import <PSACommon/PSACommon.h>
#import "PSATenant.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^PSAUnlinkCompletionBlock)(PSASharedStatuses status, NSNumber *tenantId);
typedef void (^PSALinkCompletionBlock)(PSASharedStatuses status, PSATenant *tenant);

@interface PSA : NSObject
+ (void)reset;

+ (void)updateDeviceToken:(NSString *)deviceToken;
+ (BOOL)isReadyForEnrollment;
+ (BOOL)isEnrolled;
+ (void)startEnrollmentWithHost:(nullable NSString *)host
                 installationId:(nullable NSString *)installationId
                   pubPssBase64:(nullable NSString *)pubPssBase64
                   idCompletion:(void (^)(PSASharedStatuses))completion;

+ (BOOL)isReadyForAuthorization;
+ (void)startAuthorizationWithTheme:(nullable PSATheme *)theme
                          sessionId:(nullable NSNumber *)sessionId
                         completion:(void (^)(BOOL, PSASharedStatuses))completion;
+ (void)onApplicationWillResignActive:(UIApplication *)application;
+ (void)onApplicationWillEnterForeground:(UIApplication *)application;

+ (void)linkTenantWithLinkingCode:(NSString *)linkingCode
                       completion:(void (^)(PSASharedStatuses, PSATenant*))completion;
+ (void)unlinkTenantWithTenantId:(NSNumber *)tenantId
                      completion:(void (^)(PSASharedStatuses, NSNumber*))completion;
+ (void)updateTenantWithTenantId:(NSNumber *)tenantId
                      completion:(void (^)(PSASharedStatuses, PSATenant*))completion;


@end
NS_ASSUME_NONNULL_END
