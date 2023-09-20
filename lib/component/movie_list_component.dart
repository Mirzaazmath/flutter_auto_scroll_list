import 'package:flutter/material.dart';
class MovieListComponent extends StatelessWidget {
  final ScrollController controller;
  final List<String> movielist;
  const MovieListComponent({super.key,required this.controller,required this.movielist});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(top: 14),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
            shrinkWrap: true,
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: movielist.length,
            itemBuilder: (context,index){
              return Container(
                height: 100,
                width: 120,
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(movielist[index]),fit: BoxFit.cover,
                    )
                ),
              );
            }),
      ),
    );
  }
}
