import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                       useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(title: Text('我的自傳'),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: currentIndex==0? Image.asset('images/f1.jpg',width:40,height:40): Image.asset('images/f1.jpg',width:20,height:20), label:'自我介紹',),
            BottomNavigationBarItem(icon: Icon(Icons.school), label:'學習歷程',),
            BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label:'學習計畫',),
            BottomNavigationBarItem(icon: Icon(Icons.engineering), label:'專業方向',),
          ],
          onTap: (index) {
            setState(() {
              previousIndex=currentIndex;
              currentIndex=index;
              if (index==0) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('1.mp3'));
              }
              if (index==1) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('2.mp3'));
              }
              if (index==2) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('3.mp3'));
              }
              if (index==3) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('4.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {
final String s1='        我出生在一個很平凡但幸福美滿的小家庭，爸爸從事的行業與自動化控制相關，媽媽原本是會計但現在是個家庭主婦，而我是家中唯一的小孩，獨生子的壞處就是小時候沒人能陪我一起玩，經常會感到很無聊，長大後才知道獨生子能夠擁有父母所有的愛及照顧是一件很幸福的事，母親也經常告訴我"雖然錢不能買到所有東西，但人不可以沒有錢"這句話也深深烙印在我心裡，成為我人生一職追求的目標。'
                  '在小學時代的我很活潑、很好動，在課業及課外表現也算突出，也順利地加入資優班學習及接觸更多的知識和技能，另外曾擔任學校朝會節目的主持人、糾察隊、迷你橋牌隊、百貨公司門口表演相聲等，國小真的是我目前為止最充實也最開心的一段時光。'
                  '國中進入的是明星國中陽明國中，因為校區近原本國小的關係，大家大多都認識或是點頭之交的關係，又因為明星學校競爭更為激烈，而國小優異的我自然也被放大檢視，使我備感壓力，這樣的環境也讓我有些喪失自信，那時也開始迷上電腦遊戲，導致空窗得一段時間沒有好好念書，雖然後來改過自新成績也有回溫的現象，但最終會考的失利也為國中生涯畫下一悔恨的句號。'
                  '進入高中後，每天都過的很快樂。高中時有分為攻頂班及普通班，我自己兩個班級都待過，兩者的讀書風氣相差甚大，我那時施行了上課專心聽講，段考前兩周才認真讀書，其餘時間都是看小說或是打電動，而我認為這樣的生活讓我壓力不會這麼大也能過得快樂，最後學測也是順利取得了中上的成績。'
                  '經過金錢、地點、科系等考量後，最終來到了高雄科技大學，在這裡我能住在家裡，課餘時間能多陪陪父母，也能省下一筆住宿費，好奇心的驅使下我也進入了高瞻科技不分系成為第一屆的白老鼠學長，開啟了人生大學階段的新篇章。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who am I ??', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
          //放一張照片
          Container(
            color: Colors.redAccent,
            child:Image.asset('images/f1.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/f1.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/f1.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(child: Text('Screen2'),
      ),
    );
  }
}
class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大一時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:200,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 學好英文'),
                  Text('2. 認識同學'),
                  Text('3. Python '),
                  Text('4. 學校附近美食(楠梓)'),
                ],
              ),
            ),
          ],
        ),
        Row(),
        Row(),
        Row(),
        Row(),
      ],),
    );
  }
}
class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大二時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:200,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 學好英文考多益'),
                  Text('2. 資工系修習'),
                  Text('3. C語言 '),
                  Text('4. 學校附近美食(建工)'),
                ],
              ),
            ),
          ],
        ),
        Row(),
        Row(),
        Row(),
        Row(),
      ],),
    );
  }
}
class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大三時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:200,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 學好英文考多益'),
                  Text('2. 學期實習'),
                  Text('3. C語言+Python '),
                  Text('4. 娃娃機'),
                ],
              ),
            ),
          ],
        ),
        Row(),
        Row(),
        Row(),
        Row(),
      ],),
    );
  }
}
