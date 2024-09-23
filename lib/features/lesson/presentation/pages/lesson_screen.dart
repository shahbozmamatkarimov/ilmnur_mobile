import 'dart:developer';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';
import 'package:ilmnur_mobile/core/util/responsive.dart';
import 'package:ilmnur_mobile/core/widgets/w_button.dart';
import 'package:ilmnur_mobile/core/widgets/w_tabbar.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/chat.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/news.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/reyting.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/settings.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/users.dart';
import 'package:ilmnur_mobile/features/home/presentation/pages/home_page.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class LessonScreen extends StatefulWidget {
  final int lessonId;
  LessonScreen({required this.lessonId});
  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
        "https://www.w3schools.com/html/mov_bbb.mp4");
    controller.initialize().then((value) {
      if (controller.value.isInitialized) {
        controller.play();
        setState(() {});
      } else {
        log("video file load failed");
      }
    });
  }

  @override
  void dispose() {
    if (controller.value.isInitialized) {
      controller.dispose();
    }
    super.dispose();
  }

  late final TabController controllerForMainTabVarView =
      TabController(length: 7, vsync: this, initialIndex: 0);

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  final List<String> lessonTabs = [
    "Lectures",
    "Overview",
    "Comments",
    "Similar courses",
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return Scaffold(
      backgroundColor: isDesktop ? AppColors.white : AppColors.backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: AppColors.transparent,
              // shadowColor: AppColors.transparent,
              // foregroundColor: AppColors.transparent,
              // surfaceTintColor: AppColors.transparent,
              expandedHeight: isDesktop ? 466 : 366,
              leadingWidth: 0,
              leading: Text(""),
              toolbarHeight: 0,
              collapsedHeight: 0,
              automaticallyImplyLeading: false,
              floating: false,
              pinned: true,
              stretch: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                background: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: isDesktop ? AppColors.white : null,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          controller.value.isInitialized
                              ? Container(
                                  width: double.infinity, // Full width
                                  height: isDesktop
                                      ? 312
                                      : 212, // Set height to 300
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.black,
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: AspectRatio(
                                    aspectRatio: controller.value.aspectRatio,
                                    child: VideoPlayer(controller),
                                  ),
                                )
                              : const Center(
                                  child: CircularProgressIndicator()),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Column(
                              children: [
                                // Video progress slider
                                ValueListenableBuilder(
                                  valueListenable: controller,
                                  builder:
                                      (context, VideoPlayerValue value, child) {
                                    final duration =
                                        value.duration.inSeconds.toDouble();
                                    final position =
                                        value.position.inSeconds.toDouble();

                                    return SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        trackShape:
                                            const RectangularSliderTrackShape(), // Makes the track go full width
                                        trackHeight:
                                            2.0, // Set the height of the slider track (optional)
                                        thumbShape: const RoundSliderThumbShape(
                                            enabledThumbRadius: 6.0),
                                        overlayShape:
                                            const RoundSliderOverlayShape(
                                                overlayRadius: 10.0),
                                        // You can also modify other styling options as needed
                                      ),
                                      child: Slider(
                                        min: 0.0,
                                        max: duration,
                                        value: position.clamp(0.0, duration),
                                        activeColor: AppColors.mainColor,
                                        inactiveColor: const Color(0x50FFFFFF),
                                        onChanged: (newPosition) {
                                          controller.seekTo(Duration(
                                              seconds: newPosition.toInt()));
                                        },
                                      ),
                                    );
                                  },
                                ),
                                ValueListenableBuilder(
                                  valueListenable: controller,
                                  builder:
                                      (context, VideoPlayerValue value, child) {
                                    String formattedCurrent =
                                        formatDuration(value.position);
                                    String formattedTotal =
                                        formatDuration(value.duration);

                                    // Playback control buttons
                                    return Container(
                                      // margin: const EdgeInsets.only(),
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        top: 6,
                                        bottom: 12,
                                      ),
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x901B1B1B),
                                            Color(0x001B1B1B),
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              WButton(
                                                text: "",
                                                color: AppColors.transparent,
                                                verticalPadding: 0,
                                                horizontalPadding: 0,
                                                onTap: () => controller.play(),
                                                child: SvgPicture.asset(
                                                    "assets/svg/video/play.svg"),
                                              ),
                                              const SizedBox(width: 20),
                                              WButton(
                                                text: "",
                                                color: AppColors.transparent,
                                                verticalPadding: 0,
                                                horizontalPadding: 0,
                                                onTap: () => controller.pause(),
                                                child: SvgPicture.asset(
                                                    "assets/svg/video/sound.svg"),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                "$formattedCurrent / $formattedTotal",
                                                // "${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')} / $formatDuration(duration) / $duration / $position",
                                                style: const TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              WButton(
                                                text: "",
                                                color: AppColors.transparent,
                                                verticalPadding: 0,
                                                horizontalPadding: 0,
                                                onTap: () => controller.seekTo(
                                                  Duration(
                                                      milliseconds: controller
                                                              .value
                                                              .position
                                                              .inMilliseconds -
                                                          10 * 1000),
                                                ),
                                                child: SvgPicture.asset(
                                                    "assets/svg/video/backward.svg"),
                                              ),
                                              const SizedBox(width: 16),
                                              WButton(
                                                text: "",
                                                color: AppColors.transparent,
                                                verticalPadding: 0,
                                                horizontalPadding: 0,
                                                onTap: () => controller.seekTo(
                                                    Duration(
                                                        milliseconds: controller
                                                                .value
                                                                .position
                                                                .inMilliseconds +
                                                            10 * 1000)),
                                                child: SvgPicture.asset(
                                                    "assets/svg/video/forward.svg"),
                                              ),
                                              const SizedBox(width: 16),
                                              // WButton(
                                              //   text: "",
                                              //   color: AppColors.transparent,
                                              //   verticalPadding: 0,
                                              //   horizontalPadding: 0,
                                              //   onTap: () => {},
                                              //   child: SvgPicture.asset(
                                              //       "assets/svg/video/settings.svg"),
                                              // ),
                                              // const SizedBox(width: 16),
                                              // WButton(
                                              //   text: "",
                                              //   color: AppColors.transparent,
                                              //   verticalPadding: 0,
                                              //   horizontalPadding: 0,
                                              //   onTap: () => {},
                                              //   child: SvgPicture.asset(
                                              //       "assets/svg/video/full_screen.svg"),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "VueJS",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              WButton(
                                text: "",
                                verticalPadding: 12,
                                horizontalPadding: 12,
                                color: AppColors.mainColor,
                                borderRadius: 8,
                                onTap: () => {},
                                child: SvgPicture.asset(
                                    "assets/svg/lesson/marked.svg"),
                              ),
                              const SizedBox(width: 12),
                              WButton(
                                text: "",
                                verticalPadding: 12,
                                horizontalPadding: 12,
                                color: AppColors.mainColor,
                                borderRadius: 8,
                                buttonType: ButtonType.outline,
                                onTap: () => {},
                                child: SvgPicture.asset(
                                    "assets/svg/lesson/edit.svg"),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  'https://picsum.photos/250?image=9',
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Marius Ciocirland",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.c_1b.withOpacity(0.9),
                                    ),
                                  ),
                                  Text(
                                    "Behance",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: AppColors.c_1b.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/svg/nav/star.svg"),
                              const SizedBox(width: 4),
                              const Text(
                                "2.3K",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.c_1b,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      // const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        // body: Stack(
        //   children: [
        // SizedBox(height: 40),
        // This Expanded contains the TabBarView
        body: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: isDesktop ? AppColors.white : null,
          ),
          child: Column(
            children: [
              WTabBar(
                tabsList: lessonTabs,
                background: AppColors.transparent,
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
            ],
          ),
        ),
        // Positioned WTabBar at the absolute top
        // Positioned(
        //   top: 0,
        //   left: 0,
        //   right: 0,
        //   height: 56,
        //   child: WTabBar(
        //     tabsList: lessonTabs,
        //     background: AppColors.white,
        //     controllerForMainTabVarView: controllerForMainTabVarView,
        //   ),
        // ),
        // ],
        // ),
      ),
    );
  }
}
