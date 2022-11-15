import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationCompleteTable extends ConsumerWidget {
  const LocationCompleteTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          border: TableBorder.all(),
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('PO/DR')),
            DataColumn(label: Text('BOX')),
            DataColumn(label: Text('TOTAL_BOX')),
            DataColumn(label: Text('MPO/MDR')),
            DataColumn(label: Text('TRF_NUMBER')),
            DataColumn(label: Text('SUPP_CODE')),
            DataColumn(label: Text('BU_ID')),
            DataColumn(label: Text('DEPT')),
            DataColumn(label: Text('SUBDEPT')),
            DataColumn(label: Text('CLASS')),
            DataColumn(label: Text('CLASSNAME')),
            DataColumn(label: Text('CON_ID')),
            DataColumn(label: Text('ORIGINCODE')),
            DataColumn(label: Text('STORE NO')),
            DataColumn(label: Text('PALLET ID')),
            DataColumn(label: Text('CBM')),
            DataColumn(label: Text('WT.')),
          ],
          rows: [
            for (int i = 0; i < 30; i++)
              DataRow(
                cells: [
                  for (int j = 0; j < 18; j++)
                    const DataCell(
                      Text(''),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
