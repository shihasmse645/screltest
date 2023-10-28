import 'package:flutter/material.dart';
import 'package:screltest/Model/usermodel.dart';
import 'package:screltest/screens/location.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.userId, required this.user});
  final String userId;
  final Users user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [ IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Location(
                        latitude: user.address?.geo?.lat ?? "0",
                        longitude: user.address?.geo?.lng ?? "0",
                      )));
                },
                icon: Icon(Icons.navigation,))],),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_2,
              size: 100,
            ),
            Text(
              "Name: ${user.name}",
              style: const TextStyle(color: Colors.blue, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Username: ${user.username}',
              style: const TextStyle(color: Colors.blue, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Email: ${user.email}',
              style: const TextStyle(color: Colors.blue, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Mobile Number: ${user.phone}",
              style: const TextStyle(color: Colors.blue, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
           
            //Text('Address: ${user.address?.street ?? ''}, ${user.address?.suite ?? ''}, ${user.address?.city ?? ''}, ${user.address?.zipcode ?? ''}',style: const TextStyle(color: Colors.blue,fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
