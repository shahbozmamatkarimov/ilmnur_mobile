import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    super.key,
    required this.title,
    this.activeIconSrc,
    this.inactiveIconSrc,
    required this.onPressed,
    this.isActive = false,
    this.isSubmenu = false,
    this.count,
    this.countBg = AppColors.mainColor,
  });

  final String title;
  final String? inactiveIconSrc, activeIconSrc;
  final VoidCallback onPressed;
  final bool isActive, isSubmenu;
  final int? count;
  final Color countBg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: isSubmenu ? 20 * 2 : 0, right: isSubmenu ? 20 : 0),
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? AppColors.mainColor : null,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: AppColors.mainColor.withOpacity(0.3),
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: const Offset(0, 1),
              )
          ],
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: onPressed,
          leading: activeIconSrc != null
              ? SvgPicture.asset(
                  (isActive || inactiveIconSrc == null)
                      ? activeIconSrc!
                      : inactiveIconSrc!,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                      isActive
                          ? Theme.of(context).iconTheme.color!
                          : Theme.of(context).textTheme.bodyMedium!.color!,
                      BlendMode.srcIn),
                )
              : null,
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isActive ? AppColors.mainColor : AppColors.mainColor,
            ),
          ),
          trailing: count != null
              ? Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20 / 2, vertical: 20 / 4),
                  decoration: BoxDecoration(
                    color: countBg,
                    borderRadius: BorderRadius.circular(10 / 2),
                  ),
                  child: Text(
                    count.toString(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
