import 'package:flutter/material.dart';

class Tab1Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque accumsan, scelerisque eget lectus ullamcorper a placerat. Porta cras at pretium varius purus cursus. Morbi justo commodo habitant morbi quis pharetra posuere mauris. Morbi sit risus, diam amet volutpat quis. Nisl pellentesque nec facilisis ultrices.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Location',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Image.asset(
            'assets/images/images.png',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            'Student Reviews',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Column(
            children: <Widget>[
              const SizedBox(height: 10),
              // Create a ListView.builder to generate the reviews
              ListView.builder(
                itemCount: studentReviews
                    .length, // Replace with the number of reviews you have
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // Prevent scrolling inside the column
                itemBuilder: (BuildContext context, int index) {
                  // Replace with your review data
                  final review = studentReviews[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            // Display student image here
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/person.png'),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                review.studentName,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                review.reviewDescription,
                                style: TextStyle(fontSize: 14),
                              ),
                              // You can add a rating bar widget here
                              // Replace with the rating widget of your choice
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Add additional review details or content here
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              // Add an "Apply" button at the end of the reviews
            ],
          )
        ],
      ),
    );
  }
}

class StudentReview {
  final String studentName;
  final String reviewDescription;
  final String studentImage; // You can use this for the student's image URL

  StudentReview({
    required this.studentName,
    required this.reviewDescription,
    required this.studentImage,
  });
}

// Create a list of student reviews
List<StudentReview> studentReviews = [
  StudentReview(
    studentName: "John Doe",
    reviewDescription: "Great course! I learned a lot.",
    studentImage: "assets/john.jpg", // Replace with the actual image path
  ),
  StudentReview(
    studentName: "Jane Smith",
    reviewDescription: "Excellent content and instructors.",
    studentImage: "assets/jane.jpg", // Replace with the actual image path
  ),
  // Add more reviews as needed
];
