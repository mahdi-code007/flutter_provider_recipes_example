import 'package:flutter/material.dart';
import 'package:flutter_provider_example/widget_one.dart';
import 'package:provider/provider.dart';

// this screen just for test
class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: Scaffold(
        appBar:
            AppBar(title: const Text('Provider Example'), centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer<MyModel>(builder: (context, value, child) {
                print('text 1 with Consumer');
                return Text('my value is ${value.name}');
              }),
              const SizedBox(
                height: 10,
              ),
              Consumer<MyModel>(
                builder: (context, value, child) {
                  print('Button 1 with Consumer');
                  return ElevatedButton(
                      onPressed: () {
                        value.changeValue();
                      },
                      child: const Text('Change value'));
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Selector<MyModel, int>(
                  selector: (context, myModel) => myModel.selectCountValue,
                  builder: (context, value, child) {
                    print('Text 2 with Selector');
                    return Text('number is $value');
                  }),
              const SizedBox(
                height: 10,
              ),
              Selector<MyModel, int>(
                  selector: (context, myModel) => myModel.selectCountValue,
                  builder: (context, value, child) {
                    print('Button 2 with Selector');
                    return ElevatedButton(
                        onPressed: () {
                          // value.increment();
                          context
                              .read<MyModel>()
                              .increment(); // second way to call method from MyModel (ChangeNotifier)
                          // Provider.of(context).read<MyModel>(context).increment(); // this way need to wrap MaterialApp by Provider
                        },
                        child: const Text('Increment value'));
                  }),
              const SizedBox(
                height: 50,
              ),
              const WidgetOne() // this widget created to test provider scope
            ],
          ),
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  String name = 'Test';
  int count = 0;

  get selectCountValue => count;

  int countTow = 0;

  get selectCountValueTow => countTow;

  void changeValue() {
    name = 'Mahdi';
    notifyListeners();
  }

  void increment() {
    count++;
    notifyListeners();
  }

  void incrementValueTow() {
    countTow++;
    notifyListeners();
  }
}

/*
Selector is a class in Provider package that is less known compare to Consumer yet useful.
As the name suggests, Selector allows you to select a specific value in a Provider to listen to.
Then when and only when that selected value changes,
the widget that returns by the builder method of Selector will rebuild.

This is done by the selector function will compare the previous
value and the new value whenever the provider notifies something.
If the selected value is changed, then the builder method is triggered.
 */
