import 'package:flutter/material.dart';

class SmoothSlider extends StatefulWidget {
  @override
  _SmoothSliderState createState() => _SmoothSliderState();
}

class _SmoothSliderState extends State<SmoothSlider> {
  bool isExpanded = false;

  void toggleSlider() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta != null) {
            if (details.primaryDelta! < -5) {
              setState(() => isExpanded = true);
            } else if (details.primaryDelta! > 5) {
              setState(() => isExpanded = false);
            }
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: isExpanded ? 300 : 50, // Adjust height
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              if (isExpanded)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Smooth Slider",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text("This is a smooth sliding panel that moves up and down."),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
