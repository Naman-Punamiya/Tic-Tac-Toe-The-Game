import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool OTurn = true;
  List<String> displayXO = ["", "", "", "", "", "", "", "", ""];

  var myTextStyle = const TextStyle(color: Colors.white, fontSize: 30);
  int OScore = 0;
  int XScore = 0;
  int filledBoxes = 0;

  static var myNewFontWhite = GoogleFonts.varelaRound(
      textStyle: const TextStyle(color: Colors.white, letterSpacing: 3));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (OTurn) ? Colors.blue[300] : Colors.red[300],
      //  Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Container(
                    child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 110,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white,
                          width: 1.5,
                          strokeAlign: BorderSide.strokeAlignOutside)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Player O",
                          style: myNewFontWhite.copyWith(
                              color: Colors.blue[800], fontSize: 24)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(OScore.toString(),
                          style: myNewFontWhite.copyWith(
                              fontSize: 24, color: Colors.blue[800])),
                    ],
                  ),
                ),
                Container(
                  height: 110,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white,
                          width: 1.5,
                          strokeAlign: BorderSide.strokeAlignOutside)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Player X",
                          style: myNewFontWhite.copyWith(
                              color: Colors.red[800], fontSize: 24)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(XScore.toString(),
                          style: myNewFontWhite.copyWith(
                              fontSize: 24, color: Colors.red[800])),
                    ],
                  ),
                ),
              ],
            ))),
            Expanded(
              flex: 2,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: Center(
                          child: Text(displayXO[index],
                              style: myNewFontWhite.copyWith(fontSize: 50)
                              // TextStyle(color: Colors.white, fontSize: 40),
                              ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(top: 45),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "TIC TAC TOE",
                      style: myNewFontWhite.copyWith(fontSize: 36),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "@JUST.PC.ARTS",
                      style: myNewFontWhite.copyWith(fontSize: 36),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (OTurn && displayXO[index] == "") {
        displayXO[index] = "O";
        filledBoxes += 1;
      } else if (!OTurn && displayXO[index] == "") {
        displayXO[index] = "X";
        filledBoxes += 1;
      }
      OTurn = !OTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != "") {
      _showWinDialog(displayXO[0]);
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != "") {
      _showWinDialog(displayXO[3]);
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != "") {
      _showWinDialog(displayXO[6]);
    }
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != "") {
      _showWinDialog(displayXO[0]);
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != "") {
      _showWinDialog(displayXO[1]);
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != "") {
      _showWinDialog(displayXO[2]);
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != "") {
      _showWinDialog(displayXO[0]);
    }
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != "") {
      _showWinDialog(displayXO[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Winner Is : $winner"),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Play Again!"))
            ],
          );
        });
    if (winner == "O") {
      OScore++;
    } else if (winner == "X") {
      XScore++;
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Draw"),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Play Again!"))
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (var i = 0; i < 9; i++) {
        displayXO[i] = "";
      }
    });
    filledBoxes = 0;
  }
}
