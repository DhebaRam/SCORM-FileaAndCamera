import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      HomePage(onNavigateToFavorites: () => _onItemTapped(2)),
      const FeedPage(),
      const FavoritesPage(),
      const SettingsPage(),
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Web Drawer Navigation'),
      ),
      drawer: MediaQuery.of(context).size.width < 640 ? _buildDrawer() : null,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 640) _buildDrawer(),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => _onItemTapped(0),
          ),
          ListTile(
            leading: const Icon(Icons.feed),
            title: const Text('Feed'),
            onTap: () => _onItemTapped(1),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () => _onItemTapped(2),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => _onItemTapped(3),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback onNavigateToFavorites;

  HomePage({super.key, required this.onNavigateToFavorites});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Home Page',
            style: TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onNavigateToFavorites,
            child: const Text('Go to Favorites'),
          ),
        ],
      ),
    );
  }
}

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Feed Page',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Favorites Page',
            style: TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewScreen()),
              );
            },
            child: const Text('Go to New Screen'),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Settings Page',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Screen'),
      ),
      body: const Center(
        child: Text(
          'New Screen',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:nfc_demo/core/second_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final List<Widget> _screens = [
//     const HomeTab(),
//     const FeedTab(),
//     const FavoritesTab(),
//     const SettingsTab(),
//     const SecondScreen()
//   ];
//
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Responsive site"),
//       ),
//       bottomNavigationBar: MediaQuery.of(context).size.width < 640
//           ? BottomNavigationBar(
//               currentIndex: _selectedIndex,
//               unselectedItemColor: Colors.grey,
//               selectedItemColor: Colors.indigoAccent,
//               onTap: _onItemTapped,
//               items: const [
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.home),
//                   label: 'Home',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.feed),
//                   label: 'Feed',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.favorite),
//                   label: 'Favorites',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.settings),
//                   label: 'Settings',
//                 ),
//               ],
//             )
//           : null,
//       body: Row(
//         children: [
//           if (MediaQuery.of(context).size.width >= 640)
//             NavigationRail(
//               selectedIndex: _selectedIndex,
//               onDestinationSelected: _onItemTapped,
//               labelType: NavigationRailLabelType.all,
//               selectedLabelTextStyle: const TextStyle(color: Colors.teal),
//               destinations: const [
//                 NavigationRailDestination(
//                   icon: Icon(Icons.home),
//                   label: Text('Home'),
//                 ),
//                 NavigationRailDestination(
//                   icon: Icon(Icons.feed),
//                   label: Text('Feed'),
//                 ),
//                 NavigationRailDestination(
//                   icon: Icon(Icons.favorite),
//                   label: Text('Favorites'),
//                 ),
//                 NavigationRailDestination(
//                   icon: Icon(Icons.settings),
//                   label: Text('Settings'),
//                 ),
//               ],
//               leading: const Padding(
//                 padding: EdgeInsets.only(top: 8.0),
//                 child: CircleAvatar(
//                   radius: 20,
//                   child: Icon(Icons.person),
//                 ),
//               ),
//             ),
//           Expanded(child: _screens[_selectedIndex]),
//         ],
//       ),
//     );
//   }
// }
//
// class HomeTab extends StatelessWidget {
//   const HomeTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.yellow.shade100,
//       alignment: Alignment.center,
//       child: const Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Home',
//             style: TextStyle(fontSize: 40),
//           ),
//           Text('On Click')
//         ],
//       ),
//     );
//   }
// }
//
// class FeedTab extends StatelessWidget {
//   const FeedTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.purple.shade100,
//       alignment: Alignment.center,
//       child: const Text(
//         'Feed',
//         style: TextStyle(fontSize: 40),
//       ),
//     );
//   }
// }
//
// class FavoritesTab extends StatelessWidget {
//   const FavoritesTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.red.shade100,
//       alignment: Alignment.center,
//       child: const Text(
//         'Favorites',
//         style: TextStyle(fontSize: 40),
//       ),
//     );
//   }
// }
//
// class SettingsTab extends StatelessWidget {
//   const SettingsTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.pink.shade300,
//       alignment: Alignment.center,
//       child: const Text(
//         'Settings',
//         style: TextStyle(fontSize: 40),
//       ),
//     );
//   }
// }
//
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:nfc_demo/core/second_screen.dart';
// //
// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});
// //
// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }
// //
// // class _HomeScreenState extends State<HomeScreen> {
// //   final List<Widget> _screens = [
// //     // Content for Home tab
// //     Container(
// //         color: Colors.yellow.shade100,
// //         alignment: Alignment.center,
// //         child: Column(children: [
// //           const Text(
// //             'Home',
// //             style: TextStyle(fontSize: 40),
// //           ),
// //           InkWell(
// //             onTap: (){
// //               Navigator.of(context).push(CupertinoPageRoute(
// //                   builder: (context) => const SecondScreen()));
// //             },
// //             child: const Text('On Click'),
// //           )
// //         ])),
// //     // Content for Feed tab
// //     Container(
// //       color: Colors.purple.shade100,
// //       alignment: Alignment.center,
// //       child: const Text(
// //         'Feed',
// //         style: TextStyle(fontSize: 40),
// //       ),
// //     ),
// //     // Content for Favorites tab
// //     Container(
// //       color: Colors.red.shade100,
// //       alignment: Alignment.center,
// //       child: const Text(
// //         'Favorites',
// //         style: TextStyle(fontSize: 40),
// //       ),
// //     ),
// //     // Content for Settings tab
// //     Container(
// //       color: Colors.pink.shade300,
// //       alignment: Alignment.center,
// //       child: const Text(
// //         'Settings',
// //         style: TextStyle(fontSize: 40),
// //       ),
// //     )
// //   ];
// //
// //   int _selectedIndex = 0;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Responsive site"),
// //       ),
// //       bottomNavigationBar: MediaQuery.of(context).size.width < 640
// //           ? BottomNavigationBar(
// //               currentIndex: _selectedIndex,
// //               unselectedItemColor: Colors.grey,
// //               selectedItemColor: Colors.indigoAccent,
// //               // called when one tab is selected
// //               onTap: (int index) {
// //                 setState(() {
// //                   _selectedIndex = index;
// //                 });
// //               },
// //               // bottom tab items
// //               items: const [
// //                   BottomNavigationBarItem(
// //                       icon: Icon(Icons.home), label: 'Home'),
// //                   BottomNavigationBarItem(
// //                       icon: Icon(Icons.feed), label: 'Feed'),
// //                   BottomNavigationBarItem(
// //                       icon: Icon(Icons.favorite), label: 'Favorites'),
// //                   BottomNavigationBarItem(
// //                       icon: Icon(Icons.settings), label: 'Settings')
// //                 ])
// //           : null,
// //       body: Row(
// //         children: [
// //           if (MediaQuery.of(context).size.width >= 640)
// //             NavigationRail(
// //               onDestinationSelected: (int index) {
// //                 setState(() {
// //                   _selectedIndex = index;
// //                 });
// //               },
// //               selectedIndex: _selectedIndex,
// //               destinations: const [
// //                 NavigationRailDestination(
// //                     icon: Icon(Icons.home), label: Text('Home')),
// //                 NavigationRailDestination(
// //                     icon: Icon(Icons.feed), label: Text('Feed')),
// //                 NavigationRailDestination(
// //                     icon: Icon(Icons.favorite), label: Text('Favorites')),
// //                 NavigationRailDestination(
// //                     icon: Icon(Icons.settings), label: Text('Settings')),
// //               ],
// //
// //               labelType: NavigationRailLabelType.all,
// //               selectedLabelTextStyle: const TextStyle(
// //                 color: Colors.teal,
// //               ),
// //
// //               unselectedLabelTextStyle: const TextStyle(),
// //               // Called when one tab is selected
// //               leading: const Column(
// //                 children: [
// //                   SizedBox(
// //                     height: 8,
// //                   ),
// //                   CircleAvatar(
// //                     radius: 20,
// //                     child: Icon(Icons.person),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           Expanded(child: _screens[_selectedIndex])
// //         ],
// //       ),
// //     );
// //   }
// // }
