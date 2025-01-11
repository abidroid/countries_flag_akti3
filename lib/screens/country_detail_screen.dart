import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/country.dart';

class CountryDetailScreen extends StatelessWidget {
  const CountryDetailScreen({super.key, required this.country});

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text('Details'),
      ),
      body: Column(
        spacing: 20,
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Hero(
              tag: country.name!,
              child: SvgPicture.network(
                country.flag!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(country.name ?? 'NA', style: const TextStyle(fontSize: 24)),
          Text(country.iso2 ?? 'NA', style: const TextStyle(fontSize: 24)),
          Text(country.iso3 ?? 'NA', style: const TextStyle(fontSize: 24)),

        ],
      ),
    );
  }
}
