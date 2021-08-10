import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  
  int starScore = 5; /// 소수 이거나 5 초과일 경우의 대응

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(
         color: Colors.black87
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.red,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              this._textBanner(starScore: this.starScore), //호출 시 this.
              Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget _textBanner({required int starScore}){
    Widget _starCheck({required int starScore}){
      if(starScore == 0) return Text("아직 평가 되지 않았습니다.");
      return Row(
        children: List<int>.generate(5, (int i) => i).map<Widget>((int e){
          return Icon(
            Icons.star,
            size: 20,
            color: e < starScore ? Colors.red : Colors.grey,
          );
        }).toList()
      );
    }
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            child: Text(
              "TextBanner"
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 3.0)
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0, left: 5.0),
            child: _starCheck(starScore: starScore) // 값이 어디서 어디로 넘나들고 있는지 체크가 필요하다..
          )
        ],
      ),
    );
  }
}
