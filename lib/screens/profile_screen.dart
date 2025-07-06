import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1.Deklarasikan variabel yang dibutuhkan
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  Future<void>_LoadDataFromPrefs()
  async{
    //enkripsi datanya
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullname') ?? '';
      userName = prefs.getString('username') ?? '';
    });
  }

  // TODO 5. Implementasi fungsi signIn
  void signIn(){
    // setState(() {
    //   isSignedIn = !isSignedIn;
    // });
    Navigator.pushNamed(context, '/SignInScreen');
  }
  // TODO 6. Implementasi fungsi signOut

  Future<void> signOut()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSignedIn', false);
    await prefs.setString('name', '');
    await prefs.setString('username', '');
    await prefs.setString('password', '');
    Navigator.pushReplacementNamed(context, '/SignInScreen');
  }
  Future<void> _editFullName(String newName) async {
    final prefs = await SharedPreferences.getInstance();
    // Encrypt the name before saving
    final encryptedFullname = _encryptData(newName);

    await prefs.setString('name', encryptedFullname);
    setState(() {
      fullName= encryptedFullname;
    });
  }

  String _encryptData(String data) {
    final key = encrypt.Key.fromLength(32);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(data, iv: iv);
    return encrypted.base64;
  }

  String _decryptData(String encryptedData) {
    final key = encrypt.Key.fromLength(32);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final decrypted = encrypter.decrypt64(encryptedData, iv: iv);
    return decrypted;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                //TODO: 2. Buat bagian ProfileHeader yang berisi gambar profil
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        if (isSignedIn)
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.camera_alt,
                                  color: Colors.deepPurple[50]))
                      ],
                    ),
                  ),
                ),
                //TODO: 3. Buat bagian ProfileInfo yang berisi info profil
                // Baris Pengguna
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.lock, color: Colors.amber),
                          SizedBox(width: 8),
                          Text('Pengguna',style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(': $userName', style: TextStyle(
                          fontSize: 18),
                      ),
                    ),
                    if(isSignedIn)
                      IconButton(
                          icon: Icon(Icons.edit),
                          onPressed:(){_editFullName(fullName);}
                      )
                  ],
                ),
                // Baris Nama
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.person, color: Colors.blue),
                          SizedBox(width: 8),
                          Text('Nama',style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(': $fullName', style: TextStyle(
                          fontSize: 18),
                      ),
                    ),
                    if(isSignedIn)
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: (){},
                      )
                  ],
                ),
                // Baris Favorit
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Favorit',style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(': $favoriteCandiCount', style: TextStyle(
                          fontSize: 18),
                      ),
                    ),
                    if(isSignedIn) Icon(Icons.edit),
                  ],
                ),

                //TODO: 4. Buat ProfileActions yang berisi TextButton sign in/out
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 20),
                isSignedIn ? TextButton(onPressed: (){signOut();}, child: Text('Sign Out'))
                    : TextButton(onPressed: signIn, child: Text('Sign In')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
