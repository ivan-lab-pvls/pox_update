import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pockex/ui/comm.dart';
import 'package:pockex/ui/news.dart';
import 'package:pockex/ui/profilep.dart';
import 'package:pockex/ui/settingsp.dart';
import 'package:pockex/ui/state.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int percentage = 0;
  int selectedIndex = 0;

  final List<Widget> tabs = const [
    NewsFull2(),
    AdvicesScreen(),
    AssetsPage(),
    StrategiesPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: tabs[selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (int value) async {
            setState(() {
              selectedIndex = value;
            });
            
          },
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          iconSize: 24,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: Theme.of(context).cardColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: GoogleFonts.dmSans(
            textStyle: GoogleFonts.dmSans(
              color: Theme.of(context).cardColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          unselectedLabelStyle: GoogleFonts.dmSans(
            textStyle: GoogleFonts.dmSans(
              color: Theme.of(context).cardColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.newspaper_sharp,
              ),
              label: "News",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people_alt,
              ),
              label: "Community",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.assessment,
              ),
              label: "Assets",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmarks_outlined,
              ),
              label: "Learn",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.settings_solid,
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
