# JCRoutable

[![Version](https://img.shields.io/cocoapods/v/JCRoutable.svg?style=flat)](http://cocoapods.org/pods/JCRoutable)
[![License](https://img.shields.io/cocoapods/l/JCRoutable.svg?style=flat)](http://cocoapods.org/pods/JCRoutable)
[![Platform](https://img.shields.io/cocoapods/p/JCRoutable.svg?style=flat)](http://cocoapods.org/pods/JCRoutable)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage（用法）

1. 设置控制器的URL

    ```
    [[Routable sharedRouter] map:@"users" toController:[UserController class]];
    ```

2. 在你的viewController中实现*initWithRouterParams:*方法

    ```
    - (id)initWithRouterParams:(NSDictionary *)params {
        if ((self = [self initWithNibName:nil bundle:nil])) {
            self.userId = [params objectForKey:@"id"];
        }
        return self;
    }
    ```
    
3. 跳转到URL对应的控制器

    ```
    [[Routable sharedRouter] open:@"users"];
    ```

### 添加的格外功能

1. 添加一个批量设置控制器URL的方法，你只需要传入对应的plist配置文件路径，新版增加了从storyboard创建控制器的支持：

    ```
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"RoutableConfigure.plist" ofType:nil];
    [Routable jc_mapViewControllerToConfigurePlistFile:plistPath];
    ```
    其中RoutableConfigure.plist是控制器URL的映射表：
    ![](https://github.com/chenjiangchuan/JCRoutable/raw/master/image/urlmaptable.png)
    
    1. 普通方式创建的ViewController：key为map的参数，value为控制器的类名；
    2. 通过storyboard创建的控制器，需要而外的字典描述：
        * `HomeStoryboard`代表一个storyboard，注意的是名字必须包含`Storyboard`；
        * `HomeStoryboardMapKey`对应的value就是storyboard真实名字`home`；
        * `FourthViewControllerMapKey`对应的value是ViewController在stroyboard中的ID，通常我们设置和控制器同名`FourthViewController`。
    
    最后新建一个.h文件，用来定义这些key：
    
    ```
    #ifndef ViewControllersMapKey_h
    #define ViewControllersMapKey_h

    static NSString *const JCLoginViewControllerMapKey = @"JCLoginViewControllerMapKey";
    static NSString *const ViewControllerMapKey = @"ViewControllerMapKey";
    static NSString *const SecondViewControllerMapKey = @"SecondViewControllerMapKey";
    static NSString *const ThirdViewControllerMapKey = @"ThirdViewControllerMapKey";
    static NSString *const HomeStoryboardMapKey = @"HomeStoryboardMapKey";

    #endif /* ViewControllersMapKey_h */
    ```
> Plist文件不能配错，要不然解析会出现问题

1. 不需要手动配置Routable的NavigationController属性
    ```
    // 原Routable框架需要手动设置navigationController（JCRoutable不要设置）
    [[Routable sharedRouter] setNavigationController:aNavigationController];
    ```
    
    因为Routable本质是通过navigationController进行push或pop操作。我们现在分析把Routable的navigationController设成固定值。
    
    主流App架构：
    
    ```
                        |-> NavigationController1 -> ViewController1
    TabBarController -> |-> NavigationController2 -> ViewController2
                        |-> NavigationController3 -> ViewController3

    ```
    
    如果在*application:didFinishLaunchingWithOptions:*中把Routable的navigationController设成固定值，那么App架构变成了这样：
    
    ```
                                                         |-> NavigationController1 -> ViewController1
    Routable.navigationController -> TabBarController -> |-> NavigationController2 -> ViewController2
                                                         |-> NavigationController3 -> ViewController3

    ```
    
    这样导致ViewController1、ViewController2、ViewController3的navigationItem被Routable.navigationController遮住了。并且ViewController1跳转到ViewController2不再是由NavigationController1去控制，而是被Routable.navigationController管理，这样导致各个ViewController的navigationItem设置出问题。
    
    
    把Routable.navigationController设成当前所在的控制器，则App架构是这样的：
    
    ```
                        |-> NavigationController1 -> ViewController1 | Routable.navigationController -> NavigationController1
    TabBarController -> |-> NavigationController2 -> ViewController2 | Routable.navigationController -> NavigationController2
                        |-> NavigationController3 -> ViewController3 | Routable.navigationController -> NavigationController3
    ```
    
    ViewController1跳转到ViewController2时，这时我在Routable内部做了以下事情：
    
    ```
    // 处理navigationController
    UIViewController *currentController = [UIViewController currentViewController];
    if ([currentController isKindOfClass:[UIViewController class]]) {
        if (currentController.navigationController) {
            self.navigationController = currentController.navigationController;
        } else {
            self.navigationController = [[UINavigationController alloc] init];
        }
    } else if ([currentController isKindOfClass:[UINavigationController class]]) {
        self.navigationController = (UINavigationController *)currentController;
    } else {
        self.navigationController = [[UINavigationController alloc] init];
    }

    ```
    
    这样ViewController1跳转ViewController2，则由NavigationController1负责；反过来ViewController2跳转ViewController1，则由NavigationController2负责。

3. 正向传值
    
    原Routable正向传值通过`initWithRouterParams:`和`allocWithRouterParams:`，如果ViewController没有实现这两个方法其一，就会抛异常，JCRoutable不强制实现这两个初始化方法，如果需要获取上个ViewController传过来的数据，直接使用`self.routerParams`
    
    ```
    // FirstViewController.m
    - (void)pushSecondVCAction {
        [[Routable sharedRouter] 
            open:SecondViewControllerMapKey 
            animated:YES 
            extraParams:@{@"title" : @"routerparamstest"} 
            delegateObject:nil];
    }
    ```
    
    ```
    // SecondViewController.m
    - (void)viewDidLoad {
        [super viewDidLoad];
        NSLog(@"%s, params = %@", __FUNCTION__, self.routerParams);
    }
    ```

4. 逆向传值

    添加了NSObject+ReverseValue分类，然后在该分类中添加遵守JCReverseValueProtocol协议的属性，只要*#import "Routable.h"*即可。

    ```
    // ViewController1
    [[Routable sharedRouter] open:@"ViewController2"
                         animated:YES
                      extraParams:@{@"title" : @"come from ViewController1"}
                   delegateObject:self];
                   
                   
    - (void)jc_reverseValue:(id)value {
        NSLog(@"%s:%@", __FUNCTION__, value);
    }
    ```

    ```
    // ViewController2
    if ([self.JCReverseValueDelegate respondsToSelector:@selector(jc_reverseValue:)]) {
        [self.JCReverseValueDelegate jc_reverseValue:@"come from ViewController2"];
    }
    ```

5. 用户注销返回登录界面

    ```
    // 参数为登录界面控制器的类名
    [Routable jc_unRegisterAccountToLoginViewController:@"LoginViewController"];
    ```


## Installation

JCRoutable is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JCRoutable"
```

## Author

chenjiangchuan, jiangchuanc@gmail.com

## License

JCRoutable is available under the MIT license. See the LICENSE file for more info.


