#import <UIKit/UIKit.h>

%hook UIViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig;
    if (![self.view viewWithTag:999]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20, 100, 60, 60);
        button.layer.cornerRadius = 30;
        button.backgroundColor = [UIColor redColor];
        button.tag = 999;
        [button addTarget:self action:@selector(showJoyBoyMenu) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

%new
- (void)showJoyBoyMenu {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"JoyBoy" message:@"Menu OK" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

%end
