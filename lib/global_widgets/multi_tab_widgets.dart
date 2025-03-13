import 'package:flutter/material.dart';
import 'package:flutter_study/core/constants/styles.dart';
import 'package:flutter_study/core/gen/assets.gen.dart';
import 'package:flutter_study/core/widgets/image_view.dart';

/*
BottomNavigationBar
一个底部导航栏，通常用于Scaffold组件的底部，可指定颜色和模式，接受点击回调，可与PageView实现切页效果。
*/

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
        title: const Text('Flutter Bottom Navigation Bar'),
      ),
      body: _pages[_currentIndex], // 根据 Tab 切换页面
      bottomNavigationBar: SizedBox(
        height: 64 + MediaQuery.of(context).padding.bottom,
        child: BottomNavigationBar(
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedItemColor: Styles.c_B381D9,
          unselectedItemColor: Styles.c_999999,
          type: BottomNavigationBarType.fixed, // 固定宽度
          currentIndex: _currentIndex, // 当前选中的 Tab 下标
          onTap: _onItemTapped, // Tab 点击时的回调
          items: <BottomNavigationBarItem>[
            _buildBottomNavigationBarItem('首页', Assets.images.mainTab.mainTabCalenderUnselected.path,
                Assets.images.mainTab.mainTabCalenderSelected.path),
            _buildBottomNavigationBarItem('课程', Assets.images.mainTab.mainTabCourseUnselected.path,
                Assets.images.mainTab.mainTabCourseSelected.path),
            _buildBottomNavigationBarItem(
                '我的', Assets.images.mainTab.mainTabMineUnselected.path, Assets.images.mainTab.mainTabMineSelected.path),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(String label, String iconPath, String activeIconPath) {
    return BottomNavigationBarItem(
      icon: Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: ImageView(
            path: iconPath,
          )),
      activeIcon: Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: ImageView(
            path: activeIconPath,
            color: Styles.c_B381D9,
          )),
      label: label,
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
