import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
  Provider 的基础
  第一步：暴露一个值(给子树)
    1. 开始监听时[创建]一个对象：create
    2. [复用]一个已经存在的对象实例：.value
  第二步：(子树中)读取值
    1. context.watch<T>()
      widget 能够监听到 T 类型的 provider 发生的改变。
      ❗️Provider 改变之后的[重建边界]：重建调用了读取值的 widget 以及其子树。
    2. context.read<T>()
      直接返回 T，不会监听改变。
      ❗️Provider 改变之后不会重建，在调用的时候就结束了。
    3. context.select<T，R>(R cb(T value))
      允许 widget 只监听 T 上的一部分内容的改变。
    4. context.of<T>()
      默认表现类似 watch, listen: false 的时候, 表现为 read
    
    优化：
    1. Consumer
      * 订阅整个 Provider，状态变化会触发 builder 重建。
      * 只会重建 Consumer 的 builder 部分，而不会重建包含 Consumer 的 Widget 本身。
    2. Selector
      * 仅订阅 Provider 指定的一部分，状态变化不会触发 builder 重建。
      * 只会重建 Selector 的 builder 部分，而不会重建包含 Selector 的 Widget 本身。
 */

void exposingValue() {
  // 🟢 [create]
  // "Provider" 只是负责将一个对象传递给子组件，并且不强制要求该对象必须具有通知 UI 更新的能力。
  // 因此 _CreateModel 不需要继承 ChangeNotifier (如果继承 ChangeNotifier 就能拥有通知 UI 更新的能力)
  Provider(
    // create: 创建对象的函数，默认情况下会延迟调用。
    create: (_) => _CreateModel(),
    // 可以禁止延迟调用，立即创建
    lazy: false,
    // 暴露的值（_TestModel 实例）对 Provider 的子树是可见的
    child: Container(),
  );

  // 🟢 [.value]
  // "ChangeNotifierProvider" 会将一个对象传递给子组件，并且强制要求该对象必须具有通知 UI 更新的能力。
  // 因此 _ValueModel 需要继承 ChangeNotifier
  _ValueModel model = _ValueModel();
  ChangeNotifierProvider<_ValueModel>.value(
    // 复用 model
    value: model,
    // 暴露的值对 Provider 的子树是可见的
    child: Container(),
  );
}

void readingValue(BuildContext context) {
  Text(context.watch<String>());
  context.read<String>();
  context.select<String, String>((value) => value);
}

// MARK: - Warning

// 暴露值的一些注意事项
void exposingValueWarning() {
  // ❌ Provider.value 只能复用已有的对象，不能创建新的对象
  ChangeNotifierProvider<_ValueModel>.value(
      value: _ValueModel() /* Provider.value 返回一个新的对象是错误的! */, child: Container());

  // ❌ create 不能返回一个已经存在的对象
  _ValueModel model = _ValueModel();
  ChangeNotifierProvider(
    create: (context) => model,
    child: Container(),
  );

  // ❌ Provider.create 不能依赖会变的变量
  var count = 10;
  Provider(create: (_) => _CounterModel(count) /* 创建的时候，count 已经固定 */, child: Container());
  count = 20; // 并不能影响 Provider 内部的值

  // ✅ ProxyProvider0 可以依赖会变的变量
  // TODO: 提供更为详细的 Demo
  ProxyProvider0(
    update: (context, value) => _CounterModel(count),
    child: Container(),
  );
}

void readingValueWarning() {
  // 依赖可能不存在的 Provider (监听了一个根本不存在的 Provider)
}

// MARK: - Model

class _CreateModel {}

class _ValueModel extends ChangeNotifier {}

class _CounterModel {
  int count;
  _CounterModel(this.count);
}
