import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../../utils/app_strings.dart/app_strings.dart';
import '../../screens/home/screens/home_screen.dart';
import '../../screens/profile/screens/profile_screen.dart';
import '../custom_image/custom_image.dart';
import 'bottom_nav_controller.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<BottomNavController>(
      builder: (navcontroller) {
        return Scaffold(
          body: _screens[navcontroller.selectedIndex],
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.transparent,
              backgroundColor: AppColors.backgroundWhite,
              shadowColor: AppColors.backgroundWhite,
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
                states,
              ) {
                return textTheme.labelMedium!.copyWith(
                  color: states.contains(WidgetState.selected)
                      ? AppColors.primary
                      : Colors.grey,
                );
              }),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
              ),
              child: SizedBox(
                height: 80,
                child: NavigationBar(
                  selectedIndex: navcontroller.selectedIndex,
                  onDestinationSelected: navcontroller.changeIndex,
                  destinations: [
                    NavigationDestination(
                      icon: CustomImage(
                        imageSrc: navcontroller.selectedIndex == 0
                            ? AppIcons.selectedhome
                            : AppIcons.unselectedhome,
                      ),
                      label: AppStrings.home,
                    ),
                    NavigationDestination(
                      icon: CustomImage(
                        imageSrc: navcontroller.selectedIndex == 1
                            ? AppIcons.selectedsmile
                            : AppIcons.unselectedsmile,
                      ),
                      label: AppStrings.group,
                    ),
                    NavigationDestination(
                      icon: CustomImage(
                        imageSrc: navcontroller.selectedIndex == 2
                            ? AppIcons.selectededit
                            : AppIcons.unselectededit,
                      ),
                      label: AppStrings.post,
                    ),
                    NavigationDestination(
                      icon: CustomImage(
                        imageSrc: navcontroller.selectedIndex == 3
                            ? AppIcons.selectedbell
                            : AppIcons.unselectedbell,
                      ),
                      label: AppStrings.notific,
                    ),
                    NavigationDestination(
                      icon: CustomImage(
                        imageSrc: navcontroller.selectedIndex == 4
                            ? AppIcons.selectedaccount
                            : AppIcons.unselectedaccount,
                      ),
                      label: AppStrings.profile,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
