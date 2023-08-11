import 'package:flutter/material.dart';
import 'package:flutter_provider_example/screen_one.dart';
import 'package:provider/provider.dart';

class WidgetOne extends StatelessWidget {
  const WidgetOne({super.key});

  @override
  Widget build(BuildContext context) {
    var myModel = Provider.of<MyModel>(context); // to test provider scope
    return Column(
      children: [
        Text('another counter = ${myModel.selectCountValueTow}'),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              // value.increment();
              context
                  .read<MyModel>()
                  .incrementValueTow(); // second way to call method from MyModel (ChangeNotifier)
              // Provider.of(context).read<MyModel>(context).increment(); // this way need to wrap MaterialApp by Provider
            },
            child: const Text('Increment value'))
      ],
    );
  }
}
