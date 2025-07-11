// import 'package:flutter/material.dart';

// void main() => runApp(WildCuriosityApp());

// class WildCuriosityApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ProfilePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               Image.asset(
//                 'assets/ocean_background.jpg', // Add a suitable image to your assets
//                 height: 200,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//               Positioned(
//                 top: 40,
//                 left: 16,
//                 child: Row(
//                   children: [
//                     Icon(Icons.favorite, color: Colors.white),
//                     SizedBox(width: 8),
//                     Text(
//                       'Wild Curiosity',
//                       style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: 140,
//                 left: MediaQuery.of(context).size.width / 2 - 50,
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage('assets/profile.jpg'), // Your profile image
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 60),
//           Text(
//             'Diana Baldwin',
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           Text('Professional nutritionist'),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
//             child: Text(
//               'Imperfect environmentalism, data-forward slow fashion, & upcycling',
//               textAlign: TextAlign.center,
//             ),
//           ),
//           Text('📍 London  |  🌿 @remadebymen'),
//           Text('📧 dianablog@gmail.com'),
//           SizedBox(height: 10),
//           Text(
//             'Goal: Seriously making sustainability fun',
//             style: TextStyle(fontStyle: FontStyle.italic),
//           ),
//           SizedBox(height: 20),
//           Wrap(
//             spacing: 8.0,
//             children: [
//               Chip(label: Text('Fashion')),
//               Chip(label: Text('Upcycling')),
//               Chip(label: Text('Dining Out')),
//             ],
//           ),
//           SizedBox(height: 20),
//           Divider(),
//           ListTile(
//             title: Text('Attended workshops'),
//             subtitle: Text('Available to premium users'),
//             leading: Icon(Icons.lock),
//           ),
//           ListTile(
//             title: Text("Diana's climate history"),
//             trailing: Icon(Icons.arrow_forward_ios, size: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }
