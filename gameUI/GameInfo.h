//
//  GameInfo.h
//  ParseJSON
//
//  Created by xubo on 5/28 星期三.
//  Copyright (c) 2014年 xubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KeyBean.h"
#import <string.h>
@interface GameInfo : NSObject
{
    NSString *game_id;
    NSNumber *action;
    NSNumber *bgtouch;
    NSString *name;
    NSNumber *level;
    NSString *outpackagename;
    NSNumber *outpackagesize;
    NSString *outpackagepath;
    
    NSString *outpackageupdatetime;
    NSString *text;
    NSString *icon_url;
    NSString *showimg_url_one;
    NSString *showimg_url_two;
    NSString *loading_url;
    NSString *mouse_phone;
    NSString *pkg_name;
    NSString *target;
    NSNumber *sizes;
    NSString *updateTime;
    NSString *allText;
    NSString *img_zip_url;
    NSString *cut_imgurl_one;
    NSString *cut_imgurl_two;
    NSString *cut_imgurl_three;
    NSString *big_icon;
    NSString *img_zip_updatetime;
    NSString *mouse_down;
    NSString *mouse_up;
    
    NSNumber *contralmodel;
    NSString *target_updatetime;
    NSNumber *game_type;
    NSNumber *game_limit;
    NSNumber *game_capability;
    NSNumber *game_plays;
    NSNumber *game_issign;
    NSNumber *game_model;
    NSNumber *android_pkg_size;
    NSString *android_pkg_name;
    NSString *android_pkg_path;
    NSString *android_pkg_updatetime;
    NSString *itunes_path;
    NSString *itunes_updatetime;
    
    NSMutableArray *press;
    NSMutableArray *none_full_touch;
    NSMutableArray *full_touch;
    NSMutableArray *gravity;

}
- (GameInfo*)init;

//- (id) fetchGameInfo: (NSString*)game_id;
@property  (retain,nonatomic)  NSMutableArray *gravity;
@property  (retain,nonatomic)  NSMutableArray *none_full_touch;
@property  (retain,nonatomic)  NSMutableArray *full_touch;
@property  (retain,nonatomic)  NSMutableArray *press;
@property  (retain,nonatomic)  NSString *game_id;
@property  (retain,nonatomic)  NSNumber *action;
@property  (retain,nonatomic)  NSNumber *bgtouch;
@property  (retain,nonatomic)  NSString *name;
@property  (retain,nonatomic)  NSNumber *level;
@property  (retain,nonatomic)  NSString *outpackagename;
@property  (retain,nonatomic)  NSNumber *outpackagesize;
@property  (retain,nonatomic)  NSString *outpackagepath;
@property  (retain,nonatomic)  NSString *outpackageupdatetime;
@property  (retain,nonatomic)  NSString *text;
@property  (retain,nonatomic)  NSString *icon_url;
@property  (retain,nonatomic)  NSString *showimg_url_one;
@property  (retain,nonatomic)  NSString *showimg_url_two;
@property  (retain,nonatomic)  NSString *loading_url;
@property  (retain,nonatomic)  NSString *mouse_phone;
@property  (retain,nonatomic)  NSString *pkg_name;
@property  (retain,nonatomic)  NSString *target;
@property  (retain,nonatomic)  NSNumber *sizes;
@property  (retain,nonatomic)  NSString *updateTime;
@property  (retain,nonatomic)  NSString *allText;
@property  (retain,nonatomic)  NSString *img_zip_url;
@property  (retain,nonatomic)  NSString *cut_imgurl_one;
@property  (retain,nonatomic)  NSString *cut_imgurl_two;
@property  (retain,nonatomic)  NSString *cut_imgurl_three;
@property  (retain,nonatomic)  NSString *big_icon;
@property  (retain,nonatomic)  NSString *img_zip_updatetime;
@property  (retain,nonatomic)  NSString *mouse_down;
@property  (retain,nonatomic)  NSString *mouse_up;
@property  (retain,nonatomic)  NSNumber *contralmodel;
@property  (retain,nonatomic)  NSString *target_updatetime;
@property  (retain,nonatomic)  NSNumber *game_type;
@property  (retain,nonatomic)  NSNumber *game_limit;
@property  (retain,nonatomic)  NSNumber *game_capability;
@property  (retain,nonatomic)  NSNumber *game_plays;
@property  (retain,nonatomic)  NSNumber *game_issign;
@property  (retain,nonatomic)  NSNumber *game_model;
@property  (retain,nonatomic)  NSNumber *android_pkg_size;
@property  (retain,nonatomic)  NSString *android_pkg_name;
@property  (retain,nonatomic)  NSString *android_pkg_path;
@property  (retain,nonatomic)  NSString *android_pkg_updatetime;
@property  (retain,nonatomic)  NSString *itunes_path;
@property  (retain,nonatomic)  NSString *itunes_updatetime;

- (const char*) toJson;
@end
