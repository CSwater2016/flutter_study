import 'package:flutter/material.dart';

class MultiTabWidgets extends StatefulWidget {
  const MultiTabWidgets({super.key});

  @override
  State<MultiTabWidgets> createState() => _MultiTabWidgetsState();
}

class _MultiTabWidgetsState extends State<MultiTabWidgets> {
  int _currentIndex = 0; // 当前选中的 Tab 下标

  // 对应每个 Tab 的页面
  final List<Widget> _pages = [
    Center(child: JumpExampleWidget()),
    Center(child: Text('Search Page')),
    Center(child: Text('Profile Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // 更新选中的 Tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Bottom Navigation Bar'),
      ),
      body: _pages[_currentIndex], // 根据 Tab 切换页面
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // 当前选中的 Tab 下标
        onTap: _onItemTapped, // Tab 点击时的回调
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// MARK: 跳转示例

class JumpExampleWidget extends StatelessWidget {
  const JumpExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: const Text('跳转'),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: const Text('跳转示例'),
                      ),
                      body: Container(
                        color: Colors.white,
                      ),
                    ))));
  }
}
