import 'package:akoun/features/auth/presentation/view/choose_view.dart';
import 'package:akoun/features/auth/presentation/view/login_view.dart';
import 'package:akoun/features/auth/presentation/view/register_view.dart';
import 'package:akoun/features/intro/presentation/view/intro_view.dart';
import 'package:akoun/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {

  static const String chooseView = "/choose_view";
  static const String loginView = "/login_view";
  static const String registerView = "/register_view";
  static const String introView = "/intro_view";

  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: chooseView,
        builder: (context, state) => const ChooseView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: registerView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: introView,
        builder: (context, state) => const IntroView(),
      ),
    ],
  );
}
