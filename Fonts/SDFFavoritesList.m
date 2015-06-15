//
//  SDFFavoritesList.m
//  Fonts
//
//  Created by De Fano Salvatore on 15/06/15.
//  Copyright (c) 2015 Yoox. All rights reserved.
//

#import "SDFFavoritesList.h"

@interface SDFFavoritesList ()@property (strong, nonatomic) NSMutableArray *favorites;


@end

@implementation SDFFavoritesList

+ (instancetype)sharedFavoritesList {
    static SDFFavoritesList *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSArray *storedFavorites = [defaults objectForKey:@"favorites"];
        if (storedFavorites) {
            self.favorites = [storedFavorites mutableCopy];
        } else {
            self.favorites = [NSMutableArray array];
        }
    }return self;
}

- (void)addFavorite:(id)item {
    [_favorites insertObject:item atIndex:0];
    [self saveFavorites];
}

- (void)removeFavorite:(id)item {
    [_favorites removeObject:item];
    [self saveFavorites];
}

- (void)saveFavorites {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.favorites forKey:@"favorites"];
    [defaults synchronize];
}

@end
