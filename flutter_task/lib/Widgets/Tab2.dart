import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tab2Content(),
    );
  }
}

class Tab2Content extends StatefulWidget {
  @override
  _Tab2ContentScreenState createState() => _Tab2ContentScreenState();
}

class _Tab2ContentScreenState extends State<Tab2Content>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<int> selectedBeds = [];
  int _selectedTabIndex = 0;
  int _selectedImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  void toggleBedSelection(int bedCount) {
    setState(() {
      if (selectedBeds.contains(bedCount)) {
        selectedBeds.remove(bedCount);
      } else {
        selectedBeds.add(bedCount);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0), // Hide the default app bar
        child: Container(),
      ),
      body: Column(
        children: [
          Container(
            height: 50, // Adjust the height of the tabs
            child: Row(
              children: [
                for (int tabIndex = 0; tabIndex < 4; tabIndex++)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _tabController.animateTo(tabIndex);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: _selectedTabIndex == tabIndex
                            ? Colors.blue
                            : const Color.fromARGB(255, 156, 189, 249),
                        elevation: 0,
                      ),
                      child: Text('Tab ${tabIndex + 1}'),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab 1 content
                Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _selectedImageIndex = index;
                          });
                        },
                      ),
                      items: [
                        'assets/images/hostel5.png',
                        'assets/images/hostel2.png',
                        'assets/images/hostel4.png',
                        'assets/images/hostel3.png',
                      ].map((imagePath) {
                        return Image.network(
                          imagePath,
                          fit: BoxFit.cover,
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 20, // Add spacing between the carousel and dots
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedImageIndex == index
                                ? Colors.blue
                                : const Color.fromARGB(255, 156, 189, 249),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height:
                          20, // Add spacing between the dots and description
                    ),
                    // ... (previous code)

                    const Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'GHJK Engineering Hostel',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on, color: Colors.grey),
                                  Text(
                                    '1234 Elm Street, City, Country', // Replace with the actual location
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Rating bar widget (adjust as needed)
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            Text('4.5', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
