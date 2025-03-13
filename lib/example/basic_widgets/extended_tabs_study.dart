import 'package:flutter/material.dart';
import 'package:extended_tabs/extended_tabs.dart';

/*
ExtendedTabBar
强大的官方 Tab/TabBar/TabView 扩展组件, 支持 TabView 嵌套滚动，支持设置滚动方向和缓存大小。
*/

class ExtendedTabsStudy extends StatefulWidget {
  const ExtendedTabsStudy({super.key});

  @override
  State<ExtendedTabsStudy> createState() => _ExtendedTabsStudyState();
}

class _ExtendedTabsStudyState extends State<ExtendedTabsStudy> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // 释放资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extended Tabs 示例'),
        bottom: _buildTabBar(),
      ),
      body: _buildExtendedTabView(),
    );
  }

  /// 构建 TabBar
  PreferredSizeWidget _buildTabBar() {
    return ExtendedTabBar(
      labelColor: Colors.black,
      indicatorColor: Colors.black,
      controller: _tabController,
      tabs: const [
        Tab(text: '标签一', icon: Icon(Icons.home)),
        Tab(text: '标签二', icon: Icon(Icons.person)),
        Tab(text: '标签三', icon: Icon(Icons.settings)),
      ],
    );
  }

  /// 构建 TabView
  Widget _buildExtendedTabView() {
    return ExtendedTabBarView(
      controller: _tabController,
      children: const [
        Center(child: Text('标签一内容')),
        Center(child: Text('标签二内容')),
        Center(child: Text('标签三内容')),
      ],
    );
  }
}
