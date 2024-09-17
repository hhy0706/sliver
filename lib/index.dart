import 'package:flutter/material.dart';
import 'routes/routes.dart';
// import 'counter/counter_page.dart';
// import 'guess/guess_page.dart';
import 'muyu/muyu_page.dart';
import 'package:get/get.dart';
import 'test/test_page.dart';
import 'test/test_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,
      //  initialRoute: '/test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('asdsad')),
        body: Main(),
        
      ),
      
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin {
  AnimationController? sizeController;
  Animation<double>? animation;
  bool start = true;
  bool scrollUp = false;
  double height = 0;
  double maxHeight = 0;
  double top = 0;
  double height1 = 0;
  double maxHeight1 = 0;
  GlobalKey headerKey = GlobalKey();
  GlobalKey headersKey = GlobalKey();
  bool mode = true;
  ScrollController _controller = ScrollController();
  List<String> res = ['1','2','3','4','5','6','7','8','9','10','1','2','3','4','5','6','7','8','9','10'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     print('-------------------- ');
    _controller.addListener(() {
       double pixels =   _controller.position.pixels;
      setState(() {
         scrollUp = pixels > top ? true : false;
       
       if(mode){
          print('------------SSS-------- ${ height} $pixels $top');
       final a = height - (pixels - top);
       final b = height + (top  - pixels);
       height  = scrollUp ? (a < 0 ? 0 : a) :(b < maxHeight ? b : maxHeight);
       }else {
           print('------------SSS-------- ${ height} $pixels $top');
       final a = height1 - (pixels - top);
       final b = height1 + (top  - pixels);
       height1  = scrollUp ? (a < 0 ? 0 : a) :(b < maxHeight1 ? b : maxHeight1);
       }
       top = pixels;
      });
     });
    WidgetsBinding.instance.addPostFrameCallback((_){
      final box = headerKey.currentContext!.findRenderObject() as RenderBox;
      final box1 = headersKey.currentContext!.findRenderObject() as RenderBox;
      setState(() {
        height = box.size.height;
        maxHeight = box.size.height;
         height1 = box1.size.height;
        maxHeight1 = box1.size.height;
        start = false;
      }); 
      print('-------------------- ${ box.size.height}');
    });
    sizeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation = Tween(begin:  1.0 , end:  0.0 )
        .animate(CurvedAnimation(parent: sizeController!, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child:  CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        // 使用 SliverPersistentHeader 创建一个可滚动的头部
        
        if(start)
        SliverToBoxAdapter(child: Column(
          children: [
             Container(
              height: 100,
              key: headerKey,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                'SliverPersistentHeader',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
             Container(
              height: 200,
              key: headersKey,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                'SliverPersistentHeader',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ))
            else 
            SliverPersistentHeader(
          pinned: true, // 是否在滚动时固定在顶部
          delegate: MySliverPersistentHeaderDelegate(
            minHeight: mode ? height : height1, // 最小高度
            maxHeight: mode ? maxHeight : maxHeight1, // 最大高度
            child: 
            Container(           
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                'SliverPersistentHeader',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),)
           
          
        ),
        // 其他 Sliver 组件
       SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 100,
              ),
            ),
      ],
    )),
    TextButton(onPressed: (){
      setState(() {
        mode = !mode;

        // if(mode){
        //   height = maxHeight;
        // }else {
        //   height1 = maxHeight1;
        // }
      });
    }, child: Text('='))
      ],
    );
  }
}
class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  MySliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(MySliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}