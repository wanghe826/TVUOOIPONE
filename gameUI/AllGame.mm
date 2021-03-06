//
//  AllGame.m
//  gameUI
//
//  Created by yibin chen on 14-06-03.
//  Copyright (c) 2014年 yibin chen. All rights reserved.
//

#import "AllGame.h"
#import "gameIntroduce.h"
#import "MyJniTransport.h"
#import <string.h>


@interface AllGame ()
{
    BOOL label ;
    UIButton *but ;
    FetchJson *fetchJson;
    
    
}



@end
@implementation AllGame
@synthesize m_array;
@synthesize tableview;
@synthesize appRecord;
@synthesize Mytableview;
@synthesize allGameButton;
@synthesize streetGameButton;
@synthesize redGameButton;
@synthesize gameLabelName;
@synthesize single;
@synthesize t_array;
@synthesize g_array;
@synthesize c_array;
@synthesize z_array;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}











- (void) showTvInfo
{
}








- (void)viewDidLoad
{
    label = NO;
//    m_array = [[NSMutableArray alloc] init];
    g_array = [[NSMutableArray alloc] init];
    t_array = [[NSMutableArray alloc] init];
    z_array = [[NSMutableArray alloc] init];
    c_array = [[NSMutableArray alloc] init];
    
    [super viewDidLoad];
    
    
    tableview =(UITableView *) [self.view viewWithTag:999];
    Mytableview = (UITableView *) [self.view viewWithTag:998];
    //initWithUrl参数:1、要解析的json的地址   2、GameInfo   3、这个json最外层是否是数组
    

    
    if(tableview.tag == 999 )
    {
        if(GameNameLabel==0)
        {
            fetchJson = [[FetchJson alloc] initWithUrl:@"http://a.wap3.cn//entry/gamegroupinfo.jsp?groupid=9&game_capability=2" jsonType:@"GameInfo" isArray:YES];
            gameLabelName.text = @"所有游戏";
        
        }else if(GameNameLabel == 2)
        {
            fetchJson = [[FetchJson alloc] initWithUrl:@"http://a.wap3.cn//entry/gamegroupinfo.jsp?groupid=12" jsonType:@"GameInfo" isArray:YES];
            gameLabelName.text = @"红白机游戏";

        }else if(GameNameLabel == 3)
        {
            fetchJson = [[FetchJson alloc] initWithUrl:@"http://a.wap3.cn//entry/gamegroupinfo.jsp?groupid=13" jsonType:@"GameInfo" isArray:YES];
            gameLabelName.text = @"街机游戏";

        }else if(GameNameLabel == 1)
        {
            fetchJson = [[FetchJson alloc] initWithUrl:@"http://a.wap3.cn//entry/gamegroupinfo.jsp?groupid=14&game_capability=2" jsonType:@"GameInfo" isArray:YES];
            gameLabelName.text = @"新品游戏";
   
        }
    
        //设置委托对象
        [fetchJson setDelegate: self];
        
        
        
        //开始解析
        [fetchJson fetchJson];
        
        
    }
    
    single = [Singleton getInstance];
    if(single.cur_tvInfo != nil)
    {
        getMyGameInfo(single.cur_tvInfo.tv_ip);
    }
    single.delegate1 = self;
    

}








//设置table view的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

//设置分段的行数  只可以少 不可以多
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(0!=[g_array count] && 119 == allGameButton.tag)
    {
        return GameNameLabel;
    }else if(0 != [m_array count])
    {
        return [m_array count];
    }
        
    return 1;       //返回书的数量  告诉系统有几本这样的书
}






//返回的是table view cell 的内容   我们调用的每一个单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"RecipeCell";
    
    
    //获取数据的记录数，如果=0则显示"数据加载中…"，这里只是简单的进度显示，有了数据，再用进度条显示就简单啦
    int nodeCount = [self.m_array count];
    
	if (nodeCount == 0 )
	{
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
		{
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
										   reuseIdentifier:CellIdentifier] autorelease];
//            cell.detailTextLabel.textAlignment = UITextAlignmentCenter;
//			cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
		cell.detailTextLabel.text = [NSString stringWithFormat:@"数据加载中…"];
        
     
		return cell; //记录为0则直接返回，只显示数据加载中…
        
    }
	
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
									   reuseIdentifier:CellIdentifier] autorelease];
        
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    //网络加载数据后，从新绘制表格行
    if (nodeCount > 0)
	{
        

        appRecord = [self.m_array objectAtIndex:indexPath.row];
    
        
        if(appRecord.icon_url)
        {
            cell.imageView.image = [UIImage imageNamed:@"Placeholder.png"]; 
        }else
        {
            NSURL *url=[NSURL URLWithString:appRecord.icon_url];
            
            cell.imageView.image =[[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:url]];
        }


        
        cell.textLabel.text = appRecord.name;
        
        
        
         cell.detailTextLabel.text = [NSString stringWithFormat:@"大小:  %d M",(int)appRecord.sizes.floatValue/1024/1024];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
        but = [UIButton buttonWithType:UIButtonTypeCustom];

        but.frame = CGRectMake(cell.frame.origin.x+40,cell.frame.origin.y,65,35);
      
        [but setBackgroundImage:[UIImage imageNamed:@"zy_huanganniu2.9.png"] forState:UIControlStateNormal];

        BOOL flag = TRUE;
        
        for(int i = 0 ; i < [g_array count] ; i++)
        {   
            GameInfo *gameInfo = [g_array objectAtIndex:i];

            if([appRecord.game_id isEqualToString:gameInfo.game_id])
            {
                
                
                [but setTitle:@"启动" forState: UIControlStateNormal];
                [but setBackgroundImage:[UIImage imageNamed:@"sjyk_anniu1.9.png"] forState:UIControlStateNormal];
                flag = FALSE;
                break;
            }


        }

        if(flag == TRUE)
        {
            [but setTitle:@"查看详情" forState: UIControlStateNormal];
        }
        

        but.titleLabel.font = [UIFont systemFontOfSize: 13.0];
        

        [but setTag:indexPath.row];
        //给button添加点击事件，action参数中写入事件执行方法
        [but addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        //在button的tag中添加你需要传递的参数，目前资料中只有这种方法
        //你可以传入任意类型的参数
    
        cell.accessoryView = but;
    }

    
    return cell;
}



- (void) haveInstalledArrayInfo:(NSString *)games
{
    
    if(Mytableview.tag == 998)
    {
        
        [m_array removeAllObjects];
        [g_array removeAllObjects];
        
        NSData *data = [games dataUsingEncoding: NSUTF8StringEncoding];
        
        NSError * error = [[NSError alloc] init];
        
        NSArray *haveInstalledGameArray = [NSJSONSerialization JSONObjectWithData: data
                                                                          options:NSJSONReadingMutableLeaves
                                                                            error:&error];
        g_array = [ParseJson parseJsonGameInfoArray:haveInstalledGameArray];
        [g_array retain];
        
        for(int i=0 ;i < [g_array count] ;i++ )
        {
            fetchJson = [[FetchJson alloc] initWithUrl:  [NSString stringWithFormat:@"http://a.wap3.cn//entry/gameinfo.jsp?gameid=%d", [((GameInfo*)[g_array objectAtIndex:i]).game_id  intValue]]  jsonType:@"GameInfo" isArray:NO];
            //设置委托对象
            [fetchJson setDelegate: self];
            //开始解析
            [fetchJson fetchJson];
            
            
        }
        
        
        
        GameNameLabel = [g_array count];
        
        [Mytableview  reloadData];
    }
    
    
    
}











//tabelview 的单击事件
-(void)action:(id)sender
{
    int row = [sender tag];
    

    
    if(Mytableview.tag == 998)
    {
        GameInfo *gameInfo = [m_array objectAtIndex:row];
 
        string gameJson = [gameInfo toJson];
        startGame(gameJson, single.cur_tvInfo.tv_ip);
    
        single.Game_ID = [NSNumber numberWithInteger:[gameInfo.game_id intValue] ];
        
        if([gameInfo.game_type integerValue] == 1)  //安卓
        {
            [self performSegueWithIdentifier:@"anzhuo" sender:self];
        }else if([gameInfo.game_type integerValue] == 3)    //街机
        {
            [self performSegueWithIdentifier:@"jie" sender:self];
        }else if([gameInfo.game_type integerValue] == 2)
        {
            //红白机
        
        }

        
    }
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //将page2设定成Storyboard Segue的目标UIViewController
    if([m_array count] == 0)return;
    
    UIViewController *page2 = segue.destinationViewController;
    
    //将值透过Storyboard Segue带给页面2的string变数
    
    if(YES==label)
    [page2 setValue:appRecord forKey:@"exchangeString"];
    
}


- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [super viewWillAppear:animated];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    
    
    
    
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([m_array count] == 0)return NULL;
    appRecord = [self.m_array objectAtIndex:indexPath.row];
    label = YES;
    
 
    return indexPath;
}


//如果要解析的json不是数组,则回调此函数
-(void) getGameInfoFromNet:(NSDictionary*)dic
                  jsonType:tag
{
    [t_array addObject:[ParseJson parseJson:dic]];

    if([((GameInfo*) [ParseJson parseJson:dic]).game_type integerValue] == 3)
    {
        [z_array addObject:[ParseJson parseJson:dic]];
    }else if([((GameInfo*) [ParseJson parseJson:dic]).game_type integerValue] == 2)
    {
        [c_array addObject:[ParseJson parseJson:dic]];
    
    }


    if([t_array count] == [g_array count])
    {
        m_array = t_array;
        [Mytableview reloadData];
    
    }
  
    
   
}





//数组
-(void) getGameInfoArrayFromNet:(NSMutableArray*)gameArrayInfo
                       jsonType:(NSString *)tag
{
    if([tag isEqualToString:@"GameInfo"])
    {
        
        m_array = [ParseJson parseJsonGameInfoArray:gameArrayInfo];
        [m_array retain];
    }


    [tableview  reloadData];
}

-(void) dealloc
{
    
    [tableview release];
    [Mytableview release];
    [appRecord release];
    [m_array release];
    [g_array release];
    [fetchJson release];
    fetchJson = nil;
    GameNameLabel = 999;
    [allGameButton release];
    [streetGameButton release];
    [redGameButton release];
    [gameLabelName release];
    [t_array release];
    [c_array release];
    [z_array release];
    [single release];
    [super dealloc];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setMytableview:nil];
    [self setAppRecord:nil];
    [self setAllGameButton:nil];
    [self setStreetGameButton:nil];
    [self setRedGameButton:nil];
    [self setAppRecord:nil];
    [self setGameLabelName:nil];
    [self setM_array:nil];
    [self setG_array:nil];
    [self setT_array:nil];
    [super viewDidUnload];
    
    
   
}

//全部 街机 红白机 游戏的按钮
- (IBAction)ClickAllGame:(id)sender {
    [allGameButton setBackgroundImage:[UIImage imageNamed:@"wdyx_suoyouyouxi2.png"] forState:UIControlStateNormal];
    [streetGameButton setBackgroundImage:[UIImage imageNamed:@"wdyx_jiejiyouxi1.png"] forState:UIControlStateNormal];
    [redGameButton setBackgroundImage:[UIImage imageNamed:@"wdyx_hongbaiji1.png"] forState:UIControlStateNormal];


    GameNameLabel = [t_array count];
    
    m_array = t_array;
  

    
    [Mytableview  reloadData];

}


- (IBAction)ClickStreeGame:(id)sender {
    [allGameButton setBackgroundImage:[UIImage imageNamed:@"wdyx_suoyouyouxi1.png"] forState:UIControlStateNormal];
    [streetGameButton setBackgroundImage:[UIImage imageNamed:@"wdyx_jiejiyouxi2.png"] forState:UIControlStateNormal];
    [redGameButton setBackgroundImage:[UIImage imageNamed:@"wdyx_hongbaiji1.png"] forState:UIControlStateNormal];

    
   
    GameNameLabel = [z_array count];
    m_array = z_array;

   
    [Mytableview  reloadData];
  
}

- (IBAction)ClickRedGame:(id)sender
{
    [allGameButton setBackgroundImage:[UIImage imageNamed:@"wdyx_suoyouyouxi1.png"] forState:UIControlStateNormal];
    [streetGameButton setBackgroundImage:[UIImage imageNamed:@"wdyx_jiejiyouxi1.png"] forState:UIControlStateNormal];
    [redGameButton setBackgroundImage:[UIImage imageNamed:@"wdyx_hongbaiji2.png"] forState:UIControlStateNormal];

    
    m_array = c_array;
    GameNameLabel = [c_array count];
    
    [Mytableview  reloadData];

}


- (IBAction)xinGame:(id)sender {    GameNameLabel = 1;
}

- (IBAction)hongGame:(id)sender {   GameNameLabel = 2;
}

- (IBAction)jieGame:(id)sender {    GameNameLabel = 3;
}

- (IBAction)suoGame:(id)sender {    GameNameLabel = 0;
}


@end
