@interface UIApplication (Private)
@property UIInterfaceOrientation activeInterfaceOrientation;
@end

static BOOL fakeiPad = NO;

%hook UIDevice
-(UIUserInterfaceIdiom)userInterfaceIdiom
{
	if (fakeiPad) return UIUserInterfaceIdiomPad;
	return %orig;
}
%end

%hook UIActionSheet

-(void)showInView:(UIView *)v
{
	fakeiPad = YES;
	%orig;
	fakeiPad = NO;
}

- (void)showFromTabBar:(UITabBar *)view
{
	fakeiPad = YES;
	%orig;
	fakeiPad = NO;
}

- (void)showFromToolbar:(UIToolbar *)view
{
	fakeiPad = YES;
	%orig;
	fakeiPad = NO;
}

- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
	fakeiPad = YES;
	%orig;
	fakeiPad = NO;
}

- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated
{
	fakeiPad = YES;
	%orig;
	fakeiPad = NO;
}

- (void)_presentFromBarButtonItem:(UIBarButtonItem *)barButtonItem orFromRect:(CGRect)rect inView:(UIView *)view direction:(UIPopoverArrowDirection)direction allowInteractionWithViews:(NSArray *)views backgroundStyle:(int)backgroundStyle animated:(BOOL)animated
{
	%orig(barButtonItem, rect, view, UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].activeInterfaceOrientation) ? UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown : UIPopoverArrowDirectionLeft | UIPopoverArrowDirectionRight, views, backgroundStyle, animated);
}
%end
