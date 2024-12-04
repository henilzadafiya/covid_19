import 'package:covid_19/view/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../services/states_services.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Search with country name',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: StatesServices.countriesListApi(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (!snapshot.hasData) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            title: Container(
                              height: 10,
                              width: 89,
                              color: Colors.white,
                            ),
                            subtitle: Container(
                              height: 10,
                              width: 89,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
                ;
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    String name = snapshot.data![index]['country'].toString();
                    if (controller.text.isEmpty) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(data: snapshot.data![index],),
                                  ));
                            },
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data![index]['countryInfo']['flag']),
                            ),
                            title: Text(
                                snapshot.data![index]['country'].toString()),
                            subtitle:
                                Text(snapshot.data![index]['cases'].toString()),
                          )
                        ],
                      );
                    } else if (name
                        .toLowerCase()
                        .contains(controller.text.toLowerCase())) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(data: snapshot.data![index],),
                                  ));
                            },
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data![index]['countryInfo']['flag']),
                            ),
                            title: Text(
                                snapshot.data![index]['country'].toString()),
                            subtitle:
                                Text(snapshot.data![index]['cases'].toString()),
                          )
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                );
              }
            },
          ))
        ],
      )),
    );
  }
}
