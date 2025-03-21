// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:testapp/features/course/presentation/pages/main_screen.dart'
    as _i5;
import 'package:testapp/features/home/presentation/pages/courses_screen.dart'
    as _i2;
import 'package:testapp/features/home/presentation/pages/home_screen.dart'
    as _i3;
import 'package:testapp/features/lesson/presentation/pages/lesson_screen.dart'
    as _i4;
import 'package:testapp/features/lessons/presentation/pages/lessons_screen.dart'
    as _i1;
import 'package:testapp/features/news/presentation/pages/news_screen.dart'
    as _i6;
import 'package:testapp/features/onboarding/onboarding_screen.dart'
    as _i7;
import 'package:testapp/features/reyting/presentation/pages/reyting_screen.dart'
    as _i8;
import 'package:testapp/features/tests/presentation/pages/test_screen.dart'
    as _i9;
import 'package:testapp/features/user/presentation/pages/user_screen.dart'
    as _i10;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    CourseRoute.name: (routeData) {
      final args = routeData.argsAs<CourseRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CourseScreen(courseId: args.courseId),
      );
    },
    CoursesRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CoursesScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    LessonRoute.name: (routeData) {
      final args = routeData.argsAs<LessonRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.LessonScreen(lessonId: args.lessonId),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.MainScreen(id: args.id),
      );
    },
    NewsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.NewsScreen(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.OnBoardingScreen(),
      );
    },
    ReytingRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ReytingScreen(),
      );
    },
    TestsRoute.name: (routeData) {
      final args = routeData.argsAs<TestsRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.TestsScreen(testId: args.testId),
      );
    },
    UserRoute.name: (routeData) {
      final args = routeData.argsAs<UserRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.UserScreen(lessonId: args.lessonId),
      );
    },
  };
}

/// generated route for
/// [_i1.CourseScreen]
class CourseRoute extends _i11.PageRouteInfo<CourseRouteArgs> {
  CourseRoute({
    required int courseId,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          CourseRoute.name,
          args: CourseRouteArgs(courseId: courseId),
          initialChildren: children,
        );

  static const String name = 'CourseRoute';

  static const _i11.PageInfo<CourseRouteArgs> page =
      _i11.PageInfo<CourseRouteArgs>(name);
}

class CourseRouteArgs {
  const CourseRouteArgs({required this.courseId});

  final int courseId;

  @override
  String toString() {
    return 'CourseRouteArgs{courseId: $courseId}';
  }
}

/// generated route for
/// [_i2.CoursesScreen]
class CoursesRoute extends _i11.PageRouteInfo<void> {
  const CoursesRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CoursesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoursesRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LessonScreen]
class LessonRoute extends _i11.PageRouteInfo<LessonRouteArgs> {
  LessonRoute({
    required int lessonId,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          LessonRoute.name,
          args: LessonRouteArgs(lessonId: lessonId),
          initialChildren: children,
        );

  static const String name = 'LessonRoute';

  static const _i11.PageInfo<LessonRouteArgs> page =
      _i11.PageInfo<LessonRouteArgs>(name);
}

class LessonRouteArgs {
  const LessonRouteArgs({required this.lessonId});

  final int lessonId;

  @override
  String toString() {
    return 'LessonRouteArgs{lessonId: $lessonId}';
  }
}

/// generated route for
/// [_i5.MainScreen]
class MainRoute extends _i11.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    required int id,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(id: id),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i11.PageInfo<MainRouteArgs> page =
      _i11.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({required this.id});

  final int id;

  @override
  String toString() {
    return 'MainRouteArgs{id: $id}';
  }
}

/// generated route for
/// [_i6.NewsScreen]
class NewsRoute extends _i11.PageRouteInfo<void> {
  const NewsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OnBoardingScreen]
class OnBoardingRoute extends _i11.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i11.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ReytingScreen]
class ReytingRoute extends _i11.PageRouteInfo<void> {
  const ReytingRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ReytingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReytingRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.TestsScreen]
class TestsRoute extends _i11.PageRouteInfo<TestsRouteArgs> {
  TestsRoute({
    required int testId,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          TestsRoute.name,
          args: TestsRouteArgs(testId: testId),
          initialChildren: children,
        );

  static const String name = 'TestsRoute';

  static const _i11.PageInfo<TestsRouteArgs> page =
      _i11.PageInfo<TestsRouteArgs>(name);
}

class TestsRouteArgs {
  const TestsRouteArgs({required this.testId});

  final int testId;

  @override
  String toString() {
    return 'TestsRouteArgs{testId: $testId}';
  }
}

/// generated route for
/// [_i10.UserScreen]
class UserRoute extends _i11.PageRouteInfo<UserRouteArgs> {
  UserRoute({
    required int lessonId,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          UserRoute.name,
          args: UserRouteArgs(lessonId: lessonId),
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static const _i11.PageInfo<UserRouteArgs> page =
      _i11.PageInfo<UserRouteArgs>(name);
}

class UserRouteArgs {
  const UserRouteArgs({required this.lessonId});

  final int lessonId;

  @override
  String toString() {
    return 'UserRouteArgs{lessonId: $lessonId}';
  }
}
