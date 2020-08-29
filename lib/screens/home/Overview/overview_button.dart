import 'package:flutter/material.dart';
import 'package:fit_app/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OverViewButton extends StatelessWidget {
  final String text, percentText;
  final Function press;
  final String image;
  final double percent;

  const OverViewButton({
    Key key,
    this.text,
    this.percent,
    this.percentText,
    this.press,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _textWidth = (MediaQuery.of(context).size.width) / 3;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: GestureDetector(
        onTap: press,
        child: Container(
          //width: size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor, //kPrimaryLightColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 10),
              Container(
                width: _textWidth,
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              new CircularPercentIndicator(
                radius: 154.0,
                lineWidth: 10.0,
                percent: percent,
                center: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fitHeight,
//                                colorFilter: new ColorFilter.mode(
//                                    Colors.black.withOpacity(0.6),
//                                    BlendMode.dstATop),
                                image: AssetImage(image),
                              ),
                            ),
                          ),
                          Text(
                            percentText,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                        alignment: Alignment.bottomCenter,
                        width: 100,
                        height: 100,
                      ),
                    ]),
                progressColor: kPrimaryColor,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
