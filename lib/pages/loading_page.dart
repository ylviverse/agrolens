import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:Agrolens/pages/intro_page.dart'; 

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isUserInteracting = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });

    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted && !_isUserInteracting) {
        if (_currentPage == 0) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
        _startAutoScroll(); // Loop the auto scroll
      } else if (mounted && _isUserInteracting) {
        // If user is still interacting, check again in 1 second
        _startAutoScroll();
      }
    });
  }

  void _onUserInteraction() {
    setState(() {
      _isUserInteracting = true;
    });
    
    // Resume auto-scroll after 3 seconds of no interaction
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isUserInteracting = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF9bc03f),
              Color(0xFF404642),
              Color(0xFFecc95d),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: GestureDetector(
          onTap: _onUserInteraction,
          onPanStart: (_) => _onUserInteraction(),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    _onUserInteraction(); // User swiped manually
                  },
                  children: [
                    _buildOnboardingPage(
                      context: context,
                      lottieAsset: 'assets/animations/Camera.json',
                      title: 'Snap & Analyze',
                      description:
                          'Easily analyze rice leaf diseases with the help of AI.\n\nRice diseases detectable are the following:\n\nRice blast || Brown spot || Leaf blight\nSheath blight || Bacterial leaf streak.',
                      size: size,
                    ),
                    _buildOnboardingPage(
                      context: context,
                      lottieAsset: 'assets/animations/Farmer_crop.json',
                      title: 'Protect Your Rice Crops',
                      description:
                          'Get rice disease diagnoses and effective solutions to keep your crops healthy and maximize harvest.\n\nStay informed with the latest research and best practices for rice disease management.',
                      size: size,
                      isLastPage: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: GestureDetector(
                  onTap: _onUserInteraction,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 2,
                    effect: const WormEffect(
                      dotColor: Colors.white54,
                      activeDotColor: Colors.white,
                      dotHeight: 10.0,
                      dotWidth: 10.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingPage({
    required BuildContext context,
    required String lottieAsset,
    required String title,
    required String description,
    required Size size,
    bool isLastPage = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.12),
            Lottie.asset(
              lottieAsset,
              width: size.width * 0.7,
              height: size.width * 0.7,
              fit: BoxFit.contain,
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width * 0.07,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: size.height * 0.02),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(size.width * 0.04),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: size.width * 0.04,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),

            if (!isLastPage) ...[
              SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF53662f),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],

            if (isLastPage) ...[
              SizedBox(height: 70),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const IntroPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF53662f),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}