import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuriosity/shared/widgets/action_button.dart';
import 'package:kuriosity/features/auth/ui/screens/country_and_phone_number_input_screen.dart';
import 'package:kuriosity/shared/widgets/coustom_appbar.dart';
import 'package:kuriosity/app/app_theme.dart';

class _OnboardPageData {
  final String title;
  final String body;

  _OnboardPageData({required this.title, required this.body});
}

class ThirdOnbordingScreen extends StatefulWidget {
  const ThirdOnbordingScreen({super.key});

  @override
  State<ThirdOnbordingScreen> createState() => _ThirdOnbordingScreenState();
}

class _ThirdOnbordingScreenState extends State<ThirdOnbordingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<_OnboardPageData> _pages = [
    _OnboardPageData(
      title: 'Build dialog with people',
      body:
          'Post your lifestyle, ask questions, and celebrate the small win toward a healthy planet',
    ),
    _OnboardPageData(
      title: 'Join group activities',
      body:
          'Want to learn how to eat healthy, drive eco-friendly, and grow a beautiful garden in your backyard? Let’s do it together',
    ),
    _OnboardPageData(
      title: 'Share your knowledge',
      body:
          'Become a power influencer by hosting your own workshops. The more you share valuable tips, the more eco-friendly future',
    ),
  ];
  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppbar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 550,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              const SizedBox(height: 350),
                              Text(
                                page.title,
                                style: textTheme.titleLarge!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                page.body,
                                style: textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(flex: 2),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_pages.length, (index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 4,
                        width: _currentPage == index ? 100 : 100,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppTheme.primaryColor
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ActionButton(
                          title: 'Back',
                          onPressed: _prevPage,
                          type: ActionButtonType.text,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: ActionButton(
                          title: _currentPage == _pages.length - 1
                              ? 'Finish'
                              : 'Next',
                          onPressed: _currentPage == _pages.length - 1
                              ? () {
                                  Get.off(CountryAndPhoneNumberInputScreen());
                                }
                              : _nextPage,
                          type: ActionButtonType.filled,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
