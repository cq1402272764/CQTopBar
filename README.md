# CQTopBar
## 控件简介
快速集成下拉菜单控件，可自定义内容、属性、位置和大小，传入需要显示的标题文字和需要显示的控制器即可，请查看示例程序或者demo。
### 【注】
- V1.1.5的版本使用是UIView的创建形式，之前使用的是UIViewController的创建形式
- 所传入的标题文字数组和显示的控制器数组个数必须一致。
### CocoaPods

1. Add `pod 'CQTopBar',` to your Podfile.

2. Run `pod install` or `pod update`.

[简书地址](https://www.jianshu.com/p/b8f8f73b0efa)

## <a id="TopBar"></a> TopBar（UIViewController的创建形式）【示例】
```objc
@interface ViewController ()
@property (nonatomic, strong) CQTopBarViewController *topBar;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.topBar = [[CQTopBarViewController alloc] init];
    self.topBar.sectionTitles = @[@"Text1",@"Text2",@"Text3"];
    self.topBar.pageViewClasses = @[[Text1 class],[Text2 class],[Text3 class]];
    [self addChildViewController:self.topBar];
    [self.view addSubview:self.topBar.view];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.topBar.footerView.bounds.size.height)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.topBar.footerView addSubview:tableView];
}
```
## <a id="TopBar"></a> TopBar（UIView的创建形式）【示例】
```objc
    testView1 *test1 = [[testView1 alloc] init];
    testView2 *test2 = [[testView2 alloc] init];
    testView3 *test3 = [[testView3 alloc] init];
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    CGRect topBarFrame = CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, 40);
    CQTopBarView *topBar = [[CQTopBarView alloc] initWithFrame:topBarFrame
                                                   ContentView:tableView
                                                 SectionTitles:@[@"test1",@"test2",@"test3"]
                                                     PageViews:@[test1,test2,test3]];
    
    topBar.segmentbackImage = [UIImage imageNamed:@"userorder_cancelbtn_highlight"];
    topBar.selectSegmentbackImage = [UIImage imageNamed:@"main_searchbutton_normal"];
    topBar.segmentlineColor = [UIColor whiteColor];
    [self.view addSubview:topBar];
```

## 界面显示

![image](https://github.com/cq1402272764/CQTopBar/blob/master/Res/TopBar.gif)
