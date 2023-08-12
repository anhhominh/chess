import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:restart_app/restart_app.dart';

class GameOver extends StatelessWidget {
  const GameOver({
    super.key,
    required this.controller,
  });

  final ChessBoardController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Chess>(
            valueListenable: controller,
            builder: (context, game, _) {
              if (controller.isGameOver() == true) {
                return AlertDialog(
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
             
              } else {
                return Container();
              } 
            },
          );
  }
}
