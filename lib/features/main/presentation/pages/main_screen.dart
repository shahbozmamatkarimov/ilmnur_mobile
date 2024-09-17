import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';
import 'package:ilmnur_mobile/features/main/presentation/pages/chat.dart';
import 'package:ilmnur_mobile/features/main/presentation/pages/lessons.dart';
import 'package:ilmnur_mobile/features/main/presentation/pages/news.dart';
import 'package:ilmnur_mobile/features/main/presentation/pages/reyting.dart';
import 'package:ilmnur_mobile/features/main/presentation/pages/settings.dart';
import 'package:ilmnur_mobile/features/main/presentation/pages/users.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

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
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(56.0), // Set your preferred height here
        child: AppBar(
          titleSpacing: 0,
          backgroundColor: const Color(0xFFFFFFFF),
          centerTitle: true,
          title: Container(
              height: 56,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/svg/nav/menu.svg"),
                        const SizedBox(width: 24),
                        SvgPicture.asset("assets/svg/nav/logo.svg"),
                      ],
                    ),
                    SvgPicture.asset("assets/svg/nav/search.svg"),
                  ],
                ),
              )),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 0),
            height: 40,
            color: AppColors.white,
            child: TabBar(
              tabAlignment: TabAlignment.start,
              controller: controllerForMainTabVarView,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              dividerColor: AppColors.transparent,
              isScrollable: true,
              indicatorColor: AppColors.mainColor,
              labelColor: AppColors.mainColor,
              unselectedLabelColor: AppColors.c_24,
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
              labelPadding: const EdgeInsets.only(right: 32),
              overlayColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                // color: AppColors.c_07,
              ),
              tabs: [
                for (String tab in communityTabs)
                  Tab(
                    child: Text(tab),
                  ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controllerForMainTabVarView,
              children: const [
                Lessons(),
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
