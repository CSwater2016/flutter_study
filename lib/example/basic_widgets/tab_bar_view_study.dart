import 'package:flutter/material.dart';

/*
TabBarView
通常与 TabBar 一起使用，实现滑页效果，可以指定 TabController 来控制页面切换。
*/

class TabBarViewStudy extends StatefulWidget {
  const TabBarViewStudy({super.key});

  @override
  State<TabBarViewStudy> createState() => _TabBarViewStudyState();
}

class _TabBarViewStudyState extends State<TabBarViewStudy> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<String> tabs = ['新闻', '历史', '图片'];

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBarView 测试页面'),
        bottom: TabBar(controller: _tabController, tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      body: _buildMain(),
    );
  }

  Widget _buildMain() {
    return TabBarView(controller: _tabController, children: tabs.map((e) => Center(child: Text(e))).toList());
  }
}
