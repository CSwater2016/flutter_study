import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

/*
  Provider 的基础
  第一步：暴露一个值(给子树)
    1. 开始监听时[创建]一个对象：create
    2. [复用]一个已经存在的对象实例：.value
  第二步：(子树中)读取值
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

// MARK: - Model

class _CreateModel {}

class _ValueModel extends ChangeNotifier {}

class _CounterModel {
  int count;
  _CounterModel(this.count);
}
