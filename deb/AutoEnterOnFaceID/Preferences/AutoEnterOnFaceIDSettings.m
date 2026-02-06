#import "AutoEnterOnFaceIDSettings.h"

@implementation AutoEnterOnFaceIDSettings

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}
	return _specifiers;
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"com.muzikeji.AutoEnterOnFaceID"];
    [defaults setObject:value forKey:specifier.properties[@"key"]];
    [defaults synchronize];
}

- (id)readPreferenceValue:(PSSpecifier *)specifier {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"com.muzikeji.AutoEnterOnFaceID"];
    id value = [defaults objectForKey:specifier.properties[@"key"]];
    return value ?: [NSNumber numberWithBool:NO];
}

@end