// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../model/Onboard_model.dart';
import '../../login/view/Login_page.dart';

class OnBoardScreen extends StatefulWidget {
  OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: _buildPageViewController(context)),
          ],
        ),
      ),
    );
  }

  PageView _buildPageViewController(BuildContext context) {
    return PageView.builder(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: models.length,
        itemBuilder: (_, i) {
          return _buildMainText(i, context);
        });
  }

  Column _buildMainText(int i, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Image.asset(models[i].image),
          //width: double.infinity,
          //height: 420.5,
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            color: Color.fromARGB(255, 228, 203, 203),
          ),
          padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           // mainAxisSize: MainAxisSize.max,
            children: [
              _navigationItemsRow(),
              SizedBox(
                width: double.infinity,
                height: context.dynamicHeight(0.02),
              ),
              Text(
                models[i].title,
                textAlign: TextAlign.center,
                style: context.textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.appTheme.primaryColor),
              ),
              SizedBox(
                height: context.dynamicHeight(0.02),
              ),
              FittedBox(            
                fit: BoxFit.fill,
                child: Text(models[i].description,
                    style: context.textTheme.bodyText2?.copyWith(
                      color: context.appTheme.primaryColor.withOpacity(0.6),
                    )),
              ),
              SizedBox(
                height: context.dynamicHeight(0.08),
              ),
              _buttonPageNavigiton(context)
            ],
          ),
        ),
        //const Spacer()
      ],
    );
  }

  Row _buttonPageNavigiton(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 189, 185, 172)),
          onPressed: () {
            if (currentIndex == models.length - 1) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginPage()));
            }
            _controller?.nextPage(
                duration: context.durationNormal, curve: Curves.easeIn);
          },
          child: const Text('skip')),
      SizedBox(
        width: context.dynamicHeight(0.009),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(primary: context.appTheme.primaryColor),
        onPressed: () {
          if (currentIndex == models.length - 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => LoginPage()));
          }
          _controller?.nextPage(
              duration: context.durationNormal, curve: Curves.bounceIn);
        },
        child: const Text('Next'),
      ),
    ]);
  }

  Row _navigationItemsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(models.length, (index) => _buildItemsPage(index)),
    );
  }

  Container _buildItemsPage(int index) {
    return Container(
      height: context.dynamicHeight(0.015),
      width: 10,
      margin: const EdgeInsets.only(right: 3),
      decoration: BoxDecoration(
          color: currentIndex == index
              ? const Color.fromARGB(255, 240, 217, 14)
              : Theme.of(context).primaryColor,
          border: Border.all(color: context.appTheme.primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }
}
