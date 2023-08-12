import 'package:flutter/material.dart';
import 'package:flutter_provider_example/screen_one.dart';
import 'package:provider/provider.dart';

// this Widget just for test
class WidgetOne extends StatelessWidget {
  const WidgetOne({super.key});

  @override
  Widget build(BuildContext context) {
    var myModel = Provider.of<MyModel>(context); // to test provider scope
    // var myModel = Provider.of<MyModel>(context , listen: false); // when we set (listen: false) date will change in controller not in UI
    return Column(
      children: [
        Text('another counter = ${myModel.selectCountValueTow}'),
        Text('another counter (context.watch<MyModel>()) = ${context.watch<MyModel>().selectCountValueTow}'),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              context
                  .read<MyModel>()
                  .incrementValueTow(); // second way to call method from MyModel (ChangeNotifier)
            },
            child: const Text('Increment value'))
      ],
    );
  }
}
