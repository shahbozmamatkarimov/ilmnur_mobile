// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:ilmnur_mobile/features/course/presentation/pages/main_screen.dart'
    as _i5;
import 'package:ilmnur_mobile/features/home/presentation/pages/courses_screen.dart'
    as _i2;
import 'package:ilmnur_mobile/features/home/presentation/pages/home_screen.dart'
    as _i3;
import 'package:ilmnur_mobile/features/lessons/presentation/pages/lessons_screen.dart'
    as _i1;
import 'package:ilmnur_mobile/features/user/presentation/pages/lesson_screen.dart'
    as _i4;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CourseRoute.name: (routeData) {
      final args = routeData.argsAs<CourseRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CourseScreen(courseId: args.courseId),
      );
    },
    CoursesRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CoursesScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    LessonRoute.name: (routeData) {
      final args = routeData.argsAs<LessonRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.LessonScreen(lessonId: args.lessonId),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.MainScreen(id: args.id),
      );
    },
  };
}

/// generated route for
/// [_i1.CourseScreen]
class CourseRoute extends _i6.PageRouteInfo<CourseRouteArgs> {
  CourseRoute({
    required int courseId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          CourseRoute.name,
          args: CourseRouteArgs(courseId: courseId),
          initialChildren: children,
        );

  static const String name = 'CourseRoute';

  static const _i6.PageInfo<CourseRouteArgs> page =
      _i6.PageInfo<CourseRouteArgs>(name);
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
class CoursesRoute extends _i6.PageRouteInfo<void> {
  const CoursesRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CoursesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoursesRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LessonScreen]
class LessonRoute extends _i6.PageRouteInfo<LessonRouteArgs> {
  LessonRoute({
    required int lessonId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          LessonRoute.name,
          args: LessonRouteArgs(lessonId: lessonId),
          initialChildren: children,
        );

  static const String name = 'LessonRoute';

  static const _i6.PageInfo<LessonRouteArgs> page =
      _i6.PageInfo<LessonRouteArgs>(name);
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
class MainRoute extends _i6.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    required int id,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(id: id),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i6.PageInfo<MainRouteArgs> page =
      _i6.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({required this.id});

  final int id;

  @override
  String toString() {
    return 'MainRouteArgs{id: $id}';
  }
}
