import 'dart:io';
import 'package:flutter/material.dart';

class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  List<SliderModel> mySlide = [];
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySlide = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: [
            Flexible(
              flex: 9,
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(
                    () {
                      slideIndex = index;
                    },
                  );
                },
                children: <Widget>[
                  SlideTile(
                    title: mySlide[0].getTitle(),
                    desc: mySlide[0].getDesc(),
                  ),
                  SlideTile(
                    title: mySlide[1].getTitle(),
                    desc: mySlide[1].getDesc(),
                  ),
                  SlideTile(
                    title: mySlide[2].getTitle(),
                    desc: mySlide[2].getDesc(),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 3; i++)
                      i == slideIndex
                          ? _buildPageIndicator(true)
                          : _buildPageIndicator(false),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomSheet: Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              slideIndex != 1
                  ? SizedBox.shrink()
                  : FlatButton(
                      onPressed: () {
                        controller.animateToPage(
                          slideIndex - 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      },
                      splashColor: Colors.blue[50],
                      child: Text(
                        "PREVIOUS",
                        style: TextStyle(
                            color: Color(0xFF0074E4),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
              FlatButton(
                onPressed: () {
                  print("this is slideIndex: $slideIndex");
                  controller.animateToPage(
                    slideIndex + 1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                },
                splashColor: Colors.blue[50],
                child: Text(
                  slideIndex != 2 ? "NEXT" : "START",
                  style: TextStyle(
                      color: Color(0xFF0074E4), fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String title, desc;

  SlideTile({
    this.title,
    this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Image.asset(imagePath),
          SizedBox(
            height: 40,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          )
        ],
      ),
    );
  }
}

class SliderModel {
  String title;
  String desc;

  SliderModel({
    this.title,
    this.desc,
  });

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = SliderModel();

  //1
  sliderModel.setTitle("Inbox");
  sliderModel.setDesc("Discover Discount and more");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setTitle("Rewards");
  sliderModel.setDesc("Get Rewarded on every purchase");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setTitle("Insight");
  sliderModel.setDesc("See all your shopping spends & insight");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  return slides;
}
