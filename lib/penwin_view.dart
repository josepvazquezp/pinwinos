import 'package:flutter/material.dart';

class PenwinView extends StatelessWidget {
  final Map<String, String> Pinwin;

  const PenwinView({
    super.key,
    required this.Pinwin,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: (Pinwin['Amigo'] == '1') ? Colors.blue : Colors.amber),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 80,
                      width: 80,
                      child: Image.asset('assets/images/profile.png')),
                  Text(
                    '${Pinwin['Nombre']}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Pinwin['Conectado'] == '1')
                            ? Colors.green
                            : Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
