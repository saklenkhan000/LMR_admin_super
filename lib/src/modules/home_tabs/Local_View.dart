// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// import '../login/login_screen.dart';
//
// class Spotify extends StatefulWidget {
//   Spotify({super.key});
//
//   @override
//   State<Spotify> createState() => _SpotifyState();
// }
//
// class _SpotifyState extends State<Spotify> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: InkWell(
//         onTap: () {
//           showDialog(
//             context: context,
//             builder: (context) => CustomPinDialog(),
//           );
//         },
//         child: SafeArea(
//           child: Stack(
//             children: [
//               Column(
//                 children: [
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _buildTopBar(),
//
//                           _buildLibraryItems(),
//                           _buildNewMusicFriday(),
//                           _buildTopMixes(),
//                           const SizedBox(height: 50),
//                         ],
//                       ),
//                     ),
//                   ),
//                   _buildBottomNav(),
//                 ],
//               ),
//               _buildNowPlaying(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   bool play = false;
//
//   Widget _buildNowPlaying() {
//     return Positioned(
//       left: 0,
//       right: 0,
//       bottom: 65, // Above bottom nav
//       child: Container(
//         height: 60,
//         margin: const EdgeInsets.symmetric(horizontal: 8),
//         decoration: BoxDecoration(
//           color: Colors.grey[900],
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(8),
//                     bottomLeft: Radius.circular(8),
//                   ),
//                   child: Image.network(
//                     'https://c.saavncdn.com/260/Hawayein-From-Jab-Harry-Met-Sejal--Hindi-201720170726112607-500x500.jpg',
//                     width: 56,
//                     height: 56,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Hawayein',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       Text(
//                         'Pritam',
//                         style: TextStyle(
//                           color: Colors.grey[400],
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.devices_outlined, color: Colors.white),
//                   onPressed: () {},
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.check_circle_outline, color: Colors.white),
//                   onPressed: () {},
//                 ),
//                 IconButton(
//                   icon:  Icon(
//                       play? Icons.play_arrow:
//                       Icons.pause,
//                       color: Colors.white),
//                   onPressed: () {
//                     setState(() {
//                       play = !play;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             // play?  LinearProgressIndicator():SizedBox()
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTopBar() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         children: [
//           CircleAvatar(
//             backgroundColor: Colors.brown.shade700,
//             child: const Text('G', style: TextStyle(color: Colors.white)),
//           ),
//           Expanded(child: _buildCategoryChips()),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCategoryChips() {
//     return Container(
//       height: 40,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: ListView(
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         children: [
//           _buildChip('All', isSelected: true),
//           _buildChip('Music'),
//           _buildChip('Podcasts'),
//           _buildChip('Wrapped'),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildChip(String label, {bool isSelected = false}) {
//     return Container(
//       margin: const EdgeInsets.only(right: 8),
//       child: FilterChip(
//         selected: isSelected,
//         showCheckmark: false,
//         label: Text(label),
//         labelStyle: TextStyle(
//           color: isSelected ? Colors.black : Colors.white,
//           fontSize: 14,
//         ),
//         backgroundColor: Colors.grey[900],
//         selectedColor: const Color(0xFF1DB954), // Spotify green
//         onSelected: (bool selected) {},
//       ),
//     );
//   }
//
//   Widget _buildLibraryItems() {
//     return GridView(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3),
//       children: [
//         _buildLibraryItem(
//           'Liked Songs',
//           icon: Icons.favorite,
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Colors.purple[900]!, Colors.purple[300]!],
//           ),
//         ),
//         _buildLibraryItem(
//           'Bollywood Dance Music',
//           icon: Icons.music_note,
//         ),
//         _buildLibraryItem(
//           'Sanu Aj Kal Shisha Bada',
//           icon: Icons.album,
//         ),
//         _buildLibraryItem(
//           'O Maahi❤',
//           icon: Icons.favorite,
//         ),
//         _buildLibraryItem(
//           'KK all songs 💝',
//           icon: Icons.music_note,
//         ),
//         _buildLibraryItem(
//           'Hud Hud Radio',
//           icon: Icons.radio,
//           isRadio: true,
//         ),
//         _buildLibraryItem(
//           'Naina Lade Radio',
//           icon: Icons.radio,
//           isRadio: true,
//         ),
//         _buildLibraryItem(
//           'The Body',
//           icon: Icons.album,
//         ),
//       ],
//     );
//   }
//
//   Widget _buildLibraryItem(String title, {
//     required IconData icon,
//     LinearGradient? gradient,
//     bool isRadio = false,
//   }) {
//     return ListTile(
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       leading: Container(
//         width: 56,
//         height: 56,
//         decoration: BoxDecoration(
//           gradient: gradient,
//           color: gradient == null ? Colors.grey[900] : null,
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: Icon(
//           icon,
//           color: Colors.white,
//           size: 28,
//         ),
//       ),
//       title: Text(
//         title,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNewMusicFriday() {
//     final playlists = [
//       {
//         'name': 'Liked Songs',
//         'image': 'https://misc.scdn.co/liked-songs/liked-songs-640.png',
//       },
//       {
//         'name': 'Daily Mix 1',
//         'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsEyE5l8XlvxObIizXvZhly9rLJKLoCh1aGQF2JH1q6-M2xyMTI98yWXGSQm0bHAOk0J8&usqp=CAU',
//       },
//       {
//         'name': 'Chill Hits',
//         'image': 'https://i.scdn.co/image/ab67706f00000002b60db5d1bcdd9c4fd1ebcffe',
//       },
//       {
//         'name': 'Rock Classics',
//         'image': 'https://i.scdn.co/image/ab67706f000000029249b35f23fb596b6f006a15',
//       },
//       {
//         'name': 'Jazz Vibes',
//         'image': 'https://songsall.com/wp-content/uploads/2024/06/Neha-Kakkar-1-1024x576.webp',
//       },
//       {
//         'name': 'Mood Booster',
//         'image': 'https://i.scdn.co/image/ab67706f00000002bd0e19e810bb4b55ab164a95',
//       },
//     ];
//
//     final currentDay = DateFormat('EEEE').format(DateTime.now());
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
//           child: Text(
//             "It's New Music $currentDay!",
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 32,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 220,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             itemCount: playlists.length,
//             itemBuilder: (context, index) {
//               final playlist = playlists[index];
//               return _buildMusicCard(
//                 playlist['name']!,
//                 imageUrl: playlist['image']!,
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildMusicCard(String title, {String? subtitle, String? imageUrl}) {
//     return Container(
//       width: 155,
//       margin: const EdgeInsets.only(right: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 140,
//             decoration: BoxDecoration(
//               color: Colors.grey[900],
//               borderRadius: BorderRadius.circular(4),
//               image: imageUrl != null ? DecorationImage(
//                 image: NetworkImage(imageUrl),
//                 fit: BoxFit.cover,
//               ) : null,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           if (subtitle != null) ...[
//             const SizedBox(height: 4),
//             Text(
//               subtitle,
//               style: TextStyle(
//                 color: Colors.grey[400],
//                 fontSize: 12,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTopMixes() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(16),
//           child: Text(
//             'Your top mixes',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 220,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             children: [
//               _buildMusicCard('Daily Mix 1',imageUrl: "https://songsall.com/wp-content/uploads/2024/05/640px-Arijit.jpg"),
//               _buildMusicCard('Daily Mix 2',imageUrl: "https://songsall.com/wp-content/uploads/2024/08/Untitled-design-6.png"),
//               _buildMusicCard('Daily Mix 3',imageUrl: "https://songsall.com/wp-content/uploads/2024/06/diljit-1.jpeg"),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildBottomNav() {
//     return Container(
//       color: Colors.transparent,
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _buildNavItem(Icons.home_filled, 'Home',isSelected: true),
//           _buildNavItem(Icons.search, 'Search'),
//           _buildNavItem(Icons.my_library_music, 'Your Library', ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNavItem(IconData icon, String label, {bool isSelected = false}) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(
//           icon,
//           color: isSelected ? Colors.white : Colors.grey,
//           size: 26,
//         ),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: TextStyle(
//             color: isSelected ? Colors.white : Colors.grey,
//             fontSize: 12,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
//
//
//
// class CustomPinDialog extends StatefulWidget {
//   @override
//   _CustomPinDialogState createState() => _CustomPinDialogState();
// }
//
// class _CustomPinDialogState extends State<CustomPinDialog> {
//   final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
//   final _formKey = GlobalKey<FormState>();
//
//   void _submitPin() {
//     if (_formKey.currentState!.validate()) {
//       String pin = _controllers.map((c) => c.text).join();
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginScreen()),
//       );
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('PIN Submitted: $pin')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 'Enter 6-Digit PIN',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(6, (index) {
//                   return SizedBox(
//                     width: 40,
//                     child: TextFormField(
//                       controller: _controllers[index],
//                       keyboardType: TextInputType.phone,
//                       textAlign: TextAlign.center,
//                       maxLength: 1,
//                       decoration: const InputDecoration(
//                         counterText: '', // Hide counter text
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return ''; // Validation: Field cannot be empty
//                         }
//                         return null;
//                       },
//                       onChanged: (value) {
//                         if (value.isNotEmpty && index < 5) {
//                           FocusScope.of(context).nextFocus(); // Move to next field
//                         } else if (value.isEmpty && index > 0) {
//                           FocusScope.of(context).previousFocus(); // Move to previous field
//                         }
//                       },
//                     ),
//                   );
//                 }),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop(); // Close the dialog
//                     },
//                     child: const Text('Cancel'),
//                   ),
//                   ElevatedButton(
//                     onPressed: _submitPin,
//                     child: const Text('Submit'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // class PinEntryDialog extends StatefulWidget {
// //   @override
// //   _PinEntryDialogState createState() => _PinEntryDialogState();
// // }
// //
// // class _PinEntryDialogState extends State<PinEntryDialog> {
// //   final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
// //   final _formKey = GlobalKey<FormState>();
// //
// //   void _submitPin() {
// //     // Check validation
// //     if (_formKey.currentState!.validate()) {
// //       String pin = _controllers.map((c) => c.text).join();
// //       Navigator.of(context).pop(); // Close the dialog
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('PIN Submitted: $pin')),
// //       );
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return AlertDialog(
// //
// //
// //       title: Text('Enter PIN'),
// //
// //
// //       content: Form(
// //         key: _formKey,
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           children: List.generate(6, (index) {
// //             return Padding(
// //               padding: const EdgeInsets.all(2.0),
// //               child: SizedBox(
// //                 width: 45,
// //                 child: TextFormField(
// //                   controller: _controllers[index],
// //                   keyboardType: TextInputType.number,
// //                   textAlign: TextAlign.center,
// //                   maxLength: 1,
// //                   decoration: InputDecoration(
// //                     counterText: '', // Hide counter text
// //                     border: OutlineInputBorder(),
// //                   ),
// //                   validator: (value) {
// //                     if (value == null || value.isEmpty) {
// //                       return ''; // Validation error: field must not be empty
// //                     }
// //                     return null;
// //                   },
// //                   onChanged: (value) {
// //                     if (value.isNotEmpty && index < 5) {
// //                       FocusScope.of(context).nextFocus(); // Move to next field
// //                     } else if (value.isEmpty && index > 0) {
// //                       FocusScope.of(context).previousFocus(); // Move to previous field
// //                     }
// //                   },
// //                 ),
// //               ),
// //             );
// //           }),
// //         ),
// //       ),
// //       actions: [
// //         TextButton(
// //           onPressed: () {
// //             Navigator.of(context).pop(); // Close the dialog
// //           },
// //           child: Text('Cancel'),
// //         ),
// //         ElevatedButton(
// //           onPressed: _submitPin,
// //           child: Text('Submit'),
// //         ),
// //       ],
// //     );
// //   }
// // }
// //
