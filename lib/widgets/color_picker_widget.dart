import 'dart:math';

import 'package:flutter/material.dart';
//
// class _SliderIndicatorPainter extends CustomPainter {
//   final double position;
//
//   _SliderIndicatorPainter(this.position);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     canvas.drawCircle(
//       Offset(size.width / 2, position),
//       12,
//       Paint()..color = Colors.black,
//     );
//   }
//
//   @override
//   bool shouldRepaint(_SliderIndicatorPainter old) => true;
// }
//
// class ColorPicker extends StatefulWidget {
//   final double height;
//   final ValueChanged<Color> onColorChanged;
//
//   const ColorPicker({
//     super.key,
//     required this.height,
//     required this.onColorChanged,
//   });
//
//   @override
//   _ColorPickerState createState() => _ColorPickerState();
// }
//
// class _ColorPickerState extends State<ColorPicker> {
//   final List<Color> _colors = [
//     Color.fromARGB(255, 255, 0, 0),
//     Color.fromARGB(255, 255, 128, 0),
//     Color.fromARGB(255, 255, 255, 0),
//     Color.fromARGB(255, 128, 255, 0),
//     Color.fromARGB(255, 0, 255, 0),
//     Color.fromARGB(255, 0, 255, 128),
//     Color.fromARGB(255, 0, 255, 255),
//     Color.fromARGB(255, 0, 128, 255),
//     Color.fromARGB(255, 0, 0, 255),
//     Color.fromARGB(255, 127, 0, 255),
//     Color.fromARGB(255, 255, 0, 255),
//     Color.fromARGB(255, 255, 0, 127),
//     Color.fromARGB(255, 128, 128, 128),
//   ];
//
//   double _colorSliderPosition = 0;
//   double _opacitySliderPosition = 0;
//   late Color _currentColor;
//
//   @override
//   void initState() {
//     super.initState();
//     _currentColor = _colors.first; // Starts fully opaque
//     _opacitySliderPosition = widget.height; // Start fully opaque (bottom)
//   }
//
//   void _colorChangeHandler(double position) {
//     if (position > widget.height) position = widget.height;
//     if (position < 0) position = 0;
//     setState(() {
//       _colorSliderPosition = position;
//       _currentColor = _calculateSelectedColor(_colorSliderPosition);
//       _updateColorWithOpacity();
//     });
//   }
//
//   void _opacityChangeHandler(double position) {
//     if (position > widget.height) position = widget.height;
//     if (position < 0) position = 0;
//     setState(() {
//       _opacitySliderPosition = position;
//       _updateColorWithOpacity();
//     });
//   }
//
//   Color _calculateSelectedColor(double position) {
//     double positionInColorArray = (position / widget.height * (_colors.length - 1));
//     int index = positionInColorArray.truncate();
//     return _colors[index];
//   }
//
//   void _updateColorWithOpacity() {
//     int alpha = (255 * (_opacitySliderPosition / widget.height)).round();
//     _currentColor = Color.fromARGB(
//       alpha,
//       _currentColor.red,
//       _currentColor.green,
//       _currentColor.blue,
//     );
//     widget.onColorChanged(_currentColor);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Create dynamic opacity gradient based on selected color
//     final opacityGradient = LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [
//         Color.fromARGB(0, _currentColor.red, _currentColor.green, _currentColor.blue),
//         Color.fromARGB(255, _currentColor.red, _currentColor.green, _currentColor.blue),
//       ],
//     );
//
//     return Row(
//       children: [
//         // Color Slider
//         GestureDetector(
//           behavior: HitTestBehavior.opaque,
//           onVerticalDragUpdate: (details) => _colorChangeHandler(details.localPosition.dy),
//           onTapDown: (details) => _colorChangeHandler(details.localPosition.dy),
//           child: Container(
//             width: 30,
//             height: widget.height,
//             decoration: BoxDecoration(
//               border: Border.all(width: 2, color: Colors.grey[800]!),
//               borderRadius: BorderRadius.circular(15),
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: _colors,
//               ),
//             ),
//             child: CustomPaint(
//               painter: _SliderIndicatorPainter(_colorSliderPosition),
//             ),
//           ),
//         ),
//         const SizedBox(width: 10),
//         // Opacity Slider with dynamic gradient
//         GestureDetector(
//           behavior: HitTestBehavior.opaque,
//           onVerticalDragUpdate: (details) => _opacityChangeHandler(details.localPosition.dy),
//           onTapDown: (details) => _opacityChangeHandler(details.localPosition.dy),
//           child: Container(
//             width: 30,
//             height: widget.height,
//             decoration: BoxDecoration(
//               border: Border.all(width: 2, color: Colors.grey[800]!),
//               borderRadius: BorderRadius.circular(15),
//               gradient: opacityGradient, // Use dynamic gradient
//             ),
//             child: CustomPaint(
//               painter: _SliderIndicatorPainter(_opacitySliderPosition),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }



class ColorPicker extends StatefulWidget {
  final double height;
  final ValueChanged<Color> onColorChanged;
  final Color? currentColor; // Added to sync with HomeScreen's _selectedColor

  const ColorPicker({
    super.key,
    required this.height,
    required this.onColorChanged,
    this.currentColor,
  });

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final List<Color> _colors = [
    Color.fromARGB(255, 255, 0, 0),
    Color.fromARGB(255, 255, 128, 0),
    Color.fromARGB(255, 255, 255, 0),
    Color.fromARGB(255, 128, 255, 0),
    Color.fromARGB(255, 0, 255, 0),
    Color.fromARGB(255, 0, 255, 128),
    Color.fromARGB(255, 0, 255, 255),
    Color.fromARGB(255, 0, 128, 255),
    Color.fromARGB(255, 0, 0, 255),
    Color.fromARGB(255, 127, 0, 255),
    Color.fromARGB(255, 255, 0, 255),
    Color.fromARGB(255, 255, 0, 127),
    Color.fromARGB(255, 128, 128, 128),
  ];

  double _colorSliderPosition = 0;
  double _opacitySliderPosition = 0;
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.currentColor ?? _colors.first;
    _opacitySliderPosition = widget.currentColor != null
        ? widget.height * (widget.currentColor!.alpha / 255.0)
        : widget.height; // Full opacity if null
    if (widget.currentColor != null) {
      _setColor(widget.currentColor!);
    }
  }

  @override
  void didUpdateWidget(ColorPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentColor != oldWidget.currentColor) {
      if (widget.currentColor != null) {
        _setColor(widget.currentColor!);
      } else {
        setState(() {
          _currentColor = _colors.first;
          _colorSliderPosition = 0;
          _opacitySliderPosition = 0; // No tint
        });
      }
    }
  }

  void _setColor(Color color) {
    double minDiff = double.infinity;
    double bestPosition = 0;
    for (double p = 0; p <= widget.height; p += 1) {
      Color c = _calculateSelectedColor(p);
      double diff = sqrt(pow(c.red - color.red, 2) +
          pow(c.green - color.green, 2) +
          pow(c.blue - color.blue, 2));
      if (diff < minDiff) {
        minDiff = diff;
        bestPosition = p;
      }
    }
    setState(() {
      _colorSliderPosition = bestPosition;
      _opacitySliderPosition = widget.height * (color.alpha / 255.0);
      _currentColor = color;
    });
  }

  void _colorChangeHandler(double position) {
    if (position > widget.height) position = widget.height;
    if (position < 0) position = 0;
    setState(() {
      _colorSliderPosition = position;
      _currentColor = _calculateSelectedColor(_colorSliderPosition);
      _updateColorWithOpacity();
    });
  }

  void _opacityChangeHandler(double position) {
    if (position > widget.height) position = widget.height;
    if (position < 0) position = 0;
    setState(() {
      _opacitySliderPosition = position;
      _updateColorWithOpacity();
    });
  }

  Color _calculateSelectedColor(double position) {
    double positionInColorArray = (position / widget.height * (_colors.length - 1));
    int index = positionInColorArray.truncate();
    return _colors[index];
  }

  void _updateColorWithOpacity() {
    int alpha = (255 * (_opacitySliderPosition / widget.height)).round();
    _currentColor = Color.fromARGB(
      alpha,
      _currentColor.red,
      _currentColor.green,
      _currentColor.blue,
    );
    widget.onColorChanged(_currentColor);
  }

  @override
  Widget build(BuildContext context) {
    final opacityGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(0, _currentColor.red, _currentColor.green, _currentColor.blue),
        Color.fromARGB(255, _currentColor.red, _currentColor.green, _currentColor.blue),
      ],
    );

    return Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onVerticalDragUpdate: (details) => _colorChangeHandler(details.localPosition.dy),
          onTapDown: (details) => _colorChangeHandler(details.localPosition.dy),
          child: Container(
            width: 30,
            height: widget.height,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey[800]!),
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: _colors,
              ),
            ),
            child: CustomPaint(
              painter: _SliderIndicatorPainter(_colorSliderPosition),
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onVerticalDragUpdate: (details) => _opacityChangeHandler(details.localPosition.dy),
          onTapDown: (details) => _opacityChangeHandler(details.localPosition.dy),
          child: Container(
            width: 30,
            height: widget.height,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey[800]!),
              borderRadius: BorderRadius.circular(15),
              gradient: opacityGradient,
            ),
            child: CustomPaint(
              painter: _SliderIndicatorPainter(_opacitySliderPosition),
            ),
          ),
        ),
      ],
    );
  }
}

class _SliderIndicatorPainter extends CustomPainter {
  final double position;

  _SliderIndicatorPainter(this.position);

  @override
  void paint(Canvas canvas, Size size) {
    // Draw a white border around the knob
    Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Draw the main knob color
    Paint fillPaint = Paint()
      ..color = Colors.black;

    // Draw the border first
    canvas.drawCircle(
      Offset(size.width / 2, position),
      10.0,
      borderPaint,
    );

    // Draw the fill on top
    canvas.drawCircle(
      Offset(size.width / 2, position),
      8.0,
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(_SliderIndicatorPainter old) => true;
}