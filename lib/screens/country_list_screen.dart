import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../models/country.dart';
import 'package:http/http.dart' as http;

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  // request and will get a response

  Future<List<Country>> getAllCountries() async {
    List<Country> countries = [];

    // request to server
    String endPoint =
        'https://countriesnow.space/api/v0.1/countries/flag/images';

    http.Response response = await http.get(Uri.parse(endPoint));

    // http status code
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse['msg']);
      var jsonCountryList = jsonResponse['data'];
      print(jsonCountryList.length);

      for (var jsonCountry in jsonCountryList) {
        Country country = Country.fromJson(jsonCountry);

        countries.add(country);
      }
    }

    return countries;
  }

  @override
  void initState() {
    super.initState();
    getAllCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text('Country List'),
      ),
      body: FutureBuilder<List<Country>>(
          future: getAllCountries(),
          builder: (context, snapshot) {
            if( snapshot.hasData){

              List<Country> countries = snapshot.data as List<Country>;
              return Center(child: Text(countries.length.toString()),);

            }else{
              return Center(child: SpinKitWave(color: Colors.green,),);
            }
          }),
    );
  }
}