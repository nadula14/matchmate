import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({super.key, required this.colour, this.cardChild, required this.onPress});

  Color? colour;
  Widget? cardChild;
  VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}


class AddYouBioCard extends StatelessWidget {
  const AddYouBioCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: [Color(0xff241468), Color(0xFFC70039)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
     padding: EdgeInsets.all(16.0),
     child: Text(
       'Add Your Bio',
       style: TextStyle(color: Colors.white, fontSize: 18.0),
     ),
          ),
          Expanded(
     child: Container(
       padding: EdgeInsets.all(16.0),
       child: TextField(
         textAlignVertical: TextAlignVertical.top,
         expands: true,
         maxLines: null,
         decoration: InputDecoration(
           filled: true,
           fillColor: Colors.white,
           hintText: 'Start typing here',
           hintStyle: TextStyle(
             color: Colors.grey, // You can adjust the hint text color
           ),
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(10.0),
             borderSide: BorderSide(width: 5, color: Colors.transparent),
           ),
         ),
       ),
     ),
          ),
        ],
      ),
    );
  }
}


