import 'package:flutter/material.dart';

class RoomSummary extends StatelessWidget {
  const RoomSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.room,
              color: Colors.red,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListTile(
                  title: Text(
                    'Quarto 123',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('0:00 pm - 11:30 pm'),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check_circle,
                    size: 30,
                    color: Color(0xff26e56d),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cancel,
                    size: 30,
                    color: Color(0xffff4077),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
