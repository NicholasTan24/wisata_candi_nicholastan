import 'package:flutter/material.dart';
import 'package:wisata_candi_nicholastan/models/candi.dart';

class DetailScreen extends StatelessWidget {
  final Candi candi;

  const DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //detail header
          Stack(
            children: [
              //padding image
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    candi.imageAsset,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //padding back button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100]?.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                          Icons.arrow_back,
                      )
                  ),
                ),
              )
            ],
          ),
        //detail info
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 16),
              // info atas(nama candi dan tombol favorit)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(candi.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ) ,
                    ),
                    IconButton(onPressed: (){},
                        icon: Icon(Icons.favorite_border))
                  ],
                )
              // info tengah (lokasi, dibangun, tipe)
              // info bawah (deskripsi)
              ],
            ),
          )
        ],
      ),
    );
  }
}
