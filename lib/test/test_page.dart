import './test_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TestPage1 extends StatelessWidget {
  String text = '';
  TestPage1({Key? key, required String text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Testing ${text}');
    return GetBuilder<TestController>(builder: ((controller) {
      return Container(
        child: Text(text),
      );
    }));
  }
}

class TestPage2 extends StatelessWidget {
  String text = '';
  TestPage2({Key? key, required String text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Testing22 ${text}');
    return GetBuilder<TestController>(builder: ((controller) {
      return Container(
        child: Text(text),
      );
    }));
  }
}

class Welcome extends StatelessWidget {
  String age;
  int susu;

  Welcome({
    required this.age,
    required this.susu,
  });
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        age: json["age"],
        susu: json["susu"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "susu": susu,
      };
}

 enum Coloraa  {
  red,
  green,
  blue,
}

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);
  Map<String, dynamic> a = {
    'age': '21',
    'sex': 'aa',
    'susu': 112,
    'asd': {'a': 2}
  };
  
  var b = Welcome(susu: 11, age: '15');

  @override
  Widget build(BuildContext context) {
    a.addAll(b.toJson());
    a['xxx'] = 1;

    Coloraa category = Coloraa.green;
    if (category ==  Coloraa.green) {
      print('objec22dss111111adast $a');
    } else {
      print('objectasd as das $category');
    }
    final testController = Get.put(TestController());
    return Column(
      children: [
        GetBuilder<TestController>(
          builder: (controller) {
            return Row(
              children: [
                Obx(() => Column(
                      children: [
                        Text(controller.count.value.toString()),
                        Text(controller.list['last'])
                      ],
                    ))
              ],
            );
          },
        ),
        //  GetBuilder<TestController>(
        //   id: 'update2',
        //   builder: (controller) {
        //     return Text(controller.count1.toString());
        //   },

        // ),
        TextButton(
          onPressed: () {
            testController.count.value = 22;
          },
          child: Text('添加'),
        ),
        TextButton(
          onPressed: () {
            // testController.increment2();
          },
          child: Text('添加'),
        ),
      ],
    );
  }
}
