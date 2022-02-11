import 'package:animation/pages/animated_container_page.dart';
import 'package:animation/pages/animated_opacity_page.dart';
import 'package:animation/pages/tween_animation_builder_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


enum AnimationExample {
  animatedContainer,
  animatedOpacity,
  tweenAnimationBuilder,
}

extension on AnimationExample{
  String capitalizeFirstLetter() {
    final name = describeEnum(this);
    return name.replaceRange(0, 1, name.characters.first.toUpperCase());
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Animation Playground"),
          centerTitle: true,
        ),
        body: AnimationExampleList(),
      ),
      onGenerateRoute: (settings) {
        switch(settings.name) {
          case 'animatedContainer':
            return MaterialPageRoute(builder: (_) => AnimatedContainerPage());

          case "animatedOpacity":
            return MaterialPageRoute(builder: (_) => AnimatedOpacityPage());

          case 'tweenAnimationBuilder':
            return MaterialPageRoute(builder: (_) => TweenAnimationBuilderPage());

          default:
            throw UnimplementedError('Route ${settings.name} not found');
        }
      }
    );
  }
}

class AnimationExampleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final example = AnimationExample.values[index];
        final routerName = describeEnum(example);
        return ListTile(
          title: Text(example.capitalizeFirstLetter()),
          trailing: Icon(Icons.chevron_right),
          onTap: () => Navigator.of(context).pushNamed(routerName),
        );
      },
      itemCount: AnimationExample.values.length,
    );
  }
}








