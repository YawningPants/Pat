//主页上的轮播图
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pat/app/utils/font.dart';

class Carousel extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Container(
        padding: EdgeInsets.all(10),
        height: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Swiper(
            autoplay: true,
            autoplayDelay: 5000,
            duration: 700,
            curve: Curves.easeInOut,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child:  Image.asset("assets/images/carousel${index+1}.jpg",fit: BoxFit.cover)
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black54,
                            ],
                          ),
                        ),
                        child: Text(
                          "商品图${index+1}",
                          style: FontUtil.normalTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ]
              );
            },
            pagination: SwiperPagination(
              alignment: Alignment.bottomRight,
              builder: DotSwiperPaginationBuilder(
                size: 5,
                color: Colors.white24,
                activeSize: 7,
              ),
            ),
          ),
        ),
      ),
    );
  }

}