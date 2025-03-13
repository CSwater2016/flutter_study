import 'package:flutter/material.dart';
import 'package:extended_tabs/extended_tabs.dart';

/*
DynamicTabsStudy
一个动态标签页的示例，可以动态添加和删除标签页。
*/

class DynamicTabsStudy extends StatefulWidget {
  const DynamicTabsStudy({super.key});

  @override
  State<DynamicTabsStudy> createState() => _DynamicTabsStudyState();
}

class _DynamicTabsStudyState extends State<DynamicTabsStudy> with TickerProviderStateMixin {
  // 使用 TickerProviderStateMixin 而不是 SingleTickerProviderStateMixin
  // 因为我们会动态重建 TabController

  late TabController _tabController;

  // 标签页数据列表
  final List<String> _tabs = ["标签一", "标签二"];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: _currentIndex,
      animationDuration: const Duration(milliseconds: 300),
    );

    // 监听标签页切换
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _currentIndex = _tabController.index;
      });
    }
  }

  @override
  void dispose() {
    // 确保在销毁前停止所有动画
    _tabController.animateTo(_tabController.index); // 停止任何进行中的动画
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  // 添加新标签页
  void _addTab() {
    // 如果标签页正在切换中，不执行操作
    if (isAnimating) return;

    setState(() {
      final newIndex = _tabs.length + 1;
      _tabs.add("标签$newIndex");
      _rebuildTabController(_tabs.length - 1);
    });
  }

  // 删除当前标签页
  void _removeCurrentTab() {
    if (_tabs.length <= 1) return;

    // 先停止任何进行中的动画
    if (isAnimating) return;

    setState(() {
      final removedIndex = _currentIndex;
      _tabs.removeAt(removedIndex);

      // 安全地重建 TabController
      final newIndex = removedIndex > 0 ? removedIndex - 1 : 0;
      _rebuildTabController(newIndex);
    });
  }

  // 封装重建 TabController 的逻辑
  void _rebuildTabController(int initialIndex) {
    // 移除旧监听器
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();

    // 创建新控制器
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: initialIndex,
    );

    // 添加新监听器
    _tabController.addListener(_handleTabSelection);
    _currentIndex = initialIndex;
  }

  bool get isAnimating {
    // 如果标签页正在切换中，不执行操作
    if (_tabController.indexIsChanging) return true;

    // 检查动画值是否接近整数
    var animation = _tabController.animation;
    if (animation != null) {
      double value = animation.value;
      double fractionalPart = value - value.floor();
      if (fractionalPart > 0.01 && fractionalPart < 0.99) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('动态标签页示例'),
        bottom: _buildTabBar(),
        actions: _buildActions(),
      ),
      body: _buildTabView(),
    );
  }

  List<Widget> _buildActions() {
    return [
      IconButton(
        icon: const Icon(Icons.add),
        onPressed: _addTab,
        tooltip: '添加标签页',
      ),
      IconButton(
        icon: const Icon(Icons.remove),
        onPressed: _removeCurrentTab,
        tooltip: '删除当前标签页',
      ),
    ];
  }

  PreferredSizeWidget _buildTabBar() {
    return ExtendedTabBar(
      labelColor: Colors.black,
      indicatorColor: Colors.blue,
      controller: _tabController,
      isScrollable: true, // 标签较多时可以滚动
      tabs: _tabs.map((text) => Tab(text: text)).toList(),
    );
  }

  Widget _buildTabView() {
    return ExtendedTabBarView(
      controller: _tabController,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(), // 使用更稳定的滚动物理效果
      shouldIgnorePointerWhenScrolling: true, // 滚动时忽略指针事件，避免多重手势
      children: _tabs.map((text) => Center(child: Text(text))).toList(),
    );
  }
}
