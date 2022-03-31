import 'package:get/get.dart';
import 'package:staff_managment_dashboard/main.dart';

import 'binder.dart';
import 'route_names.dart';
import 'screens/login/login_view.dart';

List<GetPage> pages = [
  // GetPage(name: RouteNames.SPLASH, page: () => Splash(), binding: Binder()),
  GetPage(name: RouteNames.HOME, page: () =>  Loginview(), binding: Binder()),
  GetPage(name: RouteNames.SPLASH, page: () => Splash(), binding: Binder()),
  // GetPage(name: RouteNames.FEEDBACK, page: () => FeedbackPage(), binding: Binder()),
  // GetPage(name: RouteNames.VERBTYPE, page: () => VerbTypes(), binding: Binder()),
  // GetPage(name: RouteNames.IDIOMS, page: () => IdiomsAndSlangs(), binding: Binder()),

  // GetPage(name: RouteNames.ADDNOTE, page: () => AddNewNote(), binding: Binder()),
  // GetPage(name: RouteNames.NOTES, page: () => Notes(), binding: Binder()),




];
