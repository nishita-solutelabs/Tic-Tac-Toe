import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: Images reference
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage cross = AssetImage('images/cross.png');
  AssetImage edit = AssetImage('images/edit.png');

  bool isCross = true;
  String message;
  List<String> gameState;

  // TODO: initialize state
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      this.message = '';
    });
  }

  // TODO: Play game
  playGame(int index) {
    if (this.gameState[index] == 'empty') {
      setState(() {
        if (isCross) {
          gameState[index] = 'cross';
        } else {
          gameState[index] = 'circle';
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  // TODO: Reset game
  resetGame() {
    setState(() {
      this.gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      this.message = '';
    });
  }

  // TODO: return image according to game state

  getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

  // TODO: win logic
  checkWin() {
    //Row 1
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[0] == gameState[2])) {
      setState(() {
        this.message = ' ${this.gameState[0]} wins';
        Timer(Duration(seconds: 4), () {
          resetGame();
        });
      });
    }
    //Row 2
    else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[3] == gameState[5])) {
      setState(() {
        this.message = ' ${this.gameState[3]} wins';
        Timer(Duration(seconds: 4), () {
          resetGame();
        });
      });
    }
    //Row 3
    else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[6] == gameState[8])) {
      setState(() {
        this.message = ' ${this.gameState[6]} wins';
        Timer(Duration(seconds: 4), () {
          resetGame();
        });
      });
    }
    //Col 1
    else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[0] == gameState[6])) {
      setState(() {
        this.message = ' ${this.gameState[0]} wins';
        Timer(Duration(seconds: 4), () {
          resetGame();
        });
      });
    }
    //Col 2
    else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[1] == gameState[7])) {
      setState(() {
        this.message = ' ${this.gameState[1]} wins';
        Timer(Duration(seconds: 4), () {
          resetGame();
        });
      });
    }
    //Col 3
    else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[2] == gameState[8])) {
      setState(() {
        this.message = ' ${this.gameState[2]} wins';
        Timer(Duration(seconds: 4), () {
          resetGame();
        });
      });
    }
    //Diagonal 1
    else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[0] == gameState[8])) {
      setState(() {
        this.message = ' ${this.gameState[0]} wins';
        Timer(Duration(seconds: 4), () {
          resetGame();
        });
      });
    }
    //Diagonal 2
    else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[2] == gameState[6])) {
      setState(() {
        this.message = ' ${this.gameState[2]} wins';
        Timer(Duration(seconds: 4), () {
          resetGame();
        });
      });
    }
    // check if all fill for draw (all full and no win)
    else if (!gameState.contains('empty')) {
      setState(() {
        this.message = 'Game Draw';
        Timer(Duration(seconds: 4), () {
          resetGame();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Tic Tac Toe')),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 9,
                itemBuilder: (context, i) {
                  return SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: MaterialButton(
                      onPressed: () {
                        this.playGame(i);
                      },
                      child: Image(
                        image: this.getImage(this.gameState[i]),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                this.message,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              color: Colors.purple,
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              onPressed: () {
                resetGame();
              },
              child: Text(
                'Reset the Game',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
