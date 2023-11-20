import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/bloc/scanner_bloc.dart';

class ScanMerch extends StatefulWidget {
  const ScanMerch({super.key});

  @override
  State<ScanMerch> createState() => _ScanMerchState();
}

class _ScanMerchState extends State<ScanMerch> {
  void _showUnlockDialog(String titler, String item, String item_image) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
                title: Text(
                  '${titler}',
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      child: Image.asset('${item_image}'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${item}',
                    ),
                  ],
                )),
          );
        });
  }

  void _showCancelErrorDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              title: Text(
                'Alerta',
              ),
              content: Text("No se pudo completar el escaneo"),
            ),
          );
        });
  }

  void _showUnexistantDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              title: Text(
                'Alerta',
              ),
              content: Text("El ID escaneado no corresponde a ninguna carta"),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white;
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Camera.webp"),
              fit: BoxFit.cover,
            ),
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
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.cyan,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () async {
                        String res = await scanQR();
                        BlocProvider.of<ScannerBloc>(context).setCodeData(res);
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        size: 90,
                      )),
                ),
              ),
              BlocBuilder<ScannerBloc, ScannerState>(builder: (context, state) {
                if (state is GetCodeDataState) {
                  Future.microtask(() => _showUnlockDialog(
                      state.unlocked, state.item, state.item_image));
                  BlocProvider.of<ScannerBloc>(context).add(UnlockGivenEvent());
                } else if (state is ErrorDataState) {
                  Future.microtask(() => _showCancelErrorDialog());
                  BlocProvider.of<ScannerBloc>(context).add(UnlockGivenEvent());
                } else if (state is UnexistantDataState) {
                  Future.microtask(() => _showUnexistantDialog());
                  BlocProvider.of<ScannerBloc>(context).add(UnlockGivenEvent());
                }

                return Text('');
              }),
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
    );
  }

  Future<String> scanQR() async {
    String scan_res;

    scan_res = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Cancel',
      true,
      ScanMode.QR,
    );

    return scan_res;
  }
}
