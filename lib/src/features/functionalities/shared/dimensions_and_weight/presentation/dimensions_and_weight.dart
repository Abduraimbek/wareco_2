import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wareco_2/src/features/functionalities/functionalities.dart';
import 'package:wareco_2/src/helpers/extensions.dart';
import 'package:wareco_2/src/helpers/input_formatters.dart';

final dimensionsAndWeightKey = GlobalKey<FormState>();

class DimensionsAndWeight extends ConsumerStatefulWidget {
  const DimensionsAndWeight({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DimensionsAndWeightState();
}

class _DimensionsAndWeightState extends ConsumerState<DimensionsAndWeight> {
  final lengthController = TextEditingController();
  final heightController = TextEditingController();
  final widthController = TextEditingController();
  final weightController = TextEditingController();

  @override
  void dispose() {
    lengthController.dispose();
    heightController.dispose();
    widthController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(dimensionsAndWeightControllerProvider, ((previous, next) {}));

    return Form(
      key: dimensionsAndWeightKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dimensions and Weight', style: context.italicStyle),
          const SizedBox(height: 10),
          Row(
            children: [
              _BuildField(
                title: 'Length (mm):',
                controller: lengthController,
                formatter: [FilteringTextInputFormatter.digitsOnly],
                validatorMessage: 'Enter valid length',
                onChanged: (value) {
                  final length = int.tryParse(value) ?? 0;
                  ref
                      .read(dimensionsAndWeightControllerProvider.notifier)
                      .typeLength(length);
                },
              ),
              const SizedBox(width: 20),
              _BuildField(
                title: 'Width (mm):',
                controller: widthController,
                formatter: [FilteringTextInputFormatter.digitsOnly],
                validatorMessage: 'Enter valid width',
                onChanged: (value) {
                  final width = int.tryParse(value) ?? 0;
                  ref
                      .read(dimensionsAndWeightControllerProvider.notifier)
                      .typeWidth(width);
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _BuildField(
                title: 'Height (mm):',
                controller: heightController,
                formatter: [FilteringTextInputFormatter.digitsOnly],
                validatorMessage: 'Enter valid height',
                onChanged: (value) {
                  final height = int.tryParse(value) ?? 0;
                  ref
                      .read(dimensionsAndWeightControllerProvider.notifier)
                      .typeHeight(height);
                },
              ),
              const SizedBox(width: 20),
              _BuildField(
                title: 'Weight (kgs):',
                controller: weightController,
                formatter: [decimalInputFormatter()],
                validatorMessage: 'Enter valid weight',
                onChanged: (value) {
                  final weight = double.tryParse(value) ?? 0;
                  ref
                      .read(dimensionsAndWeightControllerProvider.notifier)
                      .typeWeight(weight);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BuildField extends StatelessWidget {
  const _BuildField({
    required this.title,
    required this.controller,
    required this.formatter,
    required this.validatorMessage,
    required this.onChanged,
  });

  final String title;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final String validatorMessage;
  final List<TextInputFormatter> formatter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(title, style: context.italicStyle),
          ),
          TextFormField(
            validator: (value) {
              final n = num.tryParse(value ?? '') ?? 0.0;
              if (value == null || n <= 0) {
                return validatorMessage;
              }
              return null;
            },
            controller: controller,
            onChanged: onChanged,
            inputFormatters: formatter,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
