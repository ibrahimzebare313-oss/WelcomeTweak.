#import <UIKit/UIKit.h>

%hook AppDelegate
- (void)applicationDidFinishLaunching:(id)notification {
    %orig;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Welcome" message:@"Modified By Ibrahim Zebare" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertController actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        
        UIWindow *keyWindow = nil;
        for (UIWindow *window in [UIApplication sharedApplication].windows) {
            if (window.isKeyWindow) {
                keyWindow = window;
                break;
            }
        }
        
        [keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    });
}
%end
