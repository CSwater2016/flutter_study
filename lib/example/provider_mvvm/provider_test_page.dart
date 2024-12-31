import 'package:flutter/material.dart';

// class ProviderTestPage extends StatelessWidget {
//   const ProviderTestPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// // MARK: - View

// class CounterPage extends StatelessWidget {
//   const CounterPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // ViewModel 发生变化时，重新构建 Text widget
//     ChangeNotifierProvider<CounterViewModel>(
//       create: (context) => CounterViewModel(CounterModel()),
//     );
//     return Consumer<CounterViewModel>(
//       builder: (context, viewModel, child) {
//         return Text('${viewModel.count}');
//       },
//     );
//   }
// }

// // MARK: - Model

// class CounterModel {
//   int _count = 0;

//   int get count => _count;

//   void increment() {
//     _count++;
//   }
// }

// // MARK: - ViewModel

// class CounterViewModel extends ChangeNotifier /* 继承自 ChangeNotifier */ {
//   // 操作的 Model
//   final CounterModel counterModel;

//   CounterViewModel(this.counterModel);

//   int get count => counterModel.count;

//   void increment() {
//     // 数据变更
//     counterModel.increment();
//     // 广播
//     notifyListeners();
//   }
// }
