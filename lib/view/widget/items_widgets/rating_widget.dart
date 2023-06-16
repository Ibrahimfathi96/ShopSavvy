import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            ...List.generate(
              5,
                  (index) => Icon(
                index < 3 ? Icons.star : Icons.star_border,
                color:
                index < 3 ? Colors.orange : Colors.black87,
                size: 15,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 6,
        ),
        const Text(
          "3.5(50)",
          style: TextStyle(fontSize: 13, color: Colors.black87),
        ),
      ],
    );
  }
}
