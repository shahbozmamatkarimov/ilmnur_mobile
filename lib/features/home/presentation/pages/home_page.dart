import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilmnur_mobile/config/routes/router.gr.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';
import 'package:ilmnur_mobile/core/widgets/w_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ilmnur_mobile/features/course/presentation/pages/lessons_screen.dart';
import 'package:ilmnur_mobile/features/course/presentation/pages/main_screen.dart';
import 'package:ilmnur_mobile/features/home/data/data_sources/group/group_service.dart';
import 'package:ilmnur_mobile/features/home/data/repositories/impl_group_repo.dart';
import 'package:ilmnur_mobile/features/home/presentation/bloc/group/group_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          BlocProvider(
            create: (context) => GroupBloc(
              groupRepo: ImplGroupRepo(
                groupService: GroupService.create(),
              ),
            ),
            child: BlocBuilder<GroupBloc, GroupState>(
              builder: (context, state) {
                if (state is GroupLoading) {
                  return SingleChildScrollView(
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        for (var _ in [1, 2, 3, 4, 5, 6, 7, 8, 9])
                          Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(
                                0.3), // Background color of the skeleton
                            highlightColor: Colors.grey.withOpacity(
                                0.1), // Highlight color of the skeleton
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.white,
                              ),
                              height: 200,
                              constraints: const BoxConstraints(
                                maxWidth: 350, // Set the maximum width to 200
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                } else if (state is LoadedGroupData) {
                  final group = state.group;
                  return SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.spaceEvenly,
                      // runAlignment: WrapAlignment.spaceBetween,
                      // crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        for (dynamic i in group)
                          GestureDetector(
                            onTap: () {
                              context.router.push(
                                MainRoute(id: i.id),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.white,
                              ),
                              constraints: const BoxConstraints(
                                maxWidth: 350, // Set the maximum width to 200
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
                                        height: 177,
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
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  'https://picsum.photos/250?image=9',
                                                  height: 20,
                                                  width: 20,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                "${i.user.name} ${i.user.surname}",
                                                style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
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
                                            Text(
                                              "\$${i.low_price} - \$${i.high_price}",
                                              style: const TextStyle(
                                                  color: AppColors.c_1b,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          children: [
                                            WButton(
                                              text:
                                                  "${i.courses_count} courses",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              textColor: AppColors.c_07,
                                              verticalPadding: 8,
                                              horizontalPadding: 12,
                                              color: AppColors.c_f2,
                                              onTap: () => {},
                                            ),
                                            WButton(
                                              text: "Education",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              textColor: AppColors.c_07,
                                              verticalPadding: 8,
                                              horizontalPadding: 12,
                                              color: AppColors.c_f2,
                                              onTap: () => {},
                                            ),
                                            WButton(
                                              text: "226K learners",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              textColor: AppColors.c_07,
                                              verticalPadding: 8,
                                              horizontalPadding: 12,
                                              color: AppColors.c_f2,
                                              onTap: () => {},
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Wrap(
                                          // alignment: WrapAlignment.center,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
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
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: Image.network(
                                                  'https://picsum.photos/250?image=$i',
                                                  height: 32,
                                                  width: 32,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            WButton(
                                              text: "255 learners",
                                              textColor: AppColors.c_a1,
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
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                } else if (state is ErrorLoadingGroupData) {
                  return Center(
                    child: Text(
                        'Error loading category data: ${state.errorMessage}'),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
