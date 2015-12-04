//
//  ViewController.h
//  demo
//
//  Created by tusm on 15/12/2.
//  Copyright © 2015年 Yyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{

    UITableView *Testtableview;
    NSArray *array;
     int num ;
    UILabel *textlabel;
     NSMutableArray *muarray;
}

@end

