import 'package:auto_scrolllist_flutter/data/movie_data.dart';
import 'package:flutter/material.dart';

import '../component/movie_list_component.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController1=ScrollController();
  ScrollController scrollController2=ScrollController();
  ScrollController scrollController3=ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtend1=scrollController1.position.minScrollExtent;
      double maxScrollExtend1=scrollController1.position.maxScrollExtent;
      double minScrollExtend2=scrollController2.position.minScrollExtent;
      double maxScrollExtend2=scrollController2.position.maxScrollExtent;
      double minScrollExtend3=scrollController3.position.minScrollExtent;
      double maxScrollExtend3=scrollController3.position.maxScrollExtent;
      animateToMaxMin(maxScrollExtend1,minScrollExtend1,minScrollExtend1,5,scrollController1);
      animateToMaxMin(maxScrollExtend2,minScrollExtend2,minScrollExtend2,10,scrollController2);
      animateToMaxMin(maxScrollExtend3,minScrollExtend3,minScrollExtend3,7,scrollController3);
    });

  }
  animateToMaxMin(double max, double min,double direction,int second,ScrollController controller){
    controller.animateTo(direction, duration: Duration(seconds:second ), curve: Curves.linear).then((value) {
      direction=direction==max?min:max;
      animateToMaxMin(max,min,direction,second,controller);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MovieListComponent(controller: scrollController1, movielist: movieList1,),
            MovieListComponent(controller: scrollController2, movielist: movieList2,),
            MovieListComponent(controller: scrollController3, movielist: movieList3,),

          ],
        ),
      ),

    );
  }
}
