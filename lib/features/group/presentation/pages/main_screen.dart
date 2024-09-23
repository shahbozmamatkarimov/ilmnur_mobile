import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';
import 'package:ilmnur_mobile/core/widgets/w_tabbar.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/chat.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/lessons_screen.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/news.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/reyting.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/settings.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/users.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  final int id;
  MainScreen({required this.id});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late final TabController controllerForMainTabVarView =
      TabController(length: 7, vsync: this, initialIndex: 0);

  final List<String> communityTabs = [
    "Lessons",
    "Chat",
    "News",
    "Reyting",
    "Settings",
    "Users",
    "Users",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Column(
        children: [
          Text("${widget.id}"),
          WTabBar(
            leftPadding: 20,
            tabsList: communityTabs,
            controllerForMainTabVarView: controllerForMainTabVarView,
          ),
          Expanded(
            child: TabBarView(
              controller: controllerForMainTabVarView,
              children: [
                Lessons(id: widget.id),
                Chat(),
                News(),
                Reyting(),
                Settings(),
                Users(),
                Users(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
