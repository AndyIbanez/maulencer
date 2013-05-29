#import <objc/Runtime.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SBApplicationIcon
-(id)displayName;
-(void)launch;
@end

@interface SpringBoard
-(void)ringerChanged:(int)changed;
@end

@interface SBApplication
-(void)ringerChanged:(int)changed;
@end

@interface SBApplicationController
+(SBApplicationController *)sharedInstance;
-(SBApplication *)springBoard;
@end

%hook SBApplicationIcon
-(void)launch
{
	if([[self displayName] isEqualToString:@"Maulencer"])
	{
		NSMutableDictionary *silenced = [NSMutableDictionary dictionaryWithContentsOfFile: 
								[NSString stringWithFormat:@"%@/Library/Preferences/%@", NSHomeDirectory(), @"com.andyibanez.Maulencer.plist"]];
		if(silenced == NULL)
		{
			silenced = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], @"silenced", nil];
			[silenced writeToFile:[NSString stringWithFormat:@"%@/Library/Preferences/%@", NSHomeDirectory(), @"com.andyibanez.Maulencer.plist"] atomically:YES];
		}
		NSNumber *isSilenced = [silenced objectForKey:@"silenced"];
		
		SpringBoard *sb = (SpringBoard *)[objc_getClass("UIApplication") sharedApplication];
		
		if([isSilenced boolValue] == YES)
		{
			[sb ringerChanged:0];
			[silenced setObject:[NSNumber numberWithBool:NO] forKey:@"silenced"];
		}else
		{
			[sb ringerChanged:1];
			[silenced setObject:[NSNumber numberWithBool:YES] forKey:@"silenced"];
		}
		[silenced writeToFile:[NSString stringWithFormat:@"%@/Library/Preferences/%@", NSHomeDirectory(), @"com.andyibanez.Maulencer.plist"] atomically:YES];
	}else	
	{
		%orig;
	}
}
%end