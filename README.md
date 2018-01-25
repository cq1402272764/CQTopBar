# CQTopBar
## 控件简介
快速集成下拉菜单控件，可自定义内容、属性、位置和大小，传入需要显示的标题文字和需要显示的控制器即可，请查看示例程序或者demo。
### 【注】
- 所传入的标题文字数组和显示的控制器数组个数必须一致。

## <a id="TopBar"></a> TopBar【示例】
```objc
@interface ViewController ()
@property (nonatomic, strong) CQTopBarViewController *topBar;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.topBar = [[CQTopBarViewController alloc] init];
    self.topBar.sectionTitles = @[@"Text1",@"Text2",@"Text3"];
    self.topBar.pageViewClasses = @[[Text1 class],[Text2 class],[Text3 class]];
    [self addChildViewController:self.topBar];
    [self.view addSubview:self.topBar.view];
    self.view.backgroundColor = [UIColor whiteColor];
    }
}
```
## 界面显示

![image](https://github.com/cq1402272764/CQTopBar/blob/master/Res/TopBar.png)
