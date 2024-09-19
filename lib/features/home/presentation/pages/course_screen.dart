import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';
import 'package:ilmnur_mobile/core/util/responsive.dart';
import 'package:ilmnur_mobile/core/widgets/w_bottom_bar_item.dart';
import 'package:ilmnur_mobile/core/widgets/w_button.dart';
import 'package:ilmnur_mobile/core/widgets/w_tabbar.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/chat.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/lessons.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/news.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/reyting.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/settings.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/users.dart';
import 'package:ilmnur_mobile/features/home/presentation/pages/home_page.dart';

@RoutePage()
class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen>
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
    final isDesktop = Responsive.isDesktop(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: isDesktop
            ? const EdgeInsets.only(top: 16, bottom: 16, right: 16)
            : null,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isDesktop ? AppColors.white : null,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(right: 12),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 8,
                        children: [
                          WButton(
                            text: "All",
                            fontSize: 12,
                            borderRadius: 20,
                            verticalPadding: 8,
                            horizontalPadding: 12,
                            color: AppColors.mainColor,
                            textColor: AppColors.white,
                            onTap: () => {},
                          ),
                          for (int i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4])
                            WButton(
                              text: "Business",
                              fontSize: 12,
                              borderRadius: 20,
                              verticalPadding: 5,
                              horizontalPadding: 12,
                              color: AppColors.mainColor,
                              textColor: AppColors.mainColor,
                              buttonType: ButtonType.outline,
                              onTap: () => {},
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                // WButton(
                //   text: "",
                //   borderRadius: 20,
                //   verticalPadding: 8,
                //   horizontalPadding: 12,
                //   color: AppColors.mainColor,
                //   textColor: AppColors.white,
                //   child: SvgPicture.asset("assets/svg/nav/filter.svg"),
                //   onTap: () => {},
                // ),
                Row(
                  children: [
                    WButton(
                      text: "More",
                      fontSize: 12,
                      borderRadius: 20,
                      verticalPadding: 8,
                      horizontalPadding: 12,
                      color: AppColors.mainColor,
                      textColor: AppColors.white,
                      onTap: () => {},
                    ),
                    const SizedBox(width: 12),
                    WButton(
                      text: "",
                      borderRadius: 20,
                      verticalPadding: 8,
                      horizontalPadding: 12,
                      color: AppColors.mainColor,
                      textColor: AppColors.white,
                      child: SvgPicture.asset("assets/svg/nav/filter.svg"),
                      onTap: () => {},
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            WTabBar(
              tabsList: communityTabs,
              controllerForMainTabVarView: controllerForMainTabVarView,
            ),
            Expanded(
              child: TabBarView(
                controller: controllerForMainTabVarView,
                children: const [
                  HomePage(),
                  Chat(),
                  News(),
                  Reyting(),
                  Settings(),
                  Users(),
                  Users(),
                ],
              ),
            ),
            // Wrap(
            //   spacing: 20,
            //   runSpacing: 20,
            //   // alignment: WrapAlignment.spaceBetween,
            //   // runAlignment: alignment,
            //   children: [
            //     for (int i in [
            //       1,
            //       2,
            //       3,
            //       4,
            //       5,
            //       6,
            //       7,
            //       8,
            //       9,
            //       10,
            //       11,
            //       12,
            //       13,
            //       14,
            //       15,
            //       16,
            //       17,
            //       18,
            //       19,
            //       20,
            //       21,
            //       22,
            //       23,
            //       24,
            //       25,
            //     ])
            //       Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(12),
            //           color: AppColors.white,
            //         ),
            //         constraints: BoxConstraints(
            //           maxWidth: 350, // Set the maximum width to 200
            //         ),
            //         clipBehavior: Clip.hardEdge,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Stack(
            //               clipBehavior: Clip.none,
            //               children: <Widget>[
            //                 Image.network(
            //                   'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
            //                   height: 177,
            //                   width: double.infinity,
            //                   fit: BoxFit.cover,
            //                   loadingBuilder: (BuildContext context,
            //                       Widget child,
            //                       ImageChunkEvent? loadingProgress) {
            //                     if (loadingProgress == null) {
            //                       return child; // When image is loaded
            //                     } else {
            //                       // While the image is loading, show a progress indicator
            //                       return Center(
            //                         child: CircularProgressIndicator(
            //                           value: loadingProgress
            //                                       .expectedTotalBytes !=
            //                                   null
            //                               ? loadingProgress
            //                                       .cumulativeBytesLoaded /
            //                                   (loadingProgress
            //                                           .expectedTotalBytes ??
            //                                       1)
            //                               : null,
            //                         ),
            //                       );
            //                     }
            //                   },
            //                   errorBuilder: (BuildContext context,
            //                       Object error, StackTrace? stackTrace) {
            //                     return const Text(
            //                         'Failed to load image'); // Error handling
            //                   },
            //                 ),
            //                 Positioned(
            //                   top: 0,
            //                   left: 0,
            //                   child: Container(
            //                     width: MediaQuery.of(context).size.width,
            //                     padding: const EdgeInsets.all(6),
            //                     decoration: const BoxDecoration(
            //                       gradient: LinearGradient(
            //                         colors: [
            //                           Color(0x801B1B1B),
            //                           Color(0x001B1B1B),
            //                         ],
            //                         begin: Alignment.topCenter,
            //                         end: Alignment.bottomCenter,
            //                       ),
            //                     ),
            //                     child: Row(
            //                       children: [
            //                         ClipRRect(
            //                           borderRadius: BorderRadius.circular(10),
            //                           child: Image.network(
            //                             'https://picsum.photos/250?image=9',
            //                             height: 20,
            //                             width: 20,
            //                             fit: BoxFit.cover,
            //                           ),
            //                         ),
            //                         const SizedBox(width: 8),
            //                         const Text(
            //                           "Kitani Studio",
            //                           style: TextStyle(
            //                               fontSize: 12,
            //                               fontWeight: FontWeight.w600),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.all(12),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   const Text(
            //                     "VUE JS SCRATCH COURSE",
            //                     style: TextStyle(fontWeight: FontWeight.bold),
            //                   ),
            //                   const SizedBox(height: 8),
            //                   const Text(
            //                     "Vue (pronounced /vjuː/, like view) is a progressive framework for building user interfaces. Unlike other monolithic frameworks, Vue is designed from the ground up to be incrementally adoptable. The core library is focused on the view layer only, and is easy to pick up and integrate with other libraries or existing projects. On the other hand, Vue is also perfectly capable of powering sophisticated Single-Page Applications when used in combination with modern tooling and supporting libraries.",
            //                     maxLines: 2,
            //                     overflow: TextOverflow.ellipsis,
            //                     style: TextStyle(
            //                       fontSize: 12,
            //                     ),
            //                   ),
            //                   const SizedBox(height: 8),
            //                   Row(
            //                     children: [
            //                       SvgPicture.asset("assets/svg/nav/star.svg"),
            //                       const SizedBox(width: 4),
            //                       const Text(
            //                         "355",
            //                         style: TextStyle(
            //                           color: AppColors.mainColor,
            //                           fontSize: 12,
            //                         ),
            //                       ),
            //                       const SizedBox(width: 8),
            //                       const Text(
            //                         "\$2 - \$24",
            //                         style: TextStyle(
            //                             color: AppColors.c_1b,
            //                             fontSize: 12,
            //                             fontWeight: FontWeight.w600),
            //                       ),
            //                     ],
            //                   ),
            //                   const SizedBox(height: 8),
            //                   Wrap(
            //                     spacing: 8,
            //                     runSpacing: 8,
            //                     children: [
            //                       WButton(
            //                         text: "3 courses",
            //                         fontSize: 12,
            //                         fontWeight: FontWeight.w500,
            //                         textColor: AppColors.c_07,
            //                         verticalPadding: 8,
            //                         horizontalPadding: 12,
            //                         color: AppColors.c_f2,
            //                         onTap: () => {},
            //                       ),
            //                       WButton(
            //                         text: "Education",
            //                         fontSize: 12,
            //                         fontWeight: FontWeight.w500,
            //                         textColor: AppColors.c_07,
            //                         verticalPadding: 8,
            //                         horizontalPadding: 12,
            //                         color: AppColors.c_f2,
            //                         onTap: () => {},
            //                       ),
            //                       WButton(
            //                         text: "226K learners",
            //                         fontSize: 12,
            //                         fontWeight: FontWeight.w500,
            //                         textColor: AppColors.c_07,
            //                         verticalPadding: 8,
            //                         horizontalPadding: 12,
            //                         color: AppColors.c_f2,
            //                         onTap: () => {},
            //                       ),
            //                     ],
            //                   ),
            //                   const SizedBox(height: 12),
            //                   Wrap(
            //                     // alignment: WrapAlignment.center,
            //                     crossAxisAlignment: WrapCrossAlignment.center,
            //                     spacing: -8,
            //                     children: [
            //                       for (int i in [
            //                         1,
            //                         2,
            //                         3,
            //                         4,
            //                         5,
            //                         6,
            //                       ])
            //                         ClipRRect(
            //                           borderRadius: BorderRadius.circular(16),
            //                           child: Image.network(
            //                             'https://picsum.photos/250?image=$i',
            //                             height: 32,
            //                             width: 32,
            //                             fit: BoxFit.cover,
            //                           ),
            //                         ),
            //                       WButton(
            //                         text: "255 learners",
            //                         textColor: AppColors.c_a1,
            //                         fontSize: 12,
            //                         verticalPadding: 0,
            //                         color: AppColors.transparent,
            //                         onTap: () => {},
            //                       )
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
