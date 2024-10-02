import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilmnur_mobile/config/routes/router.gr.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';
import 'package:ilmnur_mobile/core/widgets/w_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ilmnur_mobile/features/lessons/data/data_sources/lessons_service.dart';
import 'package:ilmnur_mobile/features/lessons/data/repositories/impl_lessons_repo.dart';
import 'package:ilmnur_mobile/features/lessons/presentation/bloc/group/lessons_bloc.dart';
import 'package:ilmnur_mobile/features/lessons/presentation/widgets/lessonAccordion.dart';
import 'package:shimmer/shimmer.dart';

// class CourseScreen extends StatefulWidget {
//   const CourseScreen({super.key});

//   @override
//   State<CourseScreen> createState() => _CourseScreenState();
// }
@RoutePage()
class CourseScreen extends StatefulWidget {
  final int courseId;
  const CourseScreen({required this.courseId});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

/// Main example page
class _CourseScreenState extends State<CourseScreen> {
  List myTiles = [];

  // List<String> myTiles = ['Item 1', 'Item 2', 'Item 3'];
  late int isExpanded = 0;
  late bool oldExpanded;
  int count = 0;

  void initializeLessons(List lessons) {
    myTiles = lessons;
  }

  void updateMyTiles(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--; // Adjust for the removed item
      final tile = myTiles.removeAt(oldIndex);
      myTiles.insert(newIndex, tile);
    });
  }

  final List<List<dynamic>> courseDropdown = [
    ["Edit course", () => {}],
    ["Add module", () => {}],
    ["Add lesson", () => {}],
  ];

  final List<String> setDropdown = [
    "Edit set",
    "Delete set",
    "Add modul in set",
  ];

  @override
  build(context) => Scaffold(
        // backgroundColor: Colors.blueGrey[100],
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://picsum.photos/250?image=2',
                  height: 32,
                  width: 32,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const Text(
                "ilmnur_mobile community",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: BlocProvider(
              create: (context) => LessonsBloc(
                id: widget.courseId,
                lessonsRepo: ImplLessonsRepo(
                  lessonsService: LessonsService.create(),
                ),
              ),
              child: BlocBuilder<LessonsBloc, LessonsState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return ClipRect(
                      child: Wrap(
                        spacing: 12.0,
                        runSpacing: 12.0,
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          for (var _ in [1, 2, 3, 4, 5, 6, 7, 8, 9])
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(
                                  0.3), // Background color of the skeleton
                              highlightColor: Colors.grey.withOpacity(
                                  0.1), // Highlight color of the skeleton
                              child: Container(
                                height: 34,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  } else if (state is LoadedLessonsData) {
                    final lessons = state.lessons;
                    final course = state.course;
                    initializeLessons(lessons);
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    course.title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: const Offset(5, 0),
                                    child: WButton(
                                      color: AppColors.transparent,
                                      textColor: AppColors.mainColor,
                                      borderRadius: 8,
                                      fontSize: 14,
                                      verticalPadding: 0,
                                      horizontalPadding: 0,
                                      text: "",
                                      onTap: () => {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              16))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    WButton(
                                                      borderRadius: 4,
                                                      verticalPadding: 4,
                                                      horizontalPadding: 4,
                                                      text: "",
                                                      onTap: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child: SvgPicture.asset(
                                                          "assets/svg/icon/close.svg"),
                                                    ),
                                                    for (dynamic name
                                                        in courseDropdown)
                                                      SizedBox(
                                                        width: double.infinity,
                                                        child: WButton(
                                                          borderRadius: 4,
                                                          verticalPadding: 16,
                                                          horizontalPadding: 0,
                                                          fontSize: 12,
                                                          textColor:
                                                              AppColors.c_07,
                                                          buttonPositionType:
                                                              MainAxisAlignment
                                                                  .start,
                                                          text: "${name[0]}",
                                                          onTap: () => {
                                                            Navigator.pop(
                                                                context),
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        name[1],
                                                              ),
                                                            ),
                                                          },
                                                        ),
                                                      ),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: WButton(
                                                        borderRadius: 4,
                                                        verticalPadding: 16,
                                                        horizontalPadding: 0,
                                                        fontSize: 12,
                                                        textColor:
                                                            AppColors.c_07,
                                                        buttonPositionType:
                                                            MainAxisAlignment
                                                                .start,
                                                        onTap: () => {
                                                          Navigator.pop(
                                                              context),
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0), // Set your desired border radius here
                                                                ),
                                                                backgroundColor:
                                                                    AppColors
                                                                        .white,
                                                                surfaceTintColor:
                                                                    AppColors
                                                                        .white,
                                                                title:
                                                                    const Text(
                                                                  'Delete course',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color:
                                                                        AppColors
                                                                            .c_07,
                                                                  ),
                                                                ),
                                                                content: const Text(
                                                                    'Are you sure you want to delete your course?',
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppColors
                                                                          .c_07,
                                                                    )),
                                                                actions: <Widget>[
                                                                  WButton(
                                                                    borderRadius:
                                                                        8,
                                                                    verticalPadding:
                                                                        0,
                                                                    horizontalPadding:
                                                                        0,
                                                                    textColor:
                                                                        AppColors
                                                                            .c_a1,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    buttonPositionType:
                                                                        MainAxisAlignment
                                                                            .center, // Changed to center
                                                                    text: "cancel"
                                                                        .toUpperCase(),
                                                                    onTap: () =>
                                                                        Navigator.pop(
                                                                            context),
                                                                  ),
                                                                  const SizedBox(
                                                                      width:
                                                                          20),
                                                                  WButton(
                                                                    borderRadius:
                                                                        8,
                                                                    color: AppColors
                                                                        .mainColor,
                                                                    verticalPadding:
                                                                        12,
                                                                    horizontalPadding:
                                                                        24,
                                                                    textColor:
                                                                        AppColors
                                                                            .c_07,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    buttonPositionType:
                                                                        MainAxisAlignment
                                                                            .center, // Changed to center
                                                                    text: "Confirm"
                                                                        .toUpperCase(),
                                                                    onTap: () =>
                                                                        {},
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        },
                                                        text: "Delete course",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      },
                                      child: SizedBox(
                                        height: 28,
                                        child: SvgPicture.asset(
                                          "assets/svg/icon/threedot.svg",
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                course.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/nav/star.svg",
                                    color: AppColors.white,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "${course.price}",
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "${course.price}",
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              const LinearProgressIndicator(
                                value: 0.45,
                                backgroundColor: AppColors.white,
                                color: AppColors.backgroundColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(1.5)),
                              ),
                              const SizedBox(height: 4.0),
                              const Text(
                                "10/45 completed",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.white),
                              ),
                              const SizedBox(height: 12),
                              Wrap(
                                // alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: -8,
                                children: [
                                  for (int i in [
                                    1,
                                    2,
                                    3,
                                    4,
                                    5,
                                    6,
                                  ])
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        'https://picsum.photos/250?image=$i',
                                        height: 24,
                                        width: 24,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  WButton(
                                    text: "+255",
                                    textColor: AppColors.white,
                                    fontSize: 12,
                                    verticalPadding: 0,
                                    color: AppColors.transparent,
                                    onTap: () => {},
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 400,
                          child: ReorderableListView(
                            buildDefaultDragHandles: false,
                            children: [
                              for (int i = 0; i < lessons.length; i++)
                                Container(
                                  key: ValueKey(lessons[i].id),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: isExpanded == lessons[i].id
                                        ? AppColors.mainColor
                                        : AppColors.backgroundColor,
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Column(
                                    children: [
                                      LessonAccordion(
                                        i: i,
                                        isExpanded: isExpanded,
                                        onToggle: (newExpandedState) {
                                          setState(() {
                                            isExpanded =
                                                isExpanded == newExpandedState
                                                    ? 0
                                                    : newExpandedState;
                                          });
                                        },
                                        lesson: lessons[i],
                                      ),
                                      if (isExpanded == lessons[i].id)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            bottom: 10,
                                          ),
                                          child: Column(
                                            children: [
                                              for (int lesson = 0;
                                                  lesson <
                                                      lessons[i].lessons.length;
                                                  lesson++)
                                                LessonAccordion(
                                                  i: lesson,
                                                  isExpanded: isExpanded,
                                                  onToggle: (newExpandedState) {
                                                    setState(() {
                                                      isExpanded = isExpanded ==
                                                              newExpandedState
                                                          ? 0
                                                          : newExpandedState;
                                                    });
                                                  },
                                                  lesson: lessons[i]
                                                      .lessons[lesson],
                                                ),
                                              // GestureDetector(
                                              //   onTap: () {
                                              //     context.router.push(
                                              //       LessonRoute(
                                              //           lessonId: lessons[i]
                                              //               .lessons[lesson]
                                              //               .id),
                                              //     );
                                              //   },
                                              //   child: Container(
                                              //     key: ValueKey(lessons[i]
                                              //         .lessons[lesson]
                                              //         .id),
                                              //     decoration: BoxDecoration(
                                              //       borderRadius:
                                              //           BorderRadius.circular(
                                              //               8),
                                              //       color: isExpanded ==
                                              //               lessons[i]
                                              //                   .lessons[
                                              //                       lesson]
                                              //                   .id
                                              //           ? AppColors.mainColor
                                              //           : AppColors
                                              //               .backgroundColor,
                                              //     ),
                                              //     clipBehavior: Clip.hardEdge,
                                              //     child: Column(
                                              //       children: [
                                              //         ListTile(
                                              //           title: Text(lessons[i]
                                              //               .lessons[lesson]
                                              //               .title),
                                              //           trailing:
                                              //               Transform.rotate(
                                              //             angle: isExpanded ==
                                              //                     lessons[i]
                                              //                         .lessons[
                                              //                             lesson]
                                              //                         .id
                                              //                 ? 180 *
                                              //                     (3.14 / 180)
                                              //                 : 0, // Rotate 45 degrees
                                              //             child: SvgPicture.asset(
                                              //                 "assets/svg/icon/arrow.svg"),
                                              //           ),
                                              //           leading:
                                              //               ReorderableDragStartListener(
                                              //             index: i,
                                              //             child: const Icon(
                                              //                 Icons
                                              //                     .drag_handle),
                                              //           ),
                                              //         ),
                                              //       ],
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                            ],
                            onReorder: (oldIndex, newIndex) {
                              updateMyTiles(oldIndex, newIndex);
                            },
                          ),
                        )
                      ],
                    );
                  } else if (state is ErrorLoadingLessonsData) {
                    return Center(
                      child: Text(
                          'Error loading community data: ${state.errorMessage}'),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ),
      );
}
