import 'package:get/get.dart';

import 'package:tokopedia/app/modules/OTPVerification/bindings/o_t_p_verification_binding.dart';
import 'package:tokopedia/app/modules/OTPVerification/views/o_t_p_verification_view.dart';
import 'package:tokopedia/app/modules/checkemail/bindings/checkemail_binding.dart';
import 'package:tokopedia/app/modules/checkemail/views/checkemail_view.dart';
import 'package:tokopedia/app/modules/createProduk/bindings/create_produk_binding.dart';
import 'package:tokopedia/app/modules/createProduk/views/create_produk_view.dart';
import 'package:tokopedia/app/modules/createSlider/bindings/create_slider_binding.dart';
import 'package:tokopedia/app/modules/createSlider/views/create_slider_view.dart';
import 'package:tokopedia/app/modules/detail/bindings/detail_binding.dart';
import 'package:tokopedia/app/modules/detail/views/detail_view.dart';
import 'package:tokopedia/app/modules/home/bindings/home_binding.dart';
import 'package:tokopedia/app/modules/home/views/home_view.dart';
import 'package:tokopedia/app/modules/homeAdmin/bindings/home_admin_binding.dart';
import 'package:tokopedia/app/modules/homeAdmin/views/home_admin_view.dart';
import 'package:tokopedia/app/modules/login/bindings/login_binding.dart';
import 'package:tokopedia/app/modules/login/views/login_view.dart';
import 'package:tokopedia/app/modules/loginWithPhoneNumber/bindings/login_with_phone_number_binding.dart';
import 'package:tokopedia/app/modules/loginWithPhoneNumber/views/login_with_phone_number_view.dart';
import 'package:tokopedia/app/modules/produkData/bindings/produk_data_binding.dart';
import 'package:tokopedia/app/modules/produkData/views/produk_data_view.dart';
import 'package:tokopedia/app/modules/register/bindings/register_binding.dart';
import 'package:tokopedia/app/modules/register/views/register_view.dart';
import 'package:tokopedia/app/modules/resetpassword/bindings/resetpassword_binding.dart';
import 'package:tokopedia/app/modules/resetpassword/views/resetpassword_view.dart';
import 'package:tokopedia/app/modules/sliderData/bindings/slider_data_binding.dart';
import 'package:tokopedia/app/modules/sliderData/views/slider_data_view.dart';
import 'package:tokopedia/app/modules/splashScreen/bindings/splash_screen_binding.dart';
import 'package:tokopedia/app/modules/splashScreen/views/splash_screen_view.dart';
import 'package:tokopedia/app/modules/updateData/bindings/update_data_binding.dart';
import 'package:tokopedia/app/modules/updateData/views/update_data_view.dart';
import 'package:tokopedia/app/modules/updateProduk/bindings/update_produk_binding.dart';
import 'package:tokopedia/app/modules/updateProduk/views/update_produk_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASSWORD,
      page: () => ResetpasswordView(),
      binding: ResetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHECKEMAIL,
      page: () => CheckemailView(),
      binding: CheckemailBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_WITH_PHONE_NUMBER,
      page: () => LoginWithPhoneNumberView(),
      binding: LoginWithPhoneNumberBinding(),
    ),
    GetPage(
      name: _Paths.O_T_P_VERIFICATION,
      page: () => OTPVerificationView(),
      binding: OTPVerificationBinding(),
    ),
    GetPage(
      name: _Paths.HOME_ADMIN,
      page: () => HomeAdminView(),
      binding: HomeAdminBinding(),
    ),
    GetPage(
      name: _Paths.SLIDER_DATA,
      page: () => SliderDataView(),
      binding: SliderDataBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_DATA,
      page: () => UpdateDataView(),
      binding: UpdateDataBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_SLIDER,
      page: () => CreateSliderView(),
      binding: CreateSliderBinding(),
    ),
    GetPage(
      name: _Paths.PRODUK_DATA,
      page: () => ProdukDataView(),
      binding: ProdukDataBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PRODUK,
      page: () => CreateProdukView(),
      binding: CreateProdukBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PRODUK,
      page: () => UpdateProdukView(),
      binding: UpdateProdukBinding(),
    ),
  ];
}
