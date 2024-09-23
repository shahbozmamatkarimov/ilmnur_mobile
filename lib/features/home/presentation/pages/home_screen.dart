import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilmnur_mobile/config/routes/router.gr.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';
import 'package:ilmnur_mobile/core/util/responsive.dart';
import 'package:ilmnur_mobile/core/widgets/w_bottom_bar_item.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:ilmnur_mobile/core/widgets/w_button.dart';
import 'package:ilmnur_mobile/features/home/presentation/widgets/side_menu_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<List<String>> bottonNavItems = [
    ["home", "Home"],
    ["search", "Search"],
    ["timer", "Timer"],
    ["history", "History"],
    ["profile", "Profile"],
  ];

  int activeBottomNav = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return AutoTabsRouter(
      routes: [
        MainRoute(id: 1),
        const CoursesRoute(),
        const CourseRoute(),
        LessonRoute(lessonId: 1),
        // const CommunityTabRoute(),
        // SearchRoute(),
        // NotificationRoute(),
        // ChatRoute(),
        // MyProfileRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          key: _scaffoldKey,
          drawer: !isDesktop
              ? const Drawer(
                  width: 270,
                  backgroundColor: AppColors.white,
                  child: SideMenuWidget(),
                )
              : null,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              isDesktop ? 84 : 72,
            ), // Set your preferred height here
            child: AppBar(
              titleSpacing: 0,
              backgroundColor: AppColors.transparent,
              centerTitle: true,
              actions: [Container()],
              automaticallyImplyLeading: false,
              toolbarHeight: isDesktop ? 84 : 72,
              title: Container(
                height: isDesktop ? 84 : 72,
                decoration: const BoxDecoration(
                  color: AppColors.transparent,
                ),
                child: Column(children: [
                  isDesktop
                      ? SizedBox(
                          height: 28,
                          child: WindowTitleBarBox(
                            child: Row(
                              children: [
                                Expanded(child: MoveWindow()),
                                const WindowButtons()
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Container(
                    margin: isDesktop
                        ? const EdgeInsets.only(left: 16, right: 16)
                        : null,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: isDesktop ? BorderRadius.circular(8) : null,
                      color: AppColors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            WButton(
                              text: "",
                              verticalPadding: 0,
                              horizontalPadding: 0,
                              onTap: () =>
                                  _scaffoldKey.currentState?.openDrawer(),
                              child:
                                  SvgPicture.asset("assets/svg/nav/menu.svg"),
                            ),
                            const SizedBox(width: 28),
                            SvgPicture.asset("assets/svg/nav/logo.svg"),
                          ],
                        ),
                        SvgPicture.asset("assets/svg/nav/search.svg"),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
          body: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (isDesktop)
                  Container(
                    margin: const EdgeInsets.all(16),
                    width: 270,
                    child: const SizedBox(
                      child: SideMenuWidget(),
                    ),
                  ),
                Expanded(
                  // flex: 7,
                  child: Container(
                    margin: isDesktop
                        ? const EdgeInsets.only(top: 16, bottom: 16, right: 16)
                        : null,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: isDesktop ? AppColors.white : null,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: child,
                  ),
                ),
                // if (isDesktop)
                //   Expanded(
                //     flex: 3,
                //     child: child,
                //   ),
              ],
            ),
          ),
          bottomNavigationBar: !isDesktop
              ? Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(25),
                      topEnd: Radius.circular(25),
                    ),
                    color: AppColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // for (List<String> i, index in bottonNavItems)
                      for (int index = 0;
                          index < bottonNavItems.length;
                          index++)
                        WBottomBarItem(
                          icon:
                              "assets/svg/bottomnav/${bottonNavItems[index][0]}.svg",
                          label: bottonNavItems[index][1],
                          isActive: index == activeBottomNav,
                          onTap: () => {
                            if (index == 0) {context.router.pushNamed("/")},
                            // activeBottomNav = index
                            setState(() {
                              activeBottomNav = index;
                            })
                          },
                        ),
                    ],
                  ),
                )
              : null,
        );
      },
    );
  }
}

final buttonColors = WindowButtonColors(
  iconNormal: AppColors.black,
  mouseOver: AppColors.mainColor,
  mouseDown: AppColors.mainColor,
  iconMouseOver: AppColors.white,
  iconMouseDown: AppColors.white,
);

final closeButtonColors = WindowButtonColors(
  mouseOver: const Color(0xFFB71C1C),
  mouseDown: const Color(0xFFB71C1C),
  iconNormal: AppColors.black,
  iconMouseOver: Colors.white,
);

class WindowButtons extends StatefulWidget {
  const WindowButtons({super.key});

  @override
  State<WindowButtons> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 28, // Set your desired height
          width: 28,
          child: MinimizeWindowButton(colors: buttonColors),
        ),
        Container(
          height: 28, // Set your desired height
          width: 28,
          child: appWindow.isMaximized
              ? RestoreWindowButton(
                  colors: buttonColors,
                  onPressed: maximizeOrRestore,
                )
              : MaximizeWindowButton(
                  colors: buttonColors,
                  onPressed: maximizeOrRestore,
                ),
        ),
        Container(
          height: 28, // Set your desired height
          width: 28,
          child: CloseWindowButton(colors: closeButtonColors),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
