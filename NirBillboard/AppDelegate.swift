//
//  AppDelegate.swift
//  NirBillboard
//
//  Created by Nirvana on 7/11/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let userHasOnboardedKey = "user_has_onboarded"

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        application.statusBarStyle = .LightContent
         let userHasOnboardedAlready = NSUserDefaults.standardUserDefaults().boolForKey(userHasOnboardedKey);
        
        if userHasOnboardedAlready {
            
            //如只想第一次打开应用时显示，使用这行代码
            //self.setupNormalRootVC(false);
            
            //测试用代码
            self.window!.rootViewController = self.generateOnboardingViewController()
            
        }
            
            // Otherwise the user hasn't onboarded yet, so set the root view controller for the application to the
            // onboarding view controller generated and returned by this method.
        else {
            self.window!.rootViewController = self.generateOnboardingViewController()
        }
        
        //这句好像并没有什么卵用
        self.window!.makeKeyAndVisible()
        
        return true
    }
    
    func generateOnboardingViewController() -> OnboardingViewController {
        
        let firstPage: OnboardingContentViewController = OnboardingContentViewController(title: "What A Beautiful Photo", body: "This city background image is so beautiful", image: UIImage(named:
            "blue"), buttonText: "") {
                
        }
        
        let secondPage: OnboardingContentViewController = OnboardingContentViewController(title: "I'm So Sorry", body: "I can't get over the nice blurry background photo.", image: UIImage(named:
            "red"), buttonText: "Start") {
                self.handleOnboardingCompletion()
        }
        
        let onboardingVC: OnboardingViewController = OnboardingViewController(backgroundImage: UIImage(named: "Background"), contents: [firstPage, secondPage])
        
        return onboardingVC
        
    }
    
    func handleOnboardingCompletion() {
        // Now that we are done onboarding, we can set in our NSUserDefaults that we've onboarded now, so in the
        // future when we launch the application we won't see the onboarding again.
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: userHasOnboardedKey)
        
        // Setup the normal root view controller of the application, and set that we want to do it animated so that
        // the transition looks nice from onboarding to normal app.
        setupNormalRootVC(true)
    }
    
    //展示主页面函数：此处以代码方式设置主页面
    func setupNormalRootVC(animated : Bool) {
        // Here I'm just creating a generic view controller to represent the root of my application.
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let mainVC = storyBoard.instantiateViewControllerWithIdentifier("TabBarViewID")
        
        // If we want to animate it, animate the transition - in this case we're fading, but you can do it
        // however you want.
        if animated {
            
            UIView.transitionWithView(self.window!, duration: 0.5, options:.TransitionCrossDissolve, animations: { () -> Void in
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.window!.rootViewController = mainVC
                })
                
                //self.window!.rootViewController = mainVC
                }, completion:nil)
        }
            // Otherwise we just want to set the root view controller normally.
        else {
            self.window?.rootViewController = mainVC;
        }
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

