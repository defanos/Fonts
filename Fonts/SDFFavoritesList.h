//
//  SDFFavoritesList.h
//  Fonts
//
//  Created by De Fano Salvatore on 15/06/15.
//  Copyright (c) 2015 Yoox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDFFavoritesList : NSObject

+ (instancetype)sharedFavoritesList;

- (NSArray *)favorites;
- (void)addFavorite:(id)item;
- (void)removeFavorite:(id)item;

@end
