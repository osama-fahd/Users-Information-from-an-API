import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hashcamp_3/models/user.dart';
import 'package:flutter_hashcamp_3/provider/user_provider.dart';
import 'package:flutter_hashcamp_3/widgets/user_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  //const HomePage({super.key});
  const HomePage({Key? key}): super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("The Users", style: TextStyle(color: Colors.white,)),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: usersProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : usersProvider.errorMassage != null
                  ? Center(
                      child: Text(
                        usersProvider.errorMassage!,
                      ),
                    )
                    //تنشئ الويدجيت تلقائيًا
                  : ListView.builder(
                      itemCount: usersProvider.users.length,
                      itemBuilder: (context, index) { 
                        User user = usersProvider.users[index];
                        // تغير الصور عشوائيا
                        int n = Random().nextInt(4) + 1;
                        return UserCard(
                          imagePath: 'assets/images/${n}.png',
                          user: user,
                          );
                      }
                    )
             ),
    );
  }
}
