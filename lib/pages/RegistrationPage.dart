import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:genus/config/Assets.dart';
import 'package:genus/config/Palette.dart';
import 'package:genus/config/Styles.dart';
import 'package:genus/config/Transitions.dart';
import 'package:genus/widgets/CircleIndicator.dart';
import 'package:genus/widgets/NumberPicker.dart';
import 'package:genus/pages/ConversationPageSlide.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {

  int currentPage = 0;
  int age = 18;
  var isKeyboardOpen = false;
  
  // Navigate back n forth between pages
  PageController pageController = PageController();
  
  Alignment begin = Alignment.center;
  Alignment end = Alignment.bottomRight;
  
  AnimationController usernameFieldAnimationController;
  Animation profilePicHeightAnimation, usernameAnimation, ageAnimation;
  FocusNode usernameFocusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    usernameFieldAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    profilePicHeightAnimation = Tween(begin: 100.0, end: 0.0).animate(usernameFieldAnimationController)..addListener((){
      setState(() {

      });
    });
    usernameAnimation = Tween(begin: 50.0, end: 10.0).animate(usernameFieldAnimationController)..addListener((){
      setState(() {

      });
    });
    ageAnimation = Tween(begin: 80.0, end: 10.0).animate(usernameFieldAnimationController)..addListener((){
      setState(() {

      });
    });
    usernameFocusNode.addListener(() {
      usernameFocusNode.hasFocus ? usernameFieldAnimationController.forward() : usernameFieldAnimationController.reverse();
    });
    pageController.addListener(() {
      setState(() {
        begin = Alignment(pageController.page, pageController.page);
        end = Alignment(1 - pageController.page, 1-pageController.page);
      });
    });

    super.initState();
  }

  buildPageOne() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 250),
            child: Image.asset(Assets.logo, height: 100,),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              'Genus Messenger',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: ButtonTheme(
              height: 40,
              child: RaisedButton.icon(
                onPressed: () => updatePageState(1),
                elevation: 0,
                color: Colors.transparent,
                icon: Image.asset(Assets.googleLogo, height: 25,),
                label: Text(
                  'Sign In with Google',
                  style: TextStyle(
                    color: Palette.primaryTextColorLight,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  buildPageTwo() {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: profilePicHeightAnimation.value,),
            Container(
              child: CircleAvatar(
                backgroundImage: Image.asset(Assets.user).image,
                radius: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.camera,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      'Set Profile Picture',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              )
            ),
            SizedBox(
              height: ageAnimation.value,
            ),
            Text(
              'How old are you?',
              style: Styles.questionLight,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[NumberPicker.horizontal(
               initialValue: age,
               minValue: 15,
               maxValue: 100,
               onChanged: (num value) {
                 setState(() {
                   age = value;
                 });
               }
              ),
                Text('Years', style: Styles.textLight,)
              ],
            ),
            SizedBox(
              height: usernameAnimation.value,
            ),
            Container(
              child: Text(
                'Choose a Usename',
                style: Styles.questionLight,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 120,
              child: TextField(
                textAlign: TextAlign.center,
                style: Styles.subHeadingLight,
                focusNode: usernameFocusNode,
                decoration: InputDecoration(
                  hintText: '@username',
                  hintStyle: Styles.hintTextLight,
                  contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.primaryColor, width: 0.1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.primaryColor, width: 0.1),
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }

  updatePageState(index) {
    if (index == 1)
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear
      );

    setState(() {
      currentPage = index;
    });
  }

  Future<bool> onWillPop() {
    if(currentPage == 1) {
      // go to page 1 if currentPage is 2
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    usernameFieldAnimationController.dispose();
    usernameFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final value = MediaQuery.of(context).viewInsets.bottom;
    if(value > 0) {
      if(isKeyboardOpen) {
        onKeyboardChanged(false);
      }
      isKeyboardOpen = false;
    } else {
      isKeyboardOpen = true;
      onKeyboardChanged(true);
    }
  }

  onKeyboardChanged(bool visible) {
    if(!visible) {
      FocusScope.of(context).requestFocus(FocusNode());
      usernameFieldAnimationController.reverse();
    }
  }

  navigateToHome() {
    Navigator.push(
      context,
      SlideLeftRoute(page: ConversationPageSlide()),
    );
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: begin, end: end, colors: [
                Palette.gradientStartColor,
                Palette.gradientEndColor
              ])
            ),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(milliseconds: 1500),
                  child: PageView(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (int page) => updatePageState(page),
                    children: <Widget>[
                      buildPageOne(),
                      buildPageTwo(),
                    ],
                  )
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i< 2; i++)
                        CircleIndicator(i == currentPage),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: currentPage == 1 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    margin: EdgeInsets.only(right: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        FloatingActionButton(
                          onPressed: () => navigateToHome(),
                          elevation:  0,
                          backgroundColor: Palette.primaryColor,
                          child: Icon(
                            Icons.done,
                            color: Palette.accentColor,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
