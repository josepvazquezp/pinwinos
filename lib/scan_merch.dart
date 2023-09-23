import 'package:flutter/material.dart';

class ScanMerch extends StatelessWidget {
  const ScanMerch({super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white;
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Camera.webp"),
                  fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(207, 0, 187, 212)),
                  child: Text('Escanea un Codigo',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: textColor,
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.cyan,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          print('Funcionando');
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          size: 90,
                        )),
                  ),
                ),
                Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22)),
                  color: Colors.cyan,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Volver',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
