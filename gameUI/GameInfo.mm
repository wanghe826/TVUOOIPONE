//
//  GameInfo.m
//  ParseJSON
//
//  Created by xubo on 5/28 星期三.
//  Copyright (c) 2014年 xubo. All rights reserved.
//

#import "GameInfo.h"

@implementation GameInfo

- (GameInfo*) init
{
    if(self=[super init])
    {
        press = [[NSMutableArray alloc ]init];
    }
    return (self);
}

- (void) dealloc
{
    [press release];
    [game_id release];
    [action release];
    [bgtouch release];
    [name release];
    [level release];
    [outpackagename release];
    [outpackagesize release];
    [outpackagepath release];
    [outpackageupdatetime release];
    [text release];
    [icon_url release];
    [showimg_url_one release];
    [showimg_url_two release];
    [loading_url release];
    [mouse_phone release];
    [pkg_name release];
    [target release];
    [sizes release];
    [updateTime release];
    [allText release];
    [img_zip_url release];
    [cut_imgurl_one release];
    [cut_imgurl_two release];
    [cut_imgurl_three release];
    [big_icon release];
    [img_zip_updatetime release];
    [mouse_down release];
    [mouse_up release];
    [contralmodel release];
    [target_updatetime release];
    [game_type release];
    [game_limit release];
    [game_capability release];
    [game_plays release];
    [game_issign release];
    [game_model release];
    [android_pkg_size release];
    [android_pkg_name release];
    [android_pkg_path release];
    [android_pkg_updatetime release];
    [itunes_path release];
    [itunes_updatetime release];
    [super dealloc];
}
@synthesize  full_touch;
@synthesize  none_full_touch;
@synthesize  gravity;
@synthesize  press;
@synthesize  game_id;
@synthesize  action;
@synthesize  bgtouch;
@synthesize  name;
@synthesize  level;
@synthesize  outpackagename;
@synthesize  outpackagesize;
@synthesize  outpackagepath;
@synthesize  outpackageupdatetime;
@synthesize  text;
@synthesize  icon_url;
@synthesize  showimg_url_one;
@synthesize  showimg_url_two;
@synthesize  loading_url;
@synthesize  mouse_phone;
@synthesize  pkg_name;
@synthesize  target;
@synthesize  sizes;
@synthesize  updateTime;
@synthesize  allText;
@synthesize  img_zip_url;
@synthesize  cut_imgurl_one;
@synthesize  cut_imgurl_two;
@synthesize  cut_imgurl_three;
@synthesize  big_icon;
@synthesize  img_zip_updatetime;
@synthesize  mouse_down;
@synthesize  mouse_up;
@synthesize  contralmodel;
@synthesize  target_updatetime;
@synthesize  game_type;
@synthesize  game_limit;
@synthesize  game_capability;
@synthesize  game_plays;
@synthesize  game_issign;
@synthesize  game_model;
@synthesize  android_pkg_size;
@synthesize  android_pkg_name;
@synthesize  android_pkg_path;
@synthesize  android_pkg_updatetime;
@synthesize  itunes_path;
@synthesize  itunes_updatetime;

- (const char*) toJson
{
//    NSString *json = [NSString stringWithFormat:@"{\"game_id\":\"%@\" , \"action\":%d , \"name\":\"%@\" , \"text\":\"%@\" , \"icon_url\":\"%@\" , \"showimg_url_one\":\" %@\" , \"showimg_url_two\":\"%@\" , \"pkg_name\":\"%@\" , \"big_icon\":\"cutImgUrlFour\" ,
//    \"target\":\"%@\" , \"sizes\":%d , \"game_type\":%d , \"game_limit\":%d , \"updateTime\":\" %@ }",game_id, [action intValue],
//    text, icon_url, showimg_url_one, showimg_url_two, pkg_name, big_icon, cut_imgurl_three, target, sizes, [game_type intValue],
//                      [game_limit intValue], updateTime];
    NSString *str1 = [NSString stringWithFormat:@"{\"game_id\":\"%@\"", game_id];
    NSString *str2 = [NSString stringWithFormat:@"\"action\":%d", [action intValue]];
    NSString *str3 = [NSString stringWithFormat:@"\"name\":\"%@\"", name];
    NSString *str4 = [NSString stringWithFormat:@"\"text\":\"%@\"", text];
    NSString *str5 = [NSString stringWithFormat:@"\"icon_url\":\"%@\"", icon_url];
    NSString *str6 = [NSString stringWithFormat:@"\"showimg_url_one\":\"%@\"", showimg_url_one];
    NSString *str7 = [NSString stringWithFormat:@"\"showimg_url_two\":\"%@\"", showimg_url_two];
    NSString *str8 = [NSString stringWithFormat:@"\"pkg_name\":\"%@\"", pkg_name];
    NSString *str9 = [NSString stringWithFormat:@"\"big_icon\":\"%@\"", big_icon];
    NSString *str10 = [NSString stringWithFormat:@"\"cutImgUrlFour\":\"%@\"", cut_imgurl_three];
    NSString *str11 = [NSString stringWithFormat:@"\"target\":\"%@\"", target];
    NSString *str12 = [NSString stringWithFormat:@"\"sizes\":%d", [sizes intValue]];
    NSString *str13 = [NSString stringWithFormat:@"\"game_type\":%d", [game_type intValue]];
    NSString *str14 = [NSString stringWithFormat:@"\"game_limit\":%d", [game_limit intValue]];
    NSString *str15 = [NSString stringWithFormat:@"\"updateTime\":\"%@\"}", updateTime];

    NSString *json = [NSString stringWithFormat:@"%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@", str1, str2, str3, str4, str5, str6, str7
                      ,str8, str9, str10, str11, str12, str13, str14, str15];
    const char* c_string = [json UTF8String];
    return c_string;
}
@end
