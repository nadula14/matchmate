
import 'package:flutter/material.dart';
import 'package:matchmate/components/appbar.dart';
import 'package:matchmate/components/profile_pic.dart';
import 'package:matchmate/models/cities_model.dart';
import 'package:matchmate/models/country_state_model.dart' as cs_model;
import 'package:matchmate/screens/country_state_city_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matchmate/components/reusablecard.dart';





class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
 
  final CountryStateCityRepo _countryStateCityRepo = CountryStateCityRepo();
  
  // PickedFile? _imageFile;
  // final ImagePicker _picker = ImagePicker();

  List<String> countries = [];
  List<String> states = [];
  List<String> cities = [];
  cs_model.CountryStateModel countryStateModel =
  cs_model.CountryStateModel(error: false, msg: '', data: []);

  CitiesModel citiesModel = CitiesModel(error: false, msg: '', data: []);

  String selectedCountry = 'Select Country';
  String selectedState = 'Select State';
  String selectedCity = 'Select City';
  bool isDataLoaded = false;


  String finalTextToBeDisplayed = '';

  getCountries() async {
    //
    countryStateModel = await _countryStateCityRepo.getCountriesStates();
    countries.add('Select Country');
    states.add('Select State');
    cities.add('Select City');
    for (var element in countryStateModel.data) {
      countries.add(element.name);
    }
    isDataLoaded = true;
    setState(() {});
    //
  }

  getStates() async {
    //
    for (var element in countryStateModel.data) {
      if (selectedCountry == element.name) {
        //
        setState(() {
          resetStates();
          resetCities();
        });
        //
        for (var state in element.states) {
          states.add(state.name);
        }
      }
    }
    //
  }

  getCities() async {
    //
    isDataLoaded = false;
    citiesModel = await _countryStateCityRepo.getCities(
        country: selectedCountry, state: selectedState);
    setState(() {
      resetCities();
    });
    for (var city in citiesModel.data) {
      cities.add(city);
    }
    isDataLoaded = true;
    setState(() {});
    //
  }

  resetCities() {
    cities = [];
    cities.add('Select City');
    selectedCity = 'Select City';
    finalTextToBeDisplayed = '';
  }

  resetStates() {
    states = [];
    states.add('Select State');
    selectedState = 'Select State';
    finalTextToBeDisplayed = '';
  }

  @override
  void initState() {
    getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
      body: 
      Center(
       child: !isDataLoaded
           ? const CircularProgressIndicator()
           : Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 children: [
                   Column(
                     children: [
                       Row(
                         children: [
                           Expanded(
                             child: Text(
                               "your contry"
                             ),
                           ),
                           Expanded(
                             child: DropdownButton(
                                 isExpanded: true,
                                 value: selectedCountry,
                                 items: countries
                                     .map((String country) => DropdownMenuItem(
                                         value: country, child: Text(country)))
                                     .toList(),
                                 onChanged: (selectedValue) {
                                   //
                                   setState(() {
                                     selectedCountry = selectedValue!;
                                   });
                                   
                                   if (selectedCountry != 'Select Country') {
                                     getStates();
                                   }
                                   //
                                 }),
                           ),
                         ],
                       ),
                       const SizedBox(height: 20),
                                        Row(
                               children: [
                                 Expanded(
                                   child: Text(
                              "Your State",
                              style: TextStyle(fontSize: 16),
                                   ),
                                 ),
                                 Expanded(
                                   child: DropdownButton(
                              isExpanded: true,
                              value: selectedState,
                              items: states
                                  .map((String state) =>
                                      DropdownMenuItem(value: state, child: Text(state)))
                                  .toList(),
                              onChanged: (selectedValue) {
                                setState(() {
                                  selectedState = selectedValue!;
                                });
                                if (selectedState != 'Select State') {
                                  getCities();
                                }
                              },
                                   ),
                                 ),
                               ],
                             ),
                     ],
                   ),
         const SizedBox(height: 20),
      
      
      
        AddYouBioCard(),
      
        //imageProfile(context),
      
      
       ],
       ),
      ),
            ),
    );
  }
}



// Widget imageProfile(BuildContext context) {
//   return Center(
//     child: Stack(
//       children: <Widget>[
//         CircleAvatar(
//           radius: 80.0,
//           backgroundImage: AssetImage('assets/images/profile.jpeg'),
          
//         ),
//         Positioned(
//           bottom: 20.0,
//           right: 20.0,
//           child: InkWell(
//             onTap: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (builder) => bottomSheet(context),
//               );
//             },
//             child: Icon(
//               Icons.camera_alt,
//               color: Colors.teal,
//               size: 28.0,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget bottomSheet(BuildContext context) {
  
//   return Container(
//     height: 100.0,
//     width: MediaQuery.of(context).size.width,
//     margin: EdgeInsets.symmetric(
//       horizontal: 20.0,
//       vertical: 20.0,
//     ),
//     child: Column(
//       children: <Widget>[
//         Text(
//           "Choose Profile photo",
//           style: TextStyle(
//             fontSize: 20.0,
//           ),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton.icon(
//               icon: Icon(Icons.camera),
//               onPressed: () {
//                 takePhoto(ImageSource.camera);
//               },
//               label: Text("Camera"),
//             ),
//             ElevatedButton.icon(
//               icon: Icon(Icons.image),
//               onPressed: () {
//                 takePhoto(ImageSource.gallery);
//               },
//               label: Text("Gallery"),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// Future takePhto () async
