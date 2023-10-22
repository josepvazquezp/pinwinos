import 'package:flutter/material.dart';
import 'package:pinwinos/models/pinwino.dart';

class PenwinView extends StatelessWidget {
  //final Map<String, String> Pinwin;
  final Pinwino Pinwin;
  final bool isFriend;

  const PenwinView({
    super.key,
    required this.Pinwin,
    required this.isFriend,
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
                  color: (isFriend == true) ? Colors.blue : Colors.amber),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                          height: 80,
                          width: 80,
                          child: Image.asset('assets/images/profile.png')),
                      Container(
                        height: 30,
                        width: 30,
                        child: Image.asset('${Pinwin.gorro}'),
                      ),
                    ],
                  ),
                  Text(
                    '${Pinwin.nombre}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Pinwin.conectado == true)
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
