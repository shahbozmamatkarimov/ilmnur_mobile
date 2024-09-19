import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';
import 'package:ilmnur_mobile/core/widgets/w_button.dart';

// class CoursePage extends StatefulWidget {
//   const CoursePage({super.key});

//   @override
//   State<CoursePage> createState() => _CoursePageState();
// }
class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

/// Main example page
class _CoursePageState extends State<CoursePage> {
  final List<List<dynamic>> courseDropdown = [
    ["Edit course", () => {}],
    ["Add set", () => {}],
    ["Add modul", () => {}],
  ];

  final List<String> setDropdown = [
    "Edit set",
    "Delete set",
    "Add modul in set",
  ];

  final List<List<Map<String, dynamic>>> courseModules = [
    [
      {
        "isExpanded": false,
        "moduleName": "Name1",
        "lessons": ["Hello", "Hi"]
      },
    ],
    [
      {
        "isExpanded": false,
        "moduleName": "Name2",
        "lessons": ["Hello", "Hi"]
      },
    ],
    [
      {
        "isExpanded": false,
        "moduleName": "Name3",
        "lessons": ["Hello", "Hi"]
      },
    ],
    [
      {
        "isExpanded": false,
        "moduleName": "Name4",
        "lessons": ["Hello", "Hi"]
      },
    ],
    [
      {
        "isExpanded": false,
        "moduleName": "Name5",
        "lessons": ["Hello", "Hi"]
      },
    ],
    [
      {
        "isExpanded": false,
        "moduleName": "Name",
        "lessons": ["Hello", "Hi"]
      },
    ],
    [
      {
        "isExpanded": false,
        "moduleName": "Name",
        "lessons": ["Hello", "Hi"]
      },
    ],
    [
      {
        "isExpanded": false,
        "moduleName": "Name",
        "lessons": ["Hello", "Hi"]
      },
    ],
    [
      {
        "isExpanded": false,
        "moduleName": "Name",
        "lessons": ["Hello", "Hi"]
      },
    ],
    [
      {
        "isExpanded": false,
        "moduleName": "Name",
        "lessons": ["Hello", "Hi"]
      },
    ],
    [
      {
        "isExpanded": false,
        "moduleName": "Name",
        "lessons": ["Hello", "Hi"]
      },
    ],
    [
      {
        "isExpanded": false,
        "moduleName": "Name",
        "lessons": ["Hello", "Hi"]
      },
    ],
  ];

  @override
  build(context) => Scaffold(
        // backgroundColor: Colors.blueGrey[100],
        backgroundColor: AppColors.backgroundColor,
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
            child: Column(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "ilmnur_mobile 101",
                            style: TextStyle(
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
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFFFFFFFF),
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(16))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            WButton(
                                              borderRadius: 4,
                                              verticalPadding: 4,
                                              horizontalPadding: 4,
                                              text: "",
                                              onTap: () =>
                                                  Navigator.pop(context),
                                              child: SvgPicture.asset(
                                                  "assets/svg/icon/close.svg"),
                                            ),
                                            for (dynamic name in courseDropdown)
                                              SizedBox(
                                                width: double.infinity,
                                                child: WButton(
                                                    borderRadius: 4,
                                                    verticalPadding: 16,
                                                    horizontalPadding: 0,
                                                    fontSize: 12,
                                                    textColor: AppColors.c_07,
                                                    buttonPositionType:
                                                        MainAxisAlignment.start,
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
                                                        }),
                                              ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: WButton(
                                                borderRadius: 4,
                                                verticalPadding: 16,
                                                horizontalPadding: 0,
                                                fontSize: 12,
                                                textColor: AppColors.c_07,
                                                buttonPositionType:
                                                    MainAxisAlignment.start,
                                                onTap: () => {
                                                  Navigator.pop(context),
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  12.0), // Set your desired border radius here
                                                        ),
                                                        backgroundColor:
                                                            AppColors.white,
                                                        surfaceTintColor:
                                                            AppColors.white,
                                                        title: const Text(
                                                          'Delete course',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                AppColors.c_07,
                                                          ),
                                                        ),
                                                        content: const Text(
                                                            'Are you sure you want to delete your course?',
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .c_07,
                                                            )),
                                                        actions: <Widget>[
                                                          WButton(
                                                            borderRadius: 8,
                                                            verticalPadding: 0,
                                                            horizontalPadding:
                                                                0,
                                                            textColor:
                                                                AppColors.c_a1,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                              width: 20),
                                                          WButton(
                                                            borderRadius: 8,
                                                            color: AppColors
                                                                .mainColor,
                                                            verticalPadding: 12,
                                                            horizontalPadding:
                                                                24,
                                                            textColor:
                                                                AppColors.c_07,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            buttonPositionType:
                                                                MainAxisAlignment
                                                                    .center, // Changed to center
                                                            text: "Confirm"
                                                                .toUpperCase(),
                                                            onTap: () => {},
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
                      const Text(
                        "Vue (pronounced /vjuː/, like view) is a progressive framework for building user interfaces. Unlike other monolithic frameworks, Vue is designed from the ground up to be incrementally adoptable. The core library is focused on the view layer only, and is easy to pick up and integrate with other libraries or existing projects. On the other hand, Vue is also perfectly capable of powering sophisticated Single-Page Applications when used in combination with modern tooling and supporting libraries.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
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
                          const Text(
                            "355",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "\$24",
                            style: TextStyle(
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
                        color: AppColors.c_e0,
                        borderRadius: BorderRadius.all(Radius.circular(1.5)),
                      ),
                      const SizedBox(height: 4.0),
                      const Text(
                        "10/45 completed",
                        style: TextStyle(fontSize: 14, color: AppColors.white),
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
                Container(
                  // decoration:
                  //     BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  // clipBehavior: Clip.hardEdge,
                  child: Column(
                    children: courseModules.map((module) {
                      return ExpansionPanelList(
                        elevation: 0,
                        dividerColor: AppColors.c_07,
                        expandedHeaderPadding: EdgeInsets.zero,
                        materialGapSize: 0,
                        expansionCallback: (panelIndex, isExpanded) {
                          setState(() {
                            courseModules.forEach((module) {
                              module[0]['isExpanded'] = false;
                            });
                            module[panelIndex]['isExpanded'] = isExpanded;
                          });
                        },
                        children: module
                            .map(
                              (e) => ExpansionPanel(
                                backgroundColor: e['isExpanded']
                                    ? AppColors.mainColor
                                    : AppColors.white,
                                canTapOnHeader: true,
                                headerBuilder:
                                    (BuildContext _, bool isExpanded) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          // Container(
                                          //   color: AppColors.mainColor,
                                          //   width: 4,
                                          //   height: 40,
                                          // ),
                                          const SizedBox(width: 16),
                                          Text(
                                            "${e['moduleName']}",
                                            style: const TextStyle(
                                              color: AppColors.c_07,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      e['isExpanded']
                                          ? Transform.rotate(
                                              angle: 90 *
                                                  (pi /
                                                      180), // Convert degrees to radians
                                              child: WButton(
                                                borderRadius: 4,
                                                verticalPadding: 0,
                                                horizontalPadding: 0,
                                                color: AppColors.transparent,
                                                buttonPositionType:
                                                    MainAxisAlignment.start,
                                                text: "",
                                                onTap: () => {
                                                  e['isExpanded'] = true,
                                                  showModalBottomSheet<void>(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration: const BoxDecoration(
                                                            color: Color(
                                                                0xFFFFFFFF),
                                                            borderRadius:
                                                                BorderRadius.vertical(
                                                                    top: Radius
                                                                        .circular(
                                                                            16))),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: <Widget>[
                                                              WButton(
                                                                borderRadius: 4,
                                                                verticalPadding:
                                                                    4,
                                                                horizontalPadding:
                                                                    4,
                                                                text: "",
                                                                onTap: () =>
                                                                    Navigator.pop(
                                                                        context),
                                                                child: SvgPicture
                                                                    .asset(
                                                                        "assets/svg/icon/close.svg"),
                                                              ),
                                                              for (String name
                                                                  in setDropdown)
                                                                SizedBox(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                      WButton(
                                                                    borderRadius:
                                                                        4,
                                                                    verticalPadding:
                                                                        16,
                                                                    horizontalPadding:
                                                                        0,
                                                                    fontSize:
                                                                        12,
                                                                    textColor:
                                                                        AppColors
                                                                            .c_07,
                                                                    buttonPositionType:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    text: name,
                                                                    onTap: () =>
                                                                        Navigator.pop(
                                                                            context),
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
                                                      "assets/svg/icon/threedot.svg"),
                                                ),
                                              ),
                                            )
                                          : const Text(""),
                                    ],
                                  );
                                },
                                isExpanded: e['isExpanded'],
                                body: Column(
                                  children: [
                                    for (String _ in e["lessons"])
                                      SizedBox(
                                        width: double.infinity,
                                        child: WButton(
                                          borderRadius: 0,
                                          verticalPadding: 0,
                                          horizontalPadding: 0,
                                          buttonPositionType:
                                              MainAxisAlignment.start,
                                          text: "",
                                          onTap: () => {},
                                          // onTap: () => Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => Module(),
                                          //   ),
                                          // ),
                                          child: Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.5,
                                                  bottom: 8.5,
                                                  left: 36,
                                                  right: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Lesson 1",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: AppColors.c_07,
                                                        fontSize: 12),
                                                  ),
                                                  SvgPicture.asset(
                                                      "assets/svg/classroom/checked.svg"),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
