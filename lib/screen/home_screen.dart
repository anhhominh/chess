
import 'package:bishop/bishop.dart' as bishop;
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';
import 'package:squares/squares.dart';
import 'package:square_bishop/square_bishop.dart';
import 'package:flutter/material.dart';
import 'package:test/controller/count_controller.dart';
import 'package:test/screen/widget/game_over.dart';
import 'package:test/widget/theme.dart';

import '../models/chess_model.dart';


class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    int index = context.watch<CheckController>().index;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Squares Example'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          if(index < 10)
          HomePage(index: index),
          if(index == 10)
          const Center(child: GameOver()),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final int index;
  const HomePage({Key? key, required this.index}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bishop.Game game;
  late SquaresState state;

  @override
  void initState() {
    _resetGame(false);
    Future.delayed(const Duration(seconds: 3), () {
     _resetGame1();
    });
    super.initState();
  }

  void _resetGame([bool ss = true]) {
    print(widget.index);
    game = bishop.Game(variant: bishop.Variant.standard(),fen: listChess[widget.index].fEN);
    if(listChess[widget.index].fEN.split(' ')[1] == 'w') {
      state = game.squaresState(Squares.black);
    }
    else{
      state = game.squaresState(Squares.white);
    }
    if (ss) setState(() {});
  }
    void _resetGame1([bool ss = true]) {
    game = bishop.Game(variant: bishop.Variant.standard(),fen: listChess[widget.index].fEN);
    game.makeMoveString(listChess[widget.index].moves.split(' ')[0]);
     if(listChess[widget.index].fEN.split(' ')[1] == 'w') {
      state = game.squaresState(Squares.black);
    }
    else{
      state = game.squaresState(Squares.white);
    }
    if (ss) setState(() {});
  }


  void _onMove(Move move) async {
    print(Move(from: move.from, to: move.to).algebraic());
    bool result = game.makeSquaresMove(move);
    if (result) {
      setState((){
         if(listChess[widget.index].fEN.split(' ')[1] == 'w') {
          state = game.squaresState(Squares.black);
        }
        else{
          state = game.squaresState(Squares.white);
        }
      });
    }

    if(Move(from: move.from, to: move.to).algebraic() == listChess[widget.index].moves.split(' ')[1]){
      context.read<CheckController>().updateCheck(true);
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
       showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return Container(
            color: Colors.green,
            height: 100,
            child: Row(
              children: [
                const Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      SizedBox(width: 25,),
                      Text('Bước đi của bạn là hợp lệ!',style: TextStyle(color: Colors.white),), 
                    ],
                  )),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                    context.read<CheckController>().updateIndex();
                    Future.delayed(const Duration(seconds: 1), () {
                    _resetGame1();
                  });
                }, 
                child: const Text('Ván tiếp')),
                const SizedBox(width: 20,)
              ],
            ),
          );
        });
        }
    if(Move(from: move.from, to: move.to).algebraic() != listChess[widget.index].moves.split(' ')[1]){
      context.read<CheckController>().updateCheck(false);
        showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return Container(
            color: Colors.redAccent,
            height: 100,
            child: Row(
              children: [
                const Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      SizedBox(width: 25,),
                      Text('Bước đi của bạn không hợp lệ!',style: TextStyle(color: Colors.white),), 
                    ],
                  )),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                    context.read<CheckController>().updateCheck(true);
                     _resetGame1();
                }, 
                child: const Text('Thử lại')),
                const SizedBox(width: 20,)
              ],
            ),
          );
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.index);
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      const SizedBox(width: 20,),
                      if(listChess[widget.index].fEN.split(' ')[1] == 'w')
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.green, width: 2)
                        ),
                        width: 25,
                        height: 25,
                        // color: Colors.black,
                      ),
                      if(listChess[widget.index].fEN.split(' ')[1] == 'b')
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.green, width: 2)
                        ),
                        width: 25,
                        height: 25,
                        // color: Colors.white,
                      ),
                      const SizedBox(width: 12,),
                      if(listChess[widget.index].fEN.split(' ')[1] == 'w')
                      const Text('Quân đen đi'),
                      if(listChess[widget.index].fEN.split(' ')[1] == 'b')
                      const Text('Quân trắng đi'),
                    ],
                  )),
                  ElevatedButton(
                    onPressed: (){
                        showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          elevation: 1,
                          title: Text('Gợi ý',style: TextStyle(color: Colors.amber[900]),),
                          content: Text('Di chuyển quân cờ theo đường ${listChess[widget.index].moves.split(' ')[1]}'),
                          actions: <Widget>[
                            TextButton(
                            style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            ),
                          ],
                          )
                        );
                    }, 
                    child: const Text('Gợi ý')),
                  const SizedBox(width: 20,),
              ],
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: BoardController(
                state:  state.board,//flipBoard ? state.board.flipped() :
                playState: state.state,
                pieceSet: PieceSet.merida(),
                theme: context.watch<CheckController>().check == false ? ThemeChess.errorBrown :  ThemeChess.brown,
                moves: state.moves,
                onMove: _onMove,
                onPremove: _onMove,
                markerTheme: MarkerTheme(
                  empty: MarkerTheme.dot,
                  piece: MarkerTheme.corners(),
                ),
                promotionBehaviour: PromotionBehaviour.autoPremove,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
            onPressed: (){
            context.read<CheckController>().updateIndex();
            // _resetGame(false);
            Future.delayed(const Duration(seconds: 1), () {
            _resetGame1();
            });
          }, child: const Padding(
            padding: EdgeInsets.only(left: 50,right: 50,top: 12,bottom: 12),
            child: Text('Bỏ qua'),
          ))
          ],
        ),
    );
  }
}



