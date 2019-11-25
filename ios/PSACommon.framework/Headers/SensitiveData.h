//
//  SensitiveData.h
//  PSA
//
//  Created by Sadovsky, Aleksandr on 7/31/18.
//

#import <Foundation/Foundation.h>
#import "PSASecretKey.h"

@interface SensitiveData : NSObject
@property (strong, readonly, nullable) PSASecretKey *prvClient;
@property (strong, readonly, nullable) PSASecretKey *pubSps;
@property (copy, readonly, nullable) NSString *appInstanceId;
NS_ASSUME_NONNULL_BEGIN
- (instancetype)initWithPrvClient:(nullable PSASecretKey *)prvClient
                           pubSps:(nullable PSASecretKey *)pubSps
                    appInstanceId:(nullable NSString *)appInstanceId;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionary;
@end
NS_ASSUME_NONNULL_END
