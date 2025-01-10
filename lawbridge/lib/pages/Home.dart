import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:lawbridge/component/CustomBottomNavigationBar.dart';
import 'package:lawbridge/pages/AvailableLawyer.dart';
import 'package:lawbridge/pages/ChatBotDemoScreen.dart';
import 'package:lawbridge/pages/ChatScreen.dart';
import 'package:lawbridge/pages/FilterPage.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 243, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 110,
        leading: Container(
          child: const Padding(
            padding: EdgeInsets.all(7.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/chetan.png'), // Replace with your profile image
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            padding: EdgeInsets.only(right: 35),
            icon: const Icon(Icons.chat, color: Colors.black),
            onPressed: () {
              Get.to(() => ChatScreen(),
                  transition: Transition.downToUp,
                  duration: const Duration(milliseconds: 800));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 300,
                  height: 50,
                  color: Colors.white,
                  child: TextField(
                    onTap: () {
                      Get.to(
                        () => SearchScreen(),
                      );
                    },
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        hintText: 'Search',
                        contentPadding: EdgeInsets.all(15),
                        border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Banner Slider
              Container(
                height: 150,
                child: ExpandableCarousel.builder(
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        // height: MediaQuery.of(context).size.height,
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(
                          'assets/slider.png',
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    options: ExpandableCarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                    )),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 25, 80, 85), // Background color
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      blurRadius: 8, // Spread of shadow
                      offset: Offset(0, 4), // Position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16), // Padding inside the container
                child: InkWell(
                  onTap: () {
                    Get.to(
                      () => ChatBotDemoScreen(),
                      transition: Transition.downToUp,
                      duration: const Duration(milliseconds: 800),
                    );
                  },
                  child: const Text(
                    "Chat With A.I Chatbot >",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              // Services Section
              const Text(
                'Services',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(top: 40, bottom: 40, left: 10),
                color: Color.fromARGB(255, 213, 234, 255),
                child: SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildServiceTile('Business Setup', Icons.business_center,
                          'assets/businessSetup.png'),
                      _buildServiceTile('Documentation', Icons.description,
                          'assets/documentation.png'),
                      _buildServiceTile(
                          'Contracts', Icons.article, 'assets/disputes.png'),
                      _buildServiceTile('Consultation', Icons.support_agent,
                          'assets/consultant.png'),
                      _buildServiceTile('Legal Advice', Icons.gavel,
                          'assets/legalAdvice.png'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Lawyer Categories Section
              const Text(
                'Lawyers',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                child: SizedBox(
                  height: 150, // Set the height for the category grid
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // Set to 1 for horizontal scrolling
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return _buildCategoryTile(index);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Recommended Lawyers Section
              const Text(
                'Recommended Lawyers',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 30, left: 10),
                color: Color.fromARGB(255, 213, 234, 255),
                child: SizedBox(
                  height: 200, // Adjust height based on the card size
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return _buildRecommendedLawyerTile(index);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget _buildServiceTile(String title, IconData icon, String imageAsset) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 251, 251, 251),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageAsset,
            height: 40,
            width: 40,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTile(int index) {
    List<String> categories = [
      'Criminal',
      'Civil',
      'Corporate',
      'Public Interest',
      'Immigration',
      'Intellectual Property',
    ];
    List<String> categoryImages = [
      'assets/criminal.png',
      'assets/civil.png',
      'assets/corporate.png',
      'assets/publicInterest.png',
      'assets/immigration.png',
      'assets/property.png',
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            categoryImages[index],
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            categories[index],
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedLawyerTile(int index) {
    List<String> lawyers = ['Ann', 'Amanda', 'Chavan'];
    List<String> lawyerImages = [
      'assets/ritika.png',
      'assets/simran.png',
      'assets/chetan.png',
    ];

    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              lawyerImages[index],
              height: 170,
              width: 140,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            lawyers[index],
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
