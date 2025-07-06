import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisata_candi_nicholastan/data/candi_data.dart';
import 'package:wisata_candi_nicholastan/models/candi.dart';
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Candi> _favorite = [];
  
  Future<void> _loadFavorite()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritenames = prefs.getStringList('favorite')??[];
    setState(() {
      _favorite = candiList.where((Candi) => favoritenames.contains(Candi.name)).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadFavorite();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

