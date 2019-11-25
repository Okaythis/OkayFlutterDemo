//
//  PSATenant.h
//  PSA
//
//  Created by Bulat, Maksim on 9/12/19.
//

#import <Foundation/Foundation.h>
#import <PSACommon/PSACommon.h>

NS_ASSUME_NONNULL_BEGIN

@interface PSATenant : NSObject
@property (nullable) NSString* name;
@property (nullable) NSNumber* tenantId;
@property (nullable) PSATheme* theme;

- (instancetype)initWithTenantName:(nullable NSString *)name
                          tenantId:(nullable NSNumber *)tenantId
                             theme:(nullable PSATheme *)theme;
@end

NS_ASSUME_NONNULL_END
