#import <UIKit/UIKit.h>
#import <substrate.h>

%hook UIViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig;

    if (![self.view viewWithTag:999]) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(50, 100, 60, 60);
        btn.layer.cornerRadius = 30;
        btn.backgroundColor = [UIColor redColor];
        btn.tag = 999;
        [btn setTitle:@"JB" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(showJoyBoy) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

%new
- (void)showJoyBoy {
    UIAlertController *a = [UIAlertController alertControllerWithTitle:@"JoyBoy" 
                                                              message:@"Le Menu fonctionne !" 
                                                       preferredStyle:UIAlertControllerStyleAlert];
    [a addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:a animated:YES completion:nil];
}

%end
