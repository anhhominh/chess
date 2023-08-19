
// ignore_for_file: non_constant_identifier_names




class Data{
  final String puzzleId;
  final String fEN;
  final String moves;

  Data({required this.puzzleId, required this.fEN, required this.moves});
}

List<Data> listChess = [
  Data(
    puzzleId: '0KzIY', 
    fEN: '2k3nr/p1p2ppp/2p5/4P3/1PPr2b1/P7/4PPPP/RN2KB1R w KQ - 0 14', 
    moves: 'e2e3 d4d1'),

  Data(
    puzzleId: '0MkWL', 
    fEN: 'krr5/pp2Qp2/3p2p1/1P5p/P7/R7/5PPP/1Rq3K1 w - - 7 29', 
    moves: 'b1c1 c8c1'),

  Data(
    puzzleId: '0Oziu', 
    fEN: 'rn4k1/p6p/1pp1p1p1/P2pN1q1/2PP4/1Q2Pr1b/1P3PP1/R4RK1 w - - 0 18', 
    moves: 'e5f3 g5g2'),

  Data(
    puzzleId: '0P64b', 
    fEN: 'rn1qr1k1/ppp2ppp/1n3N2/3p4/2P3b1/1P3NP1/P2PQPBP/1R3RK1 b - - 0 15', 
    moves: 'd8f6 e2e8'),

  Data(
    puzzleId: '0Q8Cb', 
    fEN: '2k5/2P2pp1/2K5/2nN3p/8/8/8/8 b - - 1 60', 
    moves: 'c5e6 d5e7'),

  Data(
    puzzleId: '0SjyK', 
    fEN: '4B2k/pp2Q1pp/2p5/8/4P3/2Pq2bP/PP4P1/R1B1Rr1K w - - 4 22', 
    moves: 'e1f1 d3f1'),
  
  Data(
    puzzleId: '0TUDr', 
    fEN: '3r2k1/7p/1p4n1/p6R/8/2N1Q3/PPP3P1/2K2q2 w - - 0 31', 
    moves: 'c3d1 f1d1'),
  
  Data(
    puzzleId: '0TrOf', 
    fEN: '1r4k1/6p1/6pp/3p4/p2P4/1P6/P3RPPP/6K1 w - - 0 32', 
    moves: 'b3a4 b8b1'),

  Data(
    puzzleId: '0VMyc', 
    fEN: '5r2/ppp3pk/3p1q1p/3Pp3/2P1P2P/2N3Q1/PP5P/R5K1 w - - 3 25', 
    moves: 'c3d1 f6f1'),

  Data(
    puzzleId: '0WdYZ', 
    fEN: '2rQ2k1/5p1p/6p1/pp2BqPn/2r2P2/P1P5/1P5P/2KRR3 b - - 2 25', 
    moves: 'c8d8 d1d8'),

];