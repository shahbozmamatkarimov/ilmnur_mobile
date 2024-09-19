import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';
import 'package:ilmnur_mobile/core/widgets/w_button.dart';
import 'package:ilmnur_mobile/features/group/presentation/pages/course.dart';

class Lessons extends StatelessWidget {
  const Lessons({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  alignment: WrapAlignment.start,
                  spacing: 12,
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
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                for (int i in [
                  1,
                  2,
                  3,
                  4,
                  5,
                  6,
                  7,
                  8,
                  9,
                  10,
                  11,
                  12,
                  13,
                  14,
                  15,
                  16,
                  17,
                  18,
                  19,
                  20,
                  21,
                  22,
                  23,
                  24,
                  25,
                ])
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CoursePage(),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.white,
                      ),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width > 800
                            ? 165
                            : MediaQuery.of(context).size.width / 2 - 30,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: <Widget>[
                              Image.network(
                                'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
                                height: 88,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child; // When image is loaded
                                  } else {
                                    // While the image is loading, show a progress indicator
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                (loadingProgress
                                                        .expectedTotalBytes ??
                                                    1)
                                            : null,
                                      ),
                                    );
                                  }
                                },
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  return const Text(
                                      'Failed to load image'); // Error handling
                                },
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0x801B1B1B),
                                          Color(0x001B1B1B),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                    child: const Text(
                                      "#Matematika",
                                      style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "VUE JS SCRATCH COURSE",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "Vue (pronounced /vjuː/, like view) is a progressive framework for building user interfaces. Unlike other monolithic frameworks, Vue is designed from the ground up to be incrementally adoptable. The core library is focused on the view layer only, and is easy to pick up and integrate with other libraries or existing projects. On the other hand, Vue is also perfectly capable of powering sophisticated Single-Page Applications when used in combination with modern tooling and supporting libraries.",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    SvgPicture.asset("assets/svg/nav/star.svg"),
                                    const SizedBox(width: 4),
                                    const Text(
                                      "355",
                                      style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      "\$24",
                                      style: TextStyle(
                                          color: AppColors.c_1b,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const LinearProgressIndicator(
                                  value: 0.4,
                                  backgroundColor: AppColors.c_e0,
                                  color: AppColors.mainColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2),
                                  ),
                                  semanticsLabel: 'Linear progress indicator',
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "3/10 completed",
                                  style: TextStyle(
                                    color: AppColors.c_07,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: AppColors.mainColor,
                            height: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: -8,
                              children: [
                                for (int i in [
                                  1,
                                  2,
                                  3,
                                  4,
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
                                  textColor: AppColors.c_a1,
                                  fontSize: 12,
                                  verticalPadding: 0,
                                  color: AppColors.transparent,
                                  onTap: () => {},
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CircularProgressIndicatorClass extends StatefulWidget {
  const CircularProgressIndicatorClass({super.key});

  @override
  _CircularProgressIndicatorClassState createState() =>
      _CircularProgressIndicatorClassState();
}

class _CircularProgressIndicatorClassState
    extends State<CircularProgressIndicatorClass> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // backgroundColor: AppColors.transparent,
        backgroundColor: AppColors.backgroundColor,
        body: SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            value: 0.45,
            strokeWidth: 2,
            backgroundColor:
                Color(0XFFEDEDED), // Color behind the progress indicator
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF40E746)),
          ),
        ));
  }
}
