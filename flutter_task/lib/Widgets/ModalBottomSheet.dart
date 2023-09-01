import 'package:flutter/material.dart';

import '../Screens/Home2Page.dart';

class BottomSheetUtils {
  static void showSortBottomSheet(BuildContext context) {
    int selectedValue = -1;

    void _onRadioValueChanged(int value) {
      selectedValue = value;
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sort By',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile(
                    title: Text('Bachelor of Technology'),
                    value: 1,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      _onRadioValueChanged(value!);
                      Navigator.pop(
                          context); // Close the bottom sheet after selection
                      _navigateToResultPage(
                          context, 'Option 1'); // Navigate to ResultPage
                    },
                  ),
                  RadioListTile(
                    title: Text('Bachelor of Architecture'),
                    value: 2,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      _onRadioValueChanged(value!);
                      Navigator.pop(
                          context); // Close the bottom sheet after selection
                      _navigateToResultPage(
                          context, 'Option 1'); // Navigate to ResultPage
                    },
                  ),
                  RadioListTile(
                    title: Text('Pharmacy'),
                    value: 3,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      _onRadioValueChanged(value!);
                      Navigator.pop(
                          context); // Close the bottom sheet after selection
                      _navigateToResultPage(
                          context, 'Option 1'); // Navigate to ResultPage
                    },
                  ),
                  RadioListTile(
                    title: Text('Law'),
                    value: 4,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      _onRadioValueChanged(value!);
                      Navigator.pop(
                          context); // Close the bottom sheet after selection
                      _navigateToResultPage(
                          context, 'Option 1'); // Navigate to ResultPage
                    },
                  ),
                  RadioListTile(
                    title: Text('Management'),
                    value: 5,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      _onRadioValueChanged(value!);
                      Navigator.pop(
                          context); // Close the bottom sheet after selection
                      _navigateToResultPage(
                          context, 'Option 1'); // Navigate to ResultPage
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void _navigateToResultPage(
      BuildContext context, String selectedOption) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondHomePage()),
    );
  }
}
