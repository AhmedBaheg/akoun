import 'package:akoun/features/auth/presentation/view/login_view.dart';
import 'package:akoun/features/auth/presentation/view/register_view.dart';
import 'package:akoun/features/intro/presentation/view/intro_view.dart';
import 'package:akoun/features/island/presentation/view/island_view.dart';
import 'package:akoun/features/island_words/presentation/view/listening_practice_view.dart';
import 'package:akoun/features/island_words/presentation/view/island_words_view.dart';
import 'package:akoun/features/island_words/presentation/view/pronunciation_practice_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/view/choose_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';

class AppRouter {
  static const String chooseView = "/choose_view";
  static const String loginView = "/login_view";
  static const String registerView = "/register_view";
  static const String introView = "/intro_view";
  static const String islandView = "/island_view";
  static const String islandWordsView = "/island_words_view";
  static const String learnLetterView = "/learn_letter_view";
  static const String rememberLetterView = "/remember_letter_view";
  static const String pronunciationPracticeView =
      "/pronunciation_practice_view";
  static const String listeningPracticeView = "/listening_practice_view";

  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: chooseView,
        builder: (context, state) => const ChooseView(),
      ),
      GoRoute(path: loginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: registerView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(path: introView, builder: (context, state) => const IntroView()),
      GoRoute(path: islandView, builder: (context, state) => const IslandView()),
      GoRoute(
        path: islandWordsView,
        builder: (context, state) => const IslandWordsView(),
      ),
      // GoRoute(
      //   path: learnLetterView,
      //   builder: (context, state) {
      //     final letter = state.extra as String? ?? 'ب';
      //     return LearnLetterView(letter: letter);
      //   },
      // ),
      // GoRoute(
      //   path: rememberLetterView,
      //   builder: (context, state) {
      //     final letter = state.extra as String? ?? 'ب';
      //     return RememberLetterView(letter: letter);
      //   },
      // ),
      GoRoute(
        path: pronunciationPracticeView,
        builder: (context, state) {
          final letter = state.extra as String? ?? 'ب';
          return PronunciationPracticeView(letter: letter);
        },
      ),
      GoRoute(
        path: listeningPracticeView,
        builder: (context, state) {
          final letter = state.extra as String? ?? 'ب';
          return ListeningPracticeView(letter: letter);
        },
      ),
    ],
  );
}
