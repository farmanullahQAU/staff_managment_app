import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'binder.dart';
import 'constants/theme.dart';
import 'firebase_options.dart';
import 'pages.dart';
import 'route_names.dart';
import 'screens/group/groups_view.dart';
import 'screens/login/login_view.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);


  runApp(const SMS());
}

class SMS extends StatelessWidget {
  const SMS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {    return GetMaterialApp(

    builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 1300,
          minWidth: 450,
          defaultScale: true,

          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      
      navigatorObservers: [BotToastNavigatorObserver()],
    

      initialBinding: Binder(),
      title: "SMS",

      initialRoute: RouteNames.SPLASH,
      getPages: pages,

       //if we need default text dark theme use this 
      darkTheme: ThemeData.dark(),

      //change dark theme accoring to your need use this
      //  darkTheme:AppTheme. darkCustomTheme,

      themeMode: ThemeMode.system,
      theme: AppTheme.customTheme,

      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: AnimatedSplashScreen(
          splash: Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset('images/tyre.svg',width: 100,),
              Positioned(top:60,child: SvgPicture.asset('images/rim.svg',width: 120,)),
    
            ],
          ),
          duration: 2000,
          splashIconSize: 200,
          nextScreen: GropsHomeView()),
    );
  }
}
