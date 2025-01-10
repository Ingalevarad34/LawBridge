import 'package:flutter/material.dart';
import 'package:flutter_filterable_search/flutter_filterable_search.dart';
import 'package:get/get.dart';
import 'package:lawbridge/pages/AvailableLawyer.dart';

class User {
  final String name;
  final int age;
  final String location;
  final int rating;

  User(
      {required this.name,
      required this.age,
      required this.location,
      required this.rating});
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // List of users to be searched
  final List<User> users = [
    User(name: 'John Doe', age: 30, location: 'Near By Me', rating: 4),
    User(name: 'Jane Smith', age: 40, location: 'Satara', rating: 4),
    User(name: 'Michael Johnson', age: 28, location: 'Satara', rating: 4),
    User(name: 'Chavan', age: 25, location: 'Near By Me', rating: 5),
    User(name: 'Charlie', age: 25, location: 'Near By Me', rating: 4),
    User(name: 'Amanda', age: 28, location: 'Satara', rating: 5),
    User(name: 'Ann', age: 50, location: 'Satara', rating: 5),
  ];

  // Define custom filters
  final nameStartsWithJFilter = FlutterFilterableSearchFilter<User>(
    label: 'Name starts with J',
    customFilters: [
      (item) => item.name.startsWith('J'),
      // (item) => item.age > 30,
    ],
  );
  final nameStartsWithCFilter = FlutterFilterableSearchFilter<User>(
    label: 'Name starts with C',
    customFilters: [
      (item) => item.name.startsWith('C'),
      // (item) => item.age > 30,
    ],
  );
  final nameStartsWithAFilter = FlutterFilterableSearchFilter<User>(
    label: 'Name starts with A',
    customFilters: [
      (item) => item.name.startsWith('A'),
      // (item) => item.age > 30,
    ],
  );
  final ageGreaterThan30Filter = FlutterFilterableSearchFilter<User>(
    label: 'Age > 30',
    customFilters: [(item) => item.age > 30],
  );

  final ageLessThan30Filter = FlutterFilterableSearchFilter<User>(
    label: 'Age < 30',
    customFilters: [(item) => item.age < 30],
  );

  final ratingLessThan4Filter = FlutterFilterableSearchFilter<User>(
    label: 'rating 4 star',
    customFilters: [(item) => item.rating == 4],
  );
  final ratingGreaterThan4Filter = FlutterFilterableSearchFilter<User>(
    label: 'rating 5 star',
    customFilters: [(item) => item.rating == 5],
  );
  final locationNearByMeFilter = FlutterFilterableSearchFilter<User>(
    label: 'Location: Near By Me',
    customFilters: [(item) => item.location == 'Near By Me'],
  );

  final locationSataraFilter = FlutterFilterableSearchFilter<User>(
    label: 'Location: Satara',
    customFilters: [(item) => item.location == 'Satara'],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 243, 255),
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 230, 243, 255),
      //   title: Text('Filterable Search Demo'),
      // ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FlutterFilterableSearchView<User>(
              overlayColor: Colors.transparent,
              overlayMaxHeight: MediaQuery.of(context).size.height * 0.5,
              theme: FlutterFilterableSearchTheme.byDefault(
                context,
                backgroundColor: Colors.white,
              ),
              chipTheme: FlutterFilterChipTheme.byDefault(
                context,
                backgroundColor: Colors.blue,
              ),
              chipPadding: const EdgeInsets.only(top: 16),
              overlayPadding: const EdgeInsets.only(left: 16, right: 16),
              items: users,
              itemSubmitted: (user) {
                debugPrint(user.location);
                return user.name;
              },
              itemBuilder: (user, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.5), width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 2), // Shadow position
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(0.6),
                          child: Text(
                            user.name[0].toUpperCase(), // Initial of the name
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Age: ${user.age}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.grey,
                                    ),
                              ),
                              Text(
                                'Location: ${user.location}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.grey,
                                    ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Get.to(() => AvailableLawyerList(),
                                        transition: Transition.downToUp,
                                        duration:
                                            const Duration(milliseconds: 800));
                                  },
                                  child: Text("search"))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              filters: [
                nameStartsWithJFilter,
                nameStartsWithCFilter,
                nameStartsWithAFilter,
                ageGreaterThan30Filter,
                ageLessThan30Filter,
                ratingLessThan4Filter,
                ratingGreaterThan4Filter,
                locationNearByMeFilter,
                locationSataraFilter
              ],
            ),
          ],
        ),
      ),
    );
  }
}
