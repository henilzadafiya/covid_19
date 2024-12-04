import 'package:covid_19/view/world_states.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  Map<String, dynamic> data;

  DetailsScreen({super.key, required this.data});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.data['country']}"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).size.height) *
                        .067,
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                      ),
                      ReusableRow(title: 'Cases', value: widget.data['cases'].toString()),
                      ReusableRow(title: 'Recovered', value: widget.data['recovered'].toString()),
                      ReusableRow(title: 'Deaths', value: widget.data['deaths'].toString()),
                      ReusableRow(title: 'Critical', value: widget.data['critical'].toString()),
                      ReusableRow(title: 'Today Recovered', value: widget.data['todayRecovered'].toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    NetworkImage(widget.data['countryInfo']['flag']),
              ),
            ],
          )
        ],
      ),
    );
  }
}
