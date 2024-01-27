import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LapDisplay extends StatelessWidget {
  final String label;
  const LapDisplay({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 0.2,
          ),
        ),
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              "00:00:00",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

class LapsDisplay extends StatelessWidget {
  const LapsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.01.sh),
      child: SizedBox(
        child: ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) =>
              LapDisplay(label: 'Lap $index'),
        ),
      ),
    );
  }
}
