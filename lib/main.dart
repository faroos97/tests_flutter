/*import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compatibilité Multiplateforme',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compatibilité Multiplateforme'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Test de Compatibilité Multiplateforme',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Flutter est exécuté ici!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
*/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
import 'package:flutter/material.dart';
import 'notification_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationTest(),
    );
  }
}
*/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*
import 'package:flutter/material.dart';
import 'chart_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Graphiques',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChartTest(),
    );
  }
}
*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Performance Test',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PerformanceTestPage(),
    );
  }
}

class PerformanceTestPage extends StatefulWidget {
  const PerformanceTestPage({super.key});

  @override
  _PerformanceTestPageState createState() => _PerformanceTestPageState();
}

class _PerformanceTestPageState extends State<PerformanceTestPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  late final Animation<Color?> _backgroundColorAnimation;
  bool _showFirstGraph = true;
  final Stopwatch _stopwatch = Stopwatch();
  double _fps = 0;
  bool _loadingComplete = false;

  @override
  void initState() {
    super.initState();

    // Setup animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    _backgroundColorAnimation = ColorTween(
      begin: Colors.blue[100],
      end: Colors.pink[100],
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start measuring FPS
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startFpsCounter();
    });

    // Measure loading time after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _stopwatch.stop();
        _loadingComplete = true;
        setState(() {}); // Call setState only after the frame is rendered
      }
    });

    // Start stopwatch for loading time
    _stopwatch.start();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startFpsCounter() {
    final window = WidgetsBinding.instance.window;
    window.onReportTimings = (List<ui.FrameTiming> timings) {
      if (timings.isNotEmpty && mounted) {
        setState(() {
          _fps = 1.0 / (timings.last.totalSpan.inMilliseconds / 1000.0);
        });
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test de Performance Flutter'),
      ),
      body: AnimatedBuilder(
        animation: _backgroundColorAnimation,
        builder: (context, child) {
          return Container(
            color: _backgroundColorAnimation.value,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Temps de chargement : ${_loadingComplete ? '${_stopwatch.elapsedMilliseconds} ms' : 'Chargement...'}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'FPS (Frames Per Second) : ${_fps.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Animation de widgets',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _animation.value * 2 * pi,
                        child: child,
                      );
                    },
                    child: const Icon(Icons.refresh, size: 50, color: Colors.blue),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Graphique animé',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showFirstGraph = !_showFirstGraph;
                      });
                    },
                    child: AnimatedCrossFade(
                      duration: const Duration(seconds: 1),
                      firstChild: CustomPaint(
                        size: const Size(300, 200),
                        painter: GraphPainter(progress: _animation.value),
                      ),
                      secondChild: CustomPaint(
                        size: const Size(300, 200),
                        painter: SecondGraphPainter(progress: _animation.value),
                      ),
                      crossFadeState: _showFirstGraph
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Appuyez sur le graphique pour le changer',
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class GraphPainter extends CustomPainter {
  final double progress;

  GraphPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();
    for (double x = 0; x <= size.width; x++) {
      final y = size.height / 2 +
          50 * sin((x / size.width) * 2 * pi + progress * 2 * pi);
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SecondGraphPainter extends CustomPainter {
  final double progress;

  SecondGraphPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();
    for (double x = 0; x <= size.width; x++) {
      final y = size.height / 2 +
          50 * cos((x / size.width) * 2 * pi + progress * 2 * pi);
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
*/
