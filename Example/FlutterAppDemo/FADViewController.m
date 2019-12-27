//
//  FADViewController.m
//  FlutterAppDemo
//
//  Created by LeoLai on 12/27/2019.
//  Copyright (c) 2019 LeoLai. All rights reserved.
//

#import "FADViewController.h"
#import "FlutterBoost.h"

@interface FADViewController ()

@end

@implementation FADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    FLBFlutterViewContainer *fvc = FLBFlutterViewContainer.new;
    [fvc setName:@"tab_llw" params:@{}];
    fvc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:fvc animated:YES completion:nil];
    
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"tab_llw_channel" binaryMessenger:fvc];
    
    FlutterBasicMessageChannel *messageChannel = [FlutterBasicMessageChannel messageChannelWithName:@"tab_llw_message_channel" binaryMessenger:fvc];
    
    [messageChannel setMessageHandler:^(id  _Nullable message, FlutterReply  _Nonnull callback) {
        NSLog(@"messageChannel: %@", message);
        [messageChannel sendMessage:[NSString stringWithFormat:@"native to flutter %@", message]];
    }];
    
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"pushViewController"]) {
            FADViewController *vc = [[FADViewController alloc] init];
            vc.view.backgroundColor = [UIColor yellowColor];
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            [fvc presentViewController:vc animated:YES completion:^{
                [channel invokeMethod:@"pushViewControllerFinish" arguments:@"vc"];
            }];
            

        }
    }];
    
    
}

@end
