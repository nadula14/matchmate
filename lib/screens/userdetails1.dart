import 'package:flutter/material.dart';
import 'package:matchmate/components/image.dart';
import 'package:matchmate/components/main_button.dart';
import 'package:matchmate/components/textfield.dart';
import '../components/reusablecard.dart';
import 'userdetails2.dart';
import '../components/appbar.dart';

enum Gender {
  male,
  female,
}

class Userdetails1 extends StatefulWidget {
  const Userdetails1({Key? key}) : super(key: key);

  @override
  _Userdetails1State createState() => _Userdetails1State();
}

class _Userdetails1State extends State<Userdetails1> {
  List<bool> isSelected = [false, false, false]; // Initialize isSelected
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Appbar(),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MainImage(),
            const SizedBox(
              height: 100,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child:
                          reusableTextField(null, false, null, "First Name")),
                  const SizedBox(width: 20),
                  Expanded(
                      child: reusableTextField(null, false, null, "Last Name")),
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? Colors.blue
                          : Colors.pink
                      // cardChild: IconContent(
                      //   icon: FontAwesomeIcons.mars,
                      //   label: 'MALE',
                      // ),
                      ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? Colors.deepOrange
                        : Colors.brown,
                    // cardChild: IconContent(
                    //   icon: FontAwesomeIcons.venus,
                    //   label: 'FEMALE',
                    // ),
                  ),
                ),
              ],
            )),
            MainButton(
                text: 'NEXT',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const HomePage()));
                })
          ],
        ),
      ),
    );
  }
}
