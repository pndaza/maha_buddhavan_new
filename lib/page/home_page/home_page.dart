import 'package:flutter/material.dart';
import 'bookshelf_tab/bookshelf_tab.dart';
import 'notes_tab/notes_tab.dart';

enum Screen { BookShelf, Content }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // Color _backgroundColor = Colors.white70;
    Color _selectedItemColor = Colors.blueGrey;
    Color _unselectedItemColor = Colors.black45;
    return Scaffold(
        appBar: AppBar(
          title: Text('မဟာဗုဒ္ဓဝင်'),
          centerTitle: true,
          
        ),
        body: _getScreen(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // backgroundColor: _backgroundColor,
          selectedItemColor: _selectedItemColor,
          unselectedItemColor: _unselectedItemColor,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              label: 'စာအုပ်စင်',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
                label: 'မှတ်သားဖွယ်ရာများ', icon: Icon(Icons.list)),
          ],
          onTap: _changePage,
        ));
  }

  _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _getScreen(int index) {
    switch (index) {
      case 1:
        return NotesTab();
      default:
        return BookShelfTab();
    }
  }
}
