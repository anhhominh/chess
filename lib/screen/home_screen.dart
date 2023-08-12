import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';
import 'package:test/controller/count_controller.dart';
import 'package:test/screen/widget/game_over.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 ChessBoardController controller = ChessBoardController();
 Chess chess = Chess();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Chess Demo',style: TextStyle(color: Colors.white),),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(context.watch<CountController>().count == 0)
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Bắt đầu với lượt đi của quân Trắng!",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ),
                if(context.watch<CountController>().count != 0 && context.watch<CountController>().count % 2 == 0)
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Đến lượt đi của quân Trắng!",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ),
                if(context.watch<CountController>().count % 2 != 0)
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Đến lượt đi của quân Đen!",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ),
                Expanded(
                  child: Center(
                    child: ChessBoard(
                      controller: controller,
                      boardColor: BoardColor.orange,
                      onMove: (){
                        if(!chess.game_over){
                          const snackBar = SnackBar(
                          duration: Duration(milliseconds: 650),
                          backgroundColor: Colors.green,
                          content: Text('Bước đi của bạn là hợp lệ!'),
                        );
                        if(chess.fen.isNotEmpty) {
                          context.read<CountController>().updateCount();
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        }
                      },
                      // boardOrientation: PlayerColor.white,
                    ),
                  ),
                ),          
              ],
            ),
            GameOver(controller: controller),
          ],
        ),
      ),
    );
  }
}