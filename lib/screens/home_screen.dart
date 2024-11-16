import 'package:flutter/material.dart';
import 'package:wisata_candi_nicholastan/data/candi_data.dart';
import 'package:wisata_candi_nicholastan/widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 1. Buat appBar dengan judul Wisata Candi
      appBar: AppBar(title: Text('Wisata Candi')),
      // TODO: 2. Buat body dengan GridView.builder
      body: ElevatedButton(
        onPressed:(){
          Navigator.pushNamed(context, '/DetailScreen');
        },
        child: GridView.builder(
            padding: EdgeInsets.all(8),
            itemCount: candiList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
            itemBuilder: (context,index){
              return ItemCard(candi: candiList[index]);
            }
            ),
      ),
      // TODO: 3. Buat ItemCard sebagai return value dari GridView.builder
    );
  }
}
