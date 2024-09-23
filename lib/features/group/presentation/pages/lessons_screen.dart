import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';
import 'package:ilmnur_mobile/core/widgets/w_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ilmnur_mobile/features/group/data/data_sources/group_service.dart';
import 'package:ilmnur_mobile/features/group/data/repositories/impl_group_repo.dart';
import 'package:ilmnur_mobile/features/group/presentation/bloc/group/group_bloc.dart';
import 'package:shimmer/shimmer.dart';

// @RoutePage()
class Lessons extends StatelessWidget {
  // const Lessons({super.key});
  final int id;
  Lessons({required this.id});

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
                    for (int _ in [1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4])
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
            BlocProvider(
              create: (context) => GroupBloc(
                id: id,
                groupRepo: ImplGroupRepo(
                  groupService: GroupService.create(),
                ),
              ),
              child: BlocBuilder<GroupBloc, GroupState>(
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
                  } else if (state is LoadedGroupData) {
                    final groups = state.group;
                    return Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        for (dynamic i in groups)
                          GestureDetector(
                            onTap: () => context.router.pushNamed("/course"),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.white,
                              ),
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width >
                                        800
                                    ? 165
                                    : MediaQuery.of(context).size.width / 2 -
                                        30,
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: <Widget>[
                                      Image.network(
                                        i.cover,
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
                                            Object error,
                                            StackTrace? stackTrace) {
                                          return const Text(
                                              'Failed to load image'); // Error handling
                                        },
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          i.title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          i.description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                "assets/svg/nav/star.svg"),
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
                                          semanticsLabel:
                                              'Linear progress indicator',
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
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      spacing: -8,
                                      children: [
                                        for (int i in [
                                          1,
                                          2,
                                          3,
                                          4,
                                        ])
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
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
                    );
                  } else if (state is ErrorLoadingGroupData) {
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
