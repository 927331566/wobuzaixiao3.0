//
//  AViewController.m
//  我在校外
//
//  Created by 翟旭博 on 2023/3/22.
//

#import "AViewController.h"
#import "BViewController.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface AViewController ()
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) NSMutableArray *textFieldArray;
@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button.frame = CGRectMake(140, 10, SIZE_WIDTH - 280, 70);
    [self.button setTitle:@"确定" forState:UIControlStateNormal];
    self.button.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    self.textFieldArray = [[NSMutableArray alloc] init];
    NSArray *nameArray = @[@"类型（病假）", @"开始 2023-03-20 07:45", @"结束 2023-03-20 07:45", @"电话", @"当前位置", @"请假事由", @"名字(学生)", @"审批时间"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    NSDate *dateNow = [NSDate date];
    NSString *timeString = [formatter stringFromDate:dateNow];

    for (int i = 0; i < 8; i++) {
        self.textField = [[UITextField alloc] init];
        self.textField.backgroundColor = [UIColor orangeColor];
        self.textField.borderStyle = UITextBorderStyleRoundedRect;
        self.textField.leftViewMode = UITextFieldViewModeAlways;
        self.textField.textColor = [UIColor blackColor];
        self.textField.frame = CGRectMake(50, 100 + i * 60, SIZE_WIDTH - 100, 50);
        self.textField.placeholder = nameArray[i];
        if (i == 1) {
            self.textField.text = timeString;
        } else if (i == 4) {
            self.textField.text = @"陕西省西安市长安区郭杜街道府东一路";
        } else if (i == 7) {
            self.textField.text = timeString;
        }
        [self.view addSubview:self.textField];
        [self.textFieldArray addObject:self.textField];
    }
}

- (void)press {
    BViewController *b = [[BViewController alloc] init];
    b.modalPresentationStyle = UIModalPresentationFullScreen;
    NSMutableArray *textArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 8; i++) {
        UITextField *a = self.textFieldArray[i];
        [textArray addObject:a.text];
    }
    b.array = textArray;
    [self presentViewController:b animated:YES completion:nil];
}
//点击屏幕空白处键盘回收
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textField resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
