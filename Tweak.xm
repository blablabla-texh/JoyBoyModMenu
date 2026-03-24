#import <UIKit/UIKit.h>

@interface JoyBoyModMenu : UIView
@property (nonatomic, strong) UIView *sidebar;
@property (nonatomic, strong) UIImageView *logoView;
@end

@implementation JoyBoyModMenu

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Look du menu (Noir & Cyan)
        self.backgroundColor = [UIColor colorWithRed:0.05 green:0.05 blue:0.07 alpha:0.95];
        self.layer.borderColor = [UIColor cyanColor].CGColor;
        self.layer.borderWidth = 2.0;
        self.layer.cornerRadius = 20;
        self.clipsToBounds = YES;

        // Sidebar à gauche
        self.sidebar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, frame.size.height)];
        self.sidebar.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1.0];
        [self addSubview:self.sidebar];

        // Chargement du logo Gear 5
        UIImage *logoImg = [UIImage imageWithContentsOfFile:@"/Library/MobileSubstrate/DynamicLibraries/logo.png"];
        if (logoImg) {
            self.logoView = [[UIImageView alloc] [[UIImageView alloc] initWithFrame:CGRectMake(15, 20, 70, 70)];
            self.logoView.image = logoImg;
            self.logoView.contentMode = UIViewContentModeScaleAspectFit;
            self.logoView.layer.cornerRadius = 35; // Cercle parfait
            self.logoView.clipsToBounds = YES;
            [self.sidebar addSubview:self.logoView];
        }

        // Texte JoyBoy
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 100, 30)];
        title.text = @"JoyBoy";
        title.textColor = [UIColor whiteColor];
        title.font = [UIFont boldSystemFontOfSize:16];
        title.textAlignment = NSTextAlignmentCenter;
        [self.sidebar addSubview:title];
    }
    return self;
}
@end

%hook UIWindow
- (void)makeKeyAndVisible {
    %orig;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        JoyBoyModMenu *menu = [[JoyBoyModMenu alloc] initWithFrame:CGRectMake(50, 100, 350, 250)];
        [self addSubview:menu];
    });
}
%end
