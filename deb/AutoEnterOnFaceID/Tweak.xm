#import <UIKit /UIKit.h>
  #import <SpringBoard /SpringBoard.h>
    #import <SpringBoard /SBLockScreenManager.h>
      #import <SpringBoard /SBUIBiometricResource.h>
        
        // 偏好设置键
        static NSString *const kAutoEnterOnFaceIDEnabledKey = @"com.muzikeji.AutoEnterOnFaceIDEnabled";
        
        // 读取开关状态
        static BOOL isAutoEnterEnabled() {
        NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"com.muzikeji.AutoEnterOnFaceID"];
        return [defaults boolForKey:kAutoEnterOnFaceIDEnabledKey];
        }
        
        %hook SBLockScreenManager
        
        - (void)biometricAuthenticationDidCompleteWithResult:(SBUIBiometricResourceResult)result {
        %orig;
        
        // 仅在面容解锁成功且开关开启时执行
        if (result == SBUIBiometricResourceResultSuccess && isAutoEnterEnabled()) {
        // 延迟 0.1 秒后解锁进入桌面，避免时机问题
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"com.apple.springboard.lockcomplete"]];
        });
        }
        }
        
        %end