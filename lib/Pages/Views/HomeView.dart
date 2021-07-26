import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController? _pageController;
  List<String> _selectNum = ["select0", "select1", "select2"];
  int _selectIndex = 0;
  List<String> _imgs = [
    "https://images.unsplash.com/photo-1511919884226-fd3cad34687c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y2FyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1542362567-b07e54358753?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTl8fGNhcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1494905998402-395d579af36f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGNhcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
  ];

  List<Map<String,String>> _list1Data = [
    {
      "itemImg" : "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      "itemName" : "상품1",
      "itemPrice" : "10,000원"
    },
    {
      "itemImg" : "https://images.unsplash.com/photo-1609608934376-e9a499e6ef67?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      "itemName" : "상품2",
      "itemPrice" : "20,000원"
    },
    {
      "itemImg" : "https://images.unsplash.com/photo-1617201929478-8eedff7508f9?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      "itemName" : "상품3",
      "itemPrice" : "30,000원"
    },
  ];

  @override
  void initState() {
    this._pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    this._pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            this._topBanner(),
            this._saleList1(),
            this._saleList1(),
            Container()
          ],
        )
      ),
    );
  }

  Widget _topBanner(){
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.0, top: 20.0, bottom: 15.0),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Title",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
              ),
            ),
          ),
          Container(
            //alignment: Alignment.topCenter,
            //height: 300,
            //color: Colors.lightGreen,
            child: Row(
              // map함수, foreach 두가지는 요소 반복 사용 시, 매우 자주 쓰임.
              // 수기로 선택함 , 바꿔야 함 등을 사람의 언어로 글로 절차를 적는다. (도수코드) 반드시 필요******* 컴퓨팅적 사고 ex샌드위치를 먹는다 예시
              children: this._selectNum.map<Widget>(
                (String e) => Expanded(
                  child: TextButton(
                    onPressed: (){
                      this._pageController!.jumpToPage(this._selectNum.indexOf(e)); //!는 사용할 때 비어있지 않다의 의미로 ?사용시 비어있으면 실행하지 않는다의 의미.
                      //this._selectIndex = this._selectNum.indexOf(e);
                      print(this._selectNum.indexOf(e));
                      setState(() {
                        this._selectIndex = this._selectNum.indexOf(e);
                      });
                    },
                    child: Text(
                      e,
                      style: TextStyle(
                        color: this._selectIndex == this._selectNum.indexOf(e)
                          ? Colors.red // 맞으면
                          : Colors.grey
                      ),
                    ),
                  ),
                )
              ).toList()
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: 300, // Container는 처음 만들었을 때 크기체크가 반드시 필요. color, height, width로 확인.
            child: PageView.builder(
              controller: this._pageController,
              onPageChanged: (int i){
                setState(() {
                  this._selectIndex = i; // 텍스트버튼의 활성화 기준을 선택한 페이지로 변경.
                });
              },
              itemCount: this._imgs.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  //color: Colors.indigo,
                  //child: Text(index.toString()),
                  child: Column(
                    children: [
                      Expanded( // Expanded로 비율을 설정(기본1)
                        child: Container(
                          //color: Colors.red,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(this._imgs[index])
                            )
                          ),
                        ),
                      ),
                      Container(
                        //color: Colors.brown,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(10.0),
                        child: Text("item$index"),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      )
    );
  }
  // 함수의 인자로 만들어서 변경되는 부분을 3번째 컨테이너로 구현.
  // 인자 : 함수기본 / 네이밍 옵션
  // 컴퓨팅적 사고 유튜브.
  Widget _saleList1(){
    return Container(
      color: Colors.lightBlueAccent,
      height: 250,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0, top: 20.0, bottom: 10),
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child: Text(
              "Sale #1",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10.0,
                crossAxisCount: 1,
              ),
              itemCount: this._list1Data.length,
              itemBuilder: (BuildContext context, int i){
                return Container(
                  color: Colors.yellow,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(this._list1Data[i]["itemImg"].toString())
                            )
                          ),
                        )
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              this._list1Data[i]["itemName"].toString(),
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(this._list1Data[i]["itemPrice"].toString())
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ),
        ],
      ),
    );
  }
}
