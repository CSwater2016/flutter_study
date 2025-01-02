import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
文本框 TextField、TextFormField
🟢 TextFormField(和 TextField 基本一致，增加了表单的验证功能（必填、长度），和提交的回调)
❗️ TextField 的直接父视图需要是 StatelfulWidget

1. 配置文本框样式 decoration:InputDecoration

2. 获取文本框的输入值 controller:TextEditingController
   ❗️当不再使用 TextEditingController 时，调用 dispose 销毁它以确保相关的资源得到释放。

3. 监听文本框
      输入变化 onChanged: (value) {}
      提交 onSubmitted: (value) {}
    也可以通过 TextEditingController 的 addListener((){}) 监听 

4. 文本框的聚焦 autofocus:true
      FocusNode 聚焦节点。绑定到 TextField 之后，可以通过操作 FocusNode 来聚焦和取消聚焦。
        ❗️同样的，不再使用的时候，需要调用 dispose 销毁它以确保相关的资源得到释放。

5. 带验证的 TextFormField
    1. 创建固定不变的 GlobalKey
    2. validator : (value) {}
*/

class TextFieldStudy extends StatefulWidget {
  const TextFieldStudy({super.key});

  @override
  State<TextFieldStudy> createState() => _TextFieldStudyState();
}

class _TextFieldStudyState extends State<TextFieldStudy> {
  var textFieldController = TextEditingController(text: "初始文本");
  var textFieldFocusNode = FocusNode();

  var textFormFieldController = TextEditingController();
  var textFormFieldFocusNode = FocusNode();

  @override
  void dispose() {
    // 💡 注意销毁相关资源
    textFieldController.dispose();
    textFieldFocusNode.dispose();

    textFormFieldController.dispose();
    textFormFieldFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textFieldController.addListener(() {
      print("111 内容发生变化 ${textFieldController.text}");
    });
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: textFieldExample(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: textFormFieldExample(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField textFieldExample() {
    return TextField(
      controller: textFieldController,
      decoration: InputDecoration(
        hintText: 'Please enter some text',
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green, width: 1.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onChanged: (value) {
        print("### 内容发生变化 $value");
      },
      onSubmitted: (value) {
        // 点击确定，自动聚焦到 textFormField
        textFormFieldFocusNode.requestFocus();
      },
    );
  }

  TextFormField textFormFieldExample() {
    return TextFormField(
      focusNode: textFormFieldFocusNode,
      controller: textFormFieldController,
      decoration: InputDecoration(
        hintText: 'Please enter some text',
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green, width: 1.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
