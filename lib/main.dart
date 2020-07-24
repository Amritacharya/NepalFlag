import 'package:flutter/material.dart';
import 'dart:math';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Outer white container with padding
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
          // Inner yellow container
          child: Container(
            // pass double.infinity to prevent shrinking of the painter area to 0.
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(painter: FaceOutlinePainter()),
          ),
        ),
      ),
    );
  }
}

class FaceOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red;

    var path2 = Path();
    path2.lineTo(0, 0);
    path2.lineTo(size.width, size.height * 2 / 4);
    path2.lineTo(size.width * 2 / 6, size.height * 2 / 4);

    path2.lineTo(size.width * 2 * 0.5, size.height * 2 * 0.5);
    path2.lineTo(0, size.height * 2 * 0.5);
    path2.close();

    canvas.drawPath(path2, paint2);
    // Define a paint object
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0
      ..color = Colors.indigo;

    var center = Offset(size.width * 2 / 7, size.height * 2 / 6);
    var radius = size.width * 0.15;
    final smilePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 0, pi,
        false, smilePaint);
    final smilePaint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red;
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width * 2 / 7, size.height * 2 / 7.5),
            radius: radius + radius * 0.5),
        0,
        pi,
        false,
        smilePaint2);
//     canvas.drawCircle(Offset(size.width*2 /9 ,
//           size.height*2 * 0.4 ),size.width*2*0.05,smilePaint);
    double startRadian = pi / 2;

    final sweepRadian = 2 * pi / 12;

    var featureOffset = Offset(size.width * 2 / 7, size.height * 2 * 0.4);
    var featureOffset1 = Offset(size.width * 2 / 7, size.height * 2 / 5.65);
    var radius2 = size.width * 0.08;
    var path6 = Path();

    path6.moveTo(featureOffset1.dx, featureOffset1.dy);
    for (int i = 0; i < 13; i++) {
      var xAngle = cos(startRadian + sweepRadian / 2);
      var yAngle = sin(startRadian + sweepRadian / 2);

      var labelYOffset = yAngle < 0 ? (sin(pi / 3)) : (sin(pi / 3));
      var labelXOffset = xAngle < 0 ? (cos(pi / 3)) : (cos(pi / 3));

      path6.lineTo(featureOffset1.dx + radius2 * 0.75 * cos(startRadian),
          featureOffset1.dy + radius2 * 0.75 * sin(startRadian));
      path6.lineTo(featureOffset1.dx + radius2 * xAngle + labelXOffset,
          featureOffset1.dy + radius2 * yAngle + labelYOffset);
      path6.lineTo(
          featureOffset1.dx + radius2 * 0.75 * cos(startRadian + sweepRadian),
          featureOffset1.dy + radius2 * 0.75 * sin(startRadian + sweepRadian));

      startRadian += sweepRadian;
    }

    path6.close();
    canvas.drawPath(path6, smilePaint);

    var path5 = Path();

    path5.moveTo(featureOffset.dx, featureOffset.dy);
    for (int i = 0; i < 13; i++) {
      var xAngle = cos(startRadian + sweepRadian / 2);
      var yAngle = sin(startRadian + sweepRadian / 2);

      var labelYOffset = yAngle < 0 ? (sin(pi / 3)) : (sin(pi / 3));
      var labelXOffset = xAngle < 0 ? (cos(pi / 3)) : (cos(pi / 3));

      path5.lineTo(featureOffset.dx + radius * 0.7 * cos(startRadian),
          featureOffset.dy + radius * 0.7 * sin(startRadian));
      path5.lineTo(featureOffset.dx + radius * 1.1 * xAngle + labelXOffset,
          featureOffset.dy + radius * 1.1 * yAngle + labelYOffset);
      path5.lineTo(
          featureOffset.dx + radius * 0.7 * cos(startRadian + sweepRadian),
          featureOffset.dy + radius * 0.7 * sin(startRadian + sweepRadian));

      startRadian += sweepRadian;
    }

    path5.close();
    canvas.drawPath(path5, smilePaint);
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, size.height * 2 / 4);
    path.lineTo(size.width * 2 / 6, size.height * 2 / 4);

    path.lineTo(size.width * 2 / 2, size.height * 2 * 0.5);
    path.lineTo(0, size.height * 2 * 0.5);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(FaceOutlinePainter oldDelegate) => false;
}
