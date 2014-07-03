//
//  ParseJson.m
//  ConnTest
//
//  Created by xubo on 5/27 星期二.
//  Copyright (c) 2014年 xubo. All rights reserved.
//

#import "ParseJson.h"
#import "GameInfo.h"

@implementation ParseJson




+ (GameInfo*)  parseJson:(NSDictionary*)dic
{
    GameInfo *gameInfo = [[GameInfo alloc] init];

    for(id key in dic)
    {
        

//        if([key isEqual: @"press"])
//        {
//            [gameInfo setPress:[dic objectForKey:key]];
//        }

        if([key isEqual: @"game_id"])
        {
            [gameInfo setGame_id:[dic objectForKey:key]];
        }
        if([key isEqual: @"action"])
        {
            [gameInfo setAction:[dic objectForKey:key]];
        }
        if([key isEqual: @"bgtouch"])
        {
            [gameInfo setBgtouch:[dic objectForKey:key]];
        }
        if([key isEqual: @"name"])
        {
            [gameInfo setName:[dic objectForKey:key]];
        }
        if([key isEqual:@"level"])
        {
            [gameInfo setLevel:[dic objectForKey:key]];
        }
        if([key isEqual:@"itunes_updatetime"])
        {
            [gameInfo setItunes_updatetime:[dic objectForKey:key]];
        }
        if([key isEqual:@"target"])
        {
            [gameInfo setTarget:[dic objectForKey:key]];
        }
        if([key isEqual:@"game_issign"])
        {
            [gameInfo setGame_issign:[dic objectForKey:key]];
        }
        if([key isEqual:@"text"])
        {
            [gameInfo setText:[dic objectForKey:key]];
        }
        if([key isEqual:@"game_plays"])
        {
            [gameInfo setGame_plays:[dic objectForKey:key]];
        }
        if([key isEqual:@"outpackagesize"])
        {
            [gameInfo setOutpackagesize:[dic objectForKey:key]];
        }
        if([key isEqual:@"img_zip_url"])
        {
            [gameInfo setImg_zip_url:[dic objectForKey:key]];
        }
        if([key isEqual:@"img_zip_updatetime"])
        {
            [gameInfo setImg_zip_updatetime:[dic objectForKey:key]];
        }
        if([key isEqual:@"contralmodel"])
        {
            [gameInfo setContralmodel:[dic objectForKey:key]];
        }
        if([key isEqual:@"itunes_path"])
        {
            [gameInfo setItunes_path:[dic objectForKey:key]];
        }
        if([key isEqual:@"cut_imgurl_two"])
        {
            [gameInfo setCut_imgurl_two:[dic objectForKey:key]];
        }
        if([key isEqual:@"cut_imgurl_one"])
        {
            [gameInfo setCut_imgurl_one:[dic objectForKey:key]];
        }
        if([key isEqual:@"cut_imgurl_three"])
        {
            [gameInfo setCut_imgurl_three:[dic objectForKey:key]];
        }
        if([key isEqual:@"mouse_up"])
        {
            [gameInfo setMouse_up:[dic objectForKey:key]];
        }
        if([key isEqual:@"mouse_down"])       
        {
            [gameInfo setMouse_down:[dic objectForKey:key]];
        }
        if([key isEqual:@"outpackagepath"])
        {
            [gameInfo setOutpackagepath:[dic objectForKey:key]];
        }
        if([key isEqual:@"game_model"])
        {
            [gameInfo setGame_model:[dic objectForKey:key]];
        }
        if([key isEqual:@"outpackageupdatetime"])
        {
            [gameInfo setOutpackageupdatetime:[dic objectForKey:key]];
        }
        if([key isEqual:@"target_updatetime"])
        {
            [gameInfo setTarget_updatetime:[dic objectForKey:key]];
        }
        if([key isEqual:@"name"])
        {
            [gameInfo setName:[dic objectForKey:key]];
        }
        if([key isEqual:@"loading_url"])
        {
            [gameInfo setLoading_url:[dic objectForKey:key]];
        }
        if([key isEqual:@"big_icon"])
        {
            [gameInfo setBig_icon:[dic objectForKey:key]];
        }
        if([key isEqual:@"mouse_phone"])
        {
            [gameInfo setMouse_phone:[dic objectForKey:key]];
        }
        if([key isEqual:@"mouse_down"])
        {
            [gameInfo setMouse_down:[dic objectForKey:key]];
        }
        if([key isEqual:@"game_limit"])
        {
            [gameInfo setGame_limit:[dic objectForKey:key]];
        }
        if([key isEqual:@"game_capability"])
        {
            [gameInfo setGame_capability:[dic objectForKey:key]];
        }
        if([key isEqual:@"outpackagename"])
        {
            [gameInfo setOutpackagename:[dic objectForKey:key]];
        }
        if([key isEqual:@"sizes"])
        {
            [gameInfo setSizes:[dic objectForKey:key]];
        }
        if([key isEqual:@"showimg_url_two"])
        {
            [gameInfo setShowimg_url_two:[dic objectForKey:key]];
        }
        if([key isEqual:@"showimg_url_one"])
        {
            [gameInfo setShowimg_url_one:[dic objectForKey:key]];
        }
        if([key isEqual:@"updateTime"])
        {
            [gameInfo setUpdateTime:[dic objectForKey:key]];
        }
        if([key isEqual:@"allText"])
        {
            [gameInfo setAllText:[dic objectForKey:key]];
        }
        if([key isEqual:@"android_pkg_name"])
        {
            [gameInfo setAndroid_pkg_name:[dic objectForKey:key]];
        }
        if([key isEqual:@"android_pkg_path"])
        {
            [gameInfo setAndroid_pkg_path:[dic objectForKey:key]];
        }
        if([key isEqual:@"android_pkg_size"])
        {
            [gameInfo setAndroid_pkg_size:[dic objectForKey:key]];
        }
        if([key isEqual:@"pkg_name"])
        {
            [gameInfo setPkg_name:[dic objectForKey:key]];
        }
        if([key isEqual:@"icon_url"])
        {
            [gameInfo setIcon_url:[dic objectForKey:key]];
        }
        if([key isEqual:@"game_type"])
        {
            [gameInfo setGame_type:[dic objectForKey:key]];
        }
        if([key isEqual:@"press"])
        {
            NSArray *array = [dic objectForKey:key];
            for(int i = 0; i<[array count]; i++)
            {
                KeyBean *keyBean = [ParseJson parseKeyBean:[array objectAtIndex:i]];
                [[gameInfo press] addObject:keyBean];
                
//                NSLog(@"%d.............",[array count]);
            }
        }
        if([key isEqual:@"gravity"])
        {
            NSArray *array = [dic objectForKey:key];
            for(int i= 0; i<[array count]; i++)
            {
                KeyBean *keyBean = [ParseJson parseKeyBean:[array objectAtIndex:i]];
                [[gameInfo gravity] addObject:keyBean];
            }
        }
        if([key isEqual:@"none_full_touch"])
        {
            NSArray *array = [dic objectForKey:key];
            for(int i= 0; i<[array count]; i++)
            {
                KeyBean *keyBean = [ParseJson parseKeyBean:[array objectAtIndex:i]];
                [[gameInfo gravity] addObject:keyBean];
            }
        }        if([key isEqual:@"gravity"])
        if([key isEqual:@"full_touch"])
        {
            NSArray *array = [dic objectForKey:key];
            for(int i= 0; i<[array count]; i++)
            {
                KeyBean *keyBean = [ParseJson parseKeyBean:[array objectAtIndex:i]];
                [[gameInfo gravity] addObject:keyBean];
            }
        }
        
    }
    return (gameInfo);
}

+ (KeyBean*) parseKeyBean: (NSDictionary*)dic
{
    KeyBean *keyBean = [[KeyBean alloc] init];
    for(id key in dic)
    {
        if([key isEqual:@"key_type"])
        {
            [keyBean setKey_type:[dic objectForKey:key]];
        }
        if([key isEqual:@"key_id"])
        {
            [keyBean setKey_id:[dic objectForKey:key]];
        }
        if([key isEqual:@"key_sound"])
        {
            [keyBean setKey_sound:[dic objectForKey:key]];
        }
        if([key isEqual:@"keys"])
        {
            [keyBean setKeys:[dic objectForKey:key]];
        }
        if([key isEqual:@"bar_style"])
        {
            [keyBean setBar_style:[dic objectForKey:key]];
        }
        if([key isEqual:@"name"])
        {
            [keyBean setName:[dic objectForKey:key]];
        }
        if([key isEqual:@"show_bar"])
        {
            [keyBean setShow_bar:[dic objectForKey:key]];
        }
        if([key isEqual:@"style"])
        {
            [keyBean setStyle:[dic objectForKey:key]];
        }
        if([key isEqual:@"tv_x"])
        {
            [keyBean setTv_x:[dic objectForKey:key]];
        }
        if([key isEqual:@"tv_y"])
        {
            [keyBean setTv_y:[dic objectForKey:key]];
        }
        if([key isEqual:@"text"])
        {
            [keyBean setText:[dic objectForKey:key]];
        }
        if([key isEqual:@"y"])
        {
//            [keyBean sety:[dic objectForKey:key]];
            keyBean.y = [dic objectForKey:key];
        }
        if([key isEqual:@"x"])
        {
//            [keyBean setx:[dic objectForKey:key]];
            keyBean.x = [dic objectForKey:key];
            
            
           
        }
    }
    return (keyBean);
}

+ (NSMutableArray*) parseJsonGameInfoArray:(NSArray*)array
{
    int count = [array count];
    NSMutableArray* gameArray = [NSMutableArray arrayWithCapacity:count];
    for(int i=0; i<count; ++i)
    {
        GameInfo *gameInfo = [ParseJson parseJson:[array objectAtIndex:i]];
        [gameArray addObject:gameInfo];
    }
    return (gameArray);
}

+ (NSMutableArray*) parseJsonOTherGameInfoArray:(NSArray *)array
{
    //parse other game
    return (nil);
}

+ (TvInfo*) parseTvInfoJsonWithString: (NSString*)json
{
    if(json == nil)
    {
        return nil;
    }
    NSError *error = [[NSError alloc] init];
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data
                                                        options:NSJSONReadingMutableLeaves
                                                          error:&error];
    [error release];
    return [self parseTvInfoJson:dic];
}
+ (TvInfo*) parseTvInfoJson:(NSDictionary*)dic
{
    TvInfo *tvInfo = [[TvInfo alloc] init];
    for(id key in dic)
    {
        if([key isEqual:@"capability"])
        {
            tvInfo.capability = [dic objectForKey:key];
        }
        if([key isEqual:@"e"])
        {
            tvInfo.e = [dic objectForKey:key];
        }
        if([key isEqual:@"isRooted"])
        {
            tvInfo.isRooted = [dic objectForKey:key];
        }
        if([key isEqual:@"mac"])
        {
            tvInfo.mac = [dic objectForKey:key];
        }
        if([key isEqual:@"name"])
        {
            tvInfo.name = [dic objectForKey:key];
        }
        if([key isEqual:@"serverPort"])
        {
            tvInfo.serverPort = [dic objectForKey:key];
        }
        if([key isEqual:@"tag"])
        {
            tvInfo.tag = [dic objectForKey:key];
        }
        if([key isEqual:@"udpPort"])
        {
            tvInfo.udpPort = [dic objectForKey:key];
        }
        if([key isEqual:@"udpType"])
        {
            tvInfo.udpType = [dic objectForKey:key];
        }
        if([key isEqual:@"winH"])
        {
            tvInfo.winH = [dic objectForKey:key];
        }
        if([key isEqual:@"winW"])
        {
            tvInfo.winW = [dic objectForKey:key];
        }
    }
    return (tvInfo);
}






- (void)dealloc
{
    [super dealloc];
}
@end
