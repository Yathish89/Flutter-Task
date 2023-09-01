import 'package:flutter/material.dart';
import 'package:flutter_task/Widgets/Tab2.dart';

import '../Widgets/Tab1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      home: Scaffold(
        body: DetailPage(),
        backgroundColor: Color.fromARGB(224, 18, 126, 226),
        bottomNavigationBar: BottomAppBar(
          child: ElevatedButton(
            onPressed: () {
              // Add the action you want to perform when the button is pressed here
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(224, 10, 179, 251),
              minimumSize:
                  Size(double.infinity, 60), // Adjust button size as needed
            ),
            child: Text(
              'Apply Now',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MVSH Engineering college'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/hostel4.png', // Replace with your image asset path
              height: 200,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit urna sit amet libero bibendum.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            TabBar(
              tabs: const [
                Tab(
                  child: Text(
                    'College',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ), // Specify style here
                ),
                Tab(
                  child: Text(
                    'Hostel Facility',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ), // Specify style here
                ),
                Tab(
                  child: Text(
                    'Q & A',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ), // Specify style here
                ),
                Tab(
                  child: Text(
                    'Events',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ), // Specify style here
                ),
              ],
              onTap: (index) {
                setState(() {});
              },
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Tab1Content(),
                  Tab2Content(),
                  Tab3Content(),
                  Tab4Content(),
                  Tab5Content(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tab3Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 3 Content'),
    );
  }
}

class Tab4Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 4 Content'),
    );
  }
}

class Tab5Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 5 Content'),
    );
  }
}
