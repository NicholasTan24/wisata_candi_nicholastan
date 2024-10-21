import 'package:flutter/material.dart';
import 'package:wisata_candi_nicholastan/data/candi_data.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required Candi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
              children: [
                Image.asset(candi.imageAsset,)
              ],
          )
        ],
      ),
    );
  }
}
