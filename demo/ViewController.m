//
//  ViewController.m
//  demo
//
//  Created by tusm on 15/12/2.
//  Copyright © 2015年 Yyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    Testtableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    Testtableview.dataSource = self;
    Testtableview.delegate = self;
    [self.view addSubview:Testtableview];
    
    
    array = [NSArray arrayWithObjects:@"今天",@"明天",@"昨天",@"前天", nil];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"mycell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 100, 50)];
    label.text =[array objectAtIndex:indexPath.row];

    //减法按钮
    UIButton *leftbtn = [UIButton buttonWithType: UIButtonTypeCustom];
    leftbtn.frame = CGRectMake(10, 55, 40, 40);
    leftbtn.tag = indexPath.row;
    [leftbtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [leftbtn setTitle:@"-" forState:UIControlStateNormal];
    leftbtn.backgroundColor = [UIColor greenColor];
    
    //显示改变值的地方
    textlabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 55, 30, 40)];
    textlabel.text =@"1";
    textlabel.textAlignment = NSTextAlignmentCenter;
    textlabel.tag = indexPath.row;
   
    
    
    //加法按钮
    UIButton *rightbtn = [UIButton buttonWithType: UIButtonTypeCustom];
    rightbtn.frame = CGRectMake(80, 55, 40, 40);
    rightbtn.tag = indexPath.row;
    [rightbtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [rightbtn setTitle:@"+" forState:UIControlStateNormal];
    rightbtn.backgroundColor = [UIColor greenColor];
    [cell addSubview:label];
    [cell addSubview:leftbtn];
    [cell addSubview:textlabel];
    [cell addSubview:rightbtn];
    
    ////////////////////////////
    return  cell;
}

-(void)leftBtnClick:(UIButton *)sender
{
    NSLog(@"leftBtnClick:%ld",(long)sender.tag);
    
   
    --num;
    //想要使textlabel 的值 等于num 变化的值。在对应的cell中 下面这个方法是错误的。只能使得最后一个cell 的textlabel 的值改变
    textlabel.text = [NSString stringWithFormat:@"%d",num];

}

-(void)rightBtnClick:(UIButton *)sender
{
    NSLog(@"rightBtnClick:%ld",(long)sender.tag);
    
    ++num;
    textlabel.text = [NSString stringWithFormat:@"%d",num];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
