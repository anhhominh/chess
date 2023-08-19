import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class GameOver extends StatelessWidget {
  const GameOver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      elevation: 1,
      title: Text('GAME OVER',style: TextStyle(color: Colors.amber[900]),),
      actions: <Widget>[
        TextButton(
        style: TextButton.styleFrom(
        textStyle: Theme.of(context).textTheme.labelLarge,
      ),
        child: const Text('Chơi ván mới!'),
        onPressed: () {
          if(kIsWeb) {
            Restart.restartApp(webOrigin: '[your main route]');
          }
          else{
            Restart.restartApp();
            }
          },
        ),
      ],
      );
  }
}
