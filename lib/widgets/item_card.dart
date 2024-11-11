import 'package:flutter/material.dart';
import '../models/candi.dart';


class ItemCard extends StatelessWidget {
  // TODO: 1. Deklarasikan variabel yang dibutuhkan dan pasang pada konstruktor
  final Candi candi;
  const ItemCard({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    return Card(
      // TODO: 2. Tetapkan parameter shape, margin, dan elevation dari Cari
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(4),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: 3. Buat Image debagai anak dari Column
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                    candi.imageAsset, 
                    width: double.infinity, 
                    fit: BoxFit.cover
                )
            ),
          ),
          // TODO: 4. Buat Text sebagai anak dari Column
          // Text(candi.name, style:),
          // TODO: 5. Buat Text sebagai anak dari Column
          // Text(data),
        ],
      ),
    );
  }
}
