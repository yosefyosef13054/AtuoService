import 'package:get/get.dart';

import 'package:autoservice/app/modules/Cars_for_sell/bindings/cars_for_sell_binding.dart';
import 'package:autoservice/app/modules/Cars_for_sell/views/cars_for_sell_view.dart';
import 'package:autoservice/app/modules/Cart/bindings/cart_binding.dart';
import 'package:autoservice/app/modules/Cart/views/cart_view.dart';
import 'package:autoservice/app/modules/HomeScreen/bindings/home_screen_binding.dart';
import 'package:autoservice/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:autoservice/app/modules/Sign_In/bindings/sign_in_binding.dart';
import 'package:autoservice/app/modules/Sign_Up/bindings/sign_up_binding.dart';
import 'package:autoservice/app/modules/Sign_Up/views/sign_up_view.dart';
import 'package:autoservice/app/modules/Sign_in/views/sign_in_view.dart';
import 'package:autoservice/app/modules/accessories/bindings/accessories_binding.dart';
import 'package:autoservice/app/modules/accessories/views/accessories_view.dart';
import 'package:autoservice/app/modules/accessories_add/bindings/accessories_add_binding.dart';
import 'package:autoservice/app/modules/accessories_add/views/accessories_add_view.dart';
import 'package:autoservice/app/modules/add_address/bindings/add_address_binding.dart';
import 'package:autoservice/app/modules/add_address/views/add_address_view.dart';
import 'package:autoservice/app/modules/address_payment/bindings/address_payment_binding.dart';
import 'package:autoservice/app/modules/address_payment/views/address_payment_view.dart';
import 'package:autoservice/app/modules/adds/bindings/adds_binding.dart';
import 'package:autoservice/app/modules/adds/views/adds_view.dart';
import 'package:autoservice/app/modules/againest_insurance/bindings/againest_insurance_binding.dart';
import 'package:autoservice/app/modules/againest_insurance/views/againest_insurance_view.dart';
import 'package:autoservice/app/modules/bdalah/bindings/bdalah_binding.dart';
import 'package:autoservice/app/modules/bdalah/views/bdalah_view.dart';
import 'package:autoservice/app/modules/car_detail/bindings/car_detail_binding.dart';
import 'package:autoservice/app/modules/car_detail/views/car_detail_view.dart';
import 'package:autoservice/app/modules/cars_insurance/bindings/cars_insurance_binding.dart';
import 'package:autoservice/app/modules/cars_insurance/views/cars_insurance_view.dart';
import 'package:autoservice/app/modules/cars_services/bindings/cars_services_binding.dart';
import 'package:autoservice/app/modules/cars_services/views/cars_services_view.dart';
import 'package:autoservice/app/modules/cars_services_details/bindings/cars_services_details_binding.dart';
import 'package:autoservice/app/modules/cars_services_details/views/cars_services_details_view.dart';
import 'package:autoservice/app/modules/chat/bindings/chat_binding.dart';
import 'package:autoservice/app/modules/chat/views/chat_view.dart';
import 'package:autoservice/app/modules/customerServices/bindings/customer_services_binding.dart';
import 'package:autoservice/app/modules/customerServices/views/customer_services_view.dart';
import 'package:autoservice/app/modules/drawer_menu/bindings/drawer_menu_binding.dart';
import 'package:autoservice/app/modules/drawer_menu/views/drawer_menu_view.dart';
import 'package:autoservice/app/modules/failed_payment/bindings/failed_payment_binding.dart';
import 'package:autoservice/app/modules/failed_payment/views/failed_payment_view.dart';
import 'package:autoservice/app/modules/fullinsurance/bindings/fullinsurance_binding.dart';
import 'package:autoservice/app/modules/fullinsurance/views/fullinsurance_view.dart';
import 'package:autoservice/app/modules/fullinsurance_offers/bindings/fullinsurance_offers_binding.dart';
import 'package:autoservice/app/modules/fullinsurance_offers/views/fullinsurance_offers_view.dart';
import 'package:autoservice/app/modules/fullinsurance_offers_details/bindings/fullinsurance_offers_details_binding.dart';
import 'package:autoservice/app/modules/fullinsurance_offers_details/views/fullinsurance_offers_details_view.dart';
import 'package:autoservice/app/modules/heavyCars_add/bindings/heavy_cars_add_binding.dart';
import 'package:autoservice/app/modules/heavyCars_add/views/heavy_cars_add_view.dart';
import 'package:autoservice/app/modules/heavyCars_list/bindings/heavy_cars_list_binding.dart';
import 'package:autoservice/app/modules/heavyCars_list/views/heavy_cars_list_view.dart';
import 'package:autoservice/app/modules/heavy_cars/bindings/heavy_cars_binding.dart';
import 'package:autoservice/app/modules/heavy_cars/views/heavy_cars_view.dart';
import 'package:autoservice/app/modules/myAdds/bindings/my_adds_binding.dart';
import 'package:autoservice/app/modules/myAdds/views/my_adds_view.dart';
import 'package:autoservice/app/modules/myProfile/bindings/my_profile_binding.dart';
import 'package:autoservice/app/modules/myProfile/views/my_profile_view.dart';
import 'package:autoservice/app/modules/my_orders/bindings/my_orders_binding.dart';
import 'package:autoservice/app/modules/my_orders/views/my_orders_view.dart';
import 'package:autoservice/app/modules/myfavorite/bindings/myfavorite_binding.dart';
import 'package:autoservice/app/modules/myfavorite/views/myfavorite_view.dart';
import 'package:autoservice/app/modules/new_accessories/bindings/new_accessories_binding.dart';
import 'package:autoservice/app/modules/new_accessories/views/new_accessories_view.dart';
import 'package:autoservice/app/modules/new_accessories_details/bindings/new_accessories_details_binding.dart';
import 'package:autoservice/app/modules/new_accessories_details/views/new_accessories_details_view.dart';
import 'package:autoservice/app/modules/otp/bindings/otp_binding.dart';
import 'package:autoservice/app/modules/otp/views/otp_view.dart';
import 'package:autoservice/app/modules/payment_success/bindings/payment_success_binding.dart';
import 'package:autoservice/app/modules/payment_success/views/payment_success_view.dart';
import 'package:autoservice/app/modules/scrap_add/bindings/scrap_add_binding.dart';
import 'package:autoservice/app/modules/scrap_add/views/scrap_add_view.dart';
import 'package:autoservice/app/modules/scrap_car_details/bindings/scrap_car_details_binding.dart';
import 'package:autoservice/app/modules/scrap_car_details/views/scrap_car_details_view.dart';
import 'package:autoservice/app/modules/scrap_cars_and_equipments/bindings/scrap_cars_and_equipments_binding.dart';
import 'package:autoservice/app/modules/scrap_cars_and_equipments/views/scrap_cars_and_equipments_view.dart';
import 'package:autoservice/app/modules/scrap_delivery_request/bindings/scrap_delivery_request_binding.dart';
import 'package:autoservice/app/modules/scrap_delivery_request/views/scrap_delivery_request_view.dart';
import 'package:autoservice/app/modules/scrap_garages/bindings/scrap_garages_binding.dart';
import 'package:autoservice/app/modules/scrap_garages/views/scrap_garages_view.dart';
import 'package:autoservice/app/modules/scrap_orders/bindings/scrap_orders_binding.dart';
import 'package:autoservice/app/modules/scrap_orders/views/scrap_orders_view.dart';
import 'package:autoservice/app/modules/scrap_request/bindings/scrap_request_binding.dart';
import 'package:autoservice/app/modules/scrap_request/views/scrap_request_view.dart';
import 'package:autoservice/app/modules/scrap_request2/bindings/scrap_request2_binding.dart';
import 'package:autoservice/app/modules/scrap_request2/views/scrap_request2_view.dart';
import 'package:autoservice/app/modules/service_time/bindings/service_time_binding.dart';
import 'package:autoservice/app/modules/service_time/views/service_time_view.dart';
import 'package:autoservice/app/modules/sittings/bindings/sittings_binding.dart';
import 'package:autoservice/app/modules/sittings/views/sittings_view.dart';
import 'package:autoservice/app/modules/spareParts/bindings/spare_parts_binding.dart';
import 'package:autoservice/app/modules/spareParts/views/spare_parts_view.dart';
import 'package:autoservice/app/modules/splashScreen/bindings/splash_screen_binding.dart';
import 'package:autoservice/app/modules/splashScreen/views/splash_screen_view.dart';
import 'package:autoservice/app/modules/terms/bindings/terms_binding.dart';
import 'package:autoservice/app/modules/terms/views/terms_view.dart';
import 'package:autoservice/app/modules/terms_conditions/bindings/terms_conditions_binding.dart';
import 'package:autoservice/app/modules/call/views/call_view.dart';
import 'package:autoservice/app/modules/call/bindings/call_binding.dart';
import 'package:autoservice/app/modules/terms_conditions/bindings/terms_conditions_binding.dart';
import 'package:autoservice/app/modules/terms_conditions/views/terms_conditions_view.dart';
import 'package:autoservice/app/modules/terms_conditions/views/terms_conditions_view.dart';
import 'package:autoservice/app/modules/usedCars_add/bindings/used_cars_add_binding.dart';
import 'package:autoservice/app/modules/usedCars_add/views/used_cars_add_view.dart';
import 'package:autoservice/app/modules/used_accessories/bindings/used_accessories_binding.dart';
import 'package:autoservice/app/modules/used_accessories/views/used_accessories_view.dart';
import 'package:autoservice/app/modules/used_accessories_details/bindings/used_accessories_details_binding.dart';
import 'package:autoservice/app/modules/used_accessories_details/views/used_accessories_details_view.dart';
import 'package:autoservice/app/modules/used_cars_forsell/bindings/used_cars_forsell_binding.dart';
import 'package:autoservice/app/modules/used_cars_forsell/views/used_cars_forsell_view.dart';
import 'package:autoservice/app/modules/webViewInAPP/bindings/web_view_in_a_p_p_binding.dart';
import 'package:autoservice/app/modules/webViewInAPP/views/web_view_in_a_p_p_view.dart';
import 'package:autoservice/app/modules/webviewScreen/bindings/webview_screen_binding.dart';
import 'package:autoservice/app/modules/webviewScreen/views/webview_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH_SCREEN;
  // static const HomeScreen = Routes.HOME_SCREEN;
  static const HomeScreen = Routes.SPLASH_SCREEN;
  static final routes = [
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => HomeView(),
    //   binding: HomeBinding(),
    // ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.CARS_FOR_SELL,
      page: () => CarsForSellView(),
      binding: CarsForSellBinding(),
    ),
    GetPage(
      name: _Paths.USED_CARS_FORSELL,
      page: () => UsedCarsForsellView(),
      binding: UsedCarsForsellBinding(),
    ),
    GetPage(
      name: _Paths.CAR_DETAIL,
      page: () => CarDetailView(),
      binding: CarDetailBinding(),
    ),
    GetPage(
      name: _Paths.SCRAP_CARS_AND_EQUIPMENTS,
      page: () => ScrapCarsAndEquipmentsView(),
      binding: ScrapCarsAndEquipmentsBinding(),
    ),
    GetPage(
      name: _Paths.SCRAP_CAR_DETAILS,
      page: () => ScrapCarDetailsView(),
      binding: ScrapCarDetailsBinding(),
    ),
    GetPage(
      name: _Paths.HEAVY_CARS,
      page: () => HeavyCarsView(),
      binding: HeavyCarsBinding(),
    ),
    GetPage(
      name: _Paths.ACCESSORIES,
      page: () => AccessoriesView(),
      binding: AccessoriesBinding(),
    ),
    GetPage(
      name: _Paths.USED_ACCESSORIES,
      page: () => UsedAccessoriesView(),
      binding: UsedAccessoriesBinding(),
    ),
    GetPage(
      name: _Paths.USED_ACCESSORIES_DETAILS,
      page: () => UsedAccessoriesDetailsView(),
      binding: UsedAccessoriesDetailsBinding(),
    ),
    GetPage(
      name: _Paths.NEW_ACCESSORIES_DETAILS,
      page: () => NewAccessoriesDetailsView(),
      binding: NewAccessoriesDetailsBinding(),
    ),
    GetPage(
      name: _Paths.NEW_ACCESSORIES,
      page: () => NewAccessoriesView(),
      binding: NewAccessoriesBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_PAYMENT,
      page: () => AddressPaymentView(),
      binding: AddressPaymentBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ADDRESS,
      page: () => AddAddressView(),
      binding: AddAddressBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_SUCCESS,
      page: () => PaymentSuccessView(),
      binding: PaymentSuccessBinding(),
    ),
    GetPage(
      name: _Paths.CARS_INSURANCE,
      page: () => CarsInsuranceView(),
      binding: CarsInsuranceBinding(),
    ),
    GetPage(
      name: _Paths.DRAWER_MENU,
      page: () => DrawerMenuView(),
      binding: DrawerMenuBinding(),
    ),
    GetPage(
      name: _Paths.FULLINSURANCE_OFFERS,
      page: () => FullinsuranceOffersView(),
      binding: FullinsuranceOffersBinding(),
    ),
    GetPage(
      name: _Paths.FULLINSURANCE_OFFERS_DETAILS,
      page: () => FullinsuranceOffersDetailsView(),
      binding: FullinsuranceOffersDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CARS_SERVICES,
      page: () => CarsServicesView(),
      binding: CarsServicesBinding(),
    ),
    GetPage(
      name: _Paths.CARS_SERVICES_DETAILS,
      page: () => CarsServicesDetailsView(),
      binding: CarsServicesDetailsBinding(),
    ),
    GetPage(
      name: _Paths.AGAINEST_INSURANCE,
      page: () => AgainestInsuranceView(),
      binding: AgainestInsuranceBinding(),
    ),
    GetPage(
      name: _Paths.FULLINSURANCE,
      page: () => FullinsuranceView(),
      binding: FullinsuranceBinding(),
    ),
    GetPage(
      name: _Paths.ACCESSORIES_ADD,
      page: () => AccessoriesAddView(),
      binding: AccessoriesAddBinding(),
    ),
    GetPage(
      name: _Paths.HEAVY_CARS_ADD,
      page: () => HeavyCarsAddView(),
      binding: HeavyCarsAddBinding(),
    ),
    GetPage(
      name: _Paths.ADDS,
      page: () => AddsView(),
      binding: AddsBinding(),
    ),
    GetPage(
      name: _Paths.SCRAP_ADD,
      page: () => ScrapAddView(),
      binding: ScrapAddBinding(),
    ),
    GetPage(
      name: _Paths.BDALAH,
      page: () => BdalahView(),
      binding: BdalahBinding(),
    ),
    GetPage(
      name: _Paths.SCRAP_GARAGES,
      page: () => ScrapGaragesView(),
      binding: ScrapGaragesBinding(),
    ),
    GetPage(
      name: _Paths.USED_CARS_ADD,
      page: () => UsedCarsAddView(),
      binding: UsedCarsAddBinding(),
    ),
    GetPage(
      name: _Paths.SCRAP_ORDERS,
      page: () => ScrapOrdersView(),
      binding: ScrapOrdersBinding(),
    ),
    GetPage(
      name: _Paths.SCRAP_REQUEST,
      page: () => ScrapRequestView(),
      binding: ScrapRequestBinding(),
    ),
    GetPage(
      name: _Paths.SCRAP_REQUEST2,
      page: () => ScrapRequest2View(),
      binding: ScrapRequest2Binding(),
    ),
    GetPage(
      name: _Paths.SCRAP_DELIVERY_REQUEST,
      page: () => ScrapDeliveryRequestView(),
      binding: ScrapDeliveryRequestBinding(),
    ),
    GetPage(
      name: _Paths.FAILED_PAYMENT,
      page: () => FailedPaymentView(),
      binding: FailedPaymentBinding(),
    ),
    GetPage(
      name: _Paths.HEAVY_CARS_LIST,
      page: () => HeavyCarsListView(),
      binding: HeavyCarsListBinding(),
    ),
    GetPage(
      name: Routes.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: Routes.SPARE_PARTS,
      page: () => SparePartsView(),
      binding: SparePartsBinding(),
    ),
    GetPage(
      name: Routes.CALL,
      page: () => CallView(),
      binding: CallBinding(),
    ),
    GetPage(
      name: Routes.SERVICE_TIME,
      page: () => ServiceTimeView(),
      binding: ServiceTimeBinding(),
    ),
    GetPage(
      name: Routes.MY_ORDERS,
      page: () => MyOrdersView(),
      binding: MyOrdersBinding(),
    ),
    GetPage(
      name: Routes.MY_PROFILE,
      page: () => MyProfileView(),
      binding: MyProfileBinding(),
    ),
    GetPage(
      name: Routes.MY_ADDS,
      page: () => MyAddsView(),
      binding: MyAddsBinding(),
    ),
    // GetPage(
    //   name: Routes.WEBVIEW_SCREEN,
    //   page: () => WebviewScreenView(),
    //   binding: WebviewScreenBinding(),
    // ),
    GetPage(
      name: Routes.WEB_VIEW_IN_A_P_P,
      page: () => WebViewInAPPView(),
      binding: WebViewInAPPBinding(),
    ),
    GetPage(
      name: Routes.MYFAVORITE,
      page: () => MyfavoriteView(),
      binding: MyfavoriteBinding(),
    ),
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.SITTINGS,
      page: () => SittingsView(),
      binding: SittingsBinding(),
    ),
    GetPage(
      name: Routes.TERMS_CONDITIONS,
      page: () => TermsConditionsView(),
      binding: TermsConditionsBinding(),
    ),

    GetPage(
      name: Routes.TERMS,
      page: () => TermsView(),
      binding: TermsBinding(),
    ),
    GetPage(
      name: Routes.CUSTOMER_SERVICES,
      page: () => CustomerServicesView(),
      binding: CustomerServicesBinding(),
    ),
  ];
}
