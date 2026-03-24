#import <UIKit/UIKit.h>

%hook UIViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig;

    // On vérifie si le menu existe déjà pour ne pas le créer 100 fois
    if (![self.view viewWithTag:999]) {
        
        // Création du bouton (le logo)
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20, 50, 60, 60);
        button.layer.cornerRadius = 30;
        button.clipsToBounds = YES;
        button.tag = 999;

        // Couleur de secours si l'image ne charge pas
        button.backgroundColor = [UIColor redColor];

        // Chargement de l'image
        UIImage *logo = [UIImage imageWithContentsOfFile:@"/Library/MobileSubstrate/DynamicLibraries/logo.png"];
        [button setImage:logo forState:UIControlStateNormal];

        // Action quand on clique
        [button addTarget:self action:@selector(showJoyBoyMenu) forControlEvents:UIControlEventTouchUpInside];

        [self.view addSubview:button];
    }
}

%new
- (void)showJoyBoyMenu {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"JoyBoy Menu" 
                                                                   message:@"Bienvenue dans ton Mod Menu !" 
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

%end
