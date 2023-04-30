import 'package:zfuel/export_all.dart';
import 'package:zfuel/front_end/pages/nearby_gas_station_page.dart';
import 'package:zfuel/front_end/pages/order_summary_page.dart';

class AppRoutes {
  static const Transition _transition = Transition.circularReveal;
  static const Duration _duration = Duration(seconds: 2);

  static List<GetPage> getPages = [
    GetPage(
      name: '/',
      page: () => const OrderSummaryPage(),
      transition: _transition,
      transitionDuration: _duration,
    ),
    GetPage(
      name: SignInPage.id,
      page: () => const SignInPage(),
      transition: _transition,
      transitionDuration: _duration,
    ),
    GetPage(
      name: SignUpPage.id,
      page: () => const SignUpPage(),
      transition: _transition,
      transitionDuration: _duration,
    ),
    GetPage(
      name: HomePage.id,
      page: () => const HomePage(),
      transition: _transition,
      transitionDuration: _duration,
    ),
  ];
}
