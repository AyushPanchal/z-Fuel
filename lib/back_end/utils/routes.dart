import 'package:zfuel/export_all.dart';
import 'package:zfuel/front_end/pages/nearby_gas_station_page.dart';

class AppRoutes {
  static const Transition _transition = Transition.circularReveal;
  static const Duration _duration = Duration(seconds: 1);

  static List<GetPage> getPages = [
    GetPage(
      name: '/',
      page: () => const OnboardingPage(),
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
    GetPage(
      name: FuelChoicePage.id,
      page: () => const FuelChoicePage(),
      transition: _transition,
      transitionDuration: _duration,
    ),
    GetPage(
      name: NearbyGasStationPage.id,
      page: () => const NearbyGasStationPage(),
      transition: _transition,
      transitionDuration: _duration,
    ),
    GetPage(
      name: GasStationPage.id,
      page: () => const GasStationPage(),
      transition: _transition,
      transitionDuration: _duration,
    ),
    GetPage(
      name: OrderSummaryPage.id,
      page: () => const OrderSummaryPage(),
      transition: _transition,
      transitionDuration: _duration,
    ),
    GetPage(
      name: PaymentPage.id,
      page: () => const PaymentPage(),
      transition: _transition,
      transitionDuration: _duration,
    ),
  ];
}
