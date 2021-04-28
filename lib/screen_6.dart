import 'package:flutter/material.dart';

class SixthScreen extends StatefulWidget {
  const SixthScreen({
    Key ? key
  }): super(key: key);

  @override
  _SixthScreenState createState() => _SixthScreenState();
}

class _SixthScreenState extends State < SixthScreen > {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome!', style: Theme.of(context).textTheme.headline2),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State < SignUpForm > {
  final _serverTextController = TextEditingController();
  final _serverIPTextController = TextEditingController();
  final _userIDTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  double _formProgress = 0;

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed('/welcome');
  }

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _serverTextController,
      _serverIPTextController,
      _userIDTextController,
      _passwordTextController
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedProgressIndicator(value: _formProgress),
          Text('Login', style: Theme
            .of(context)
            .textTheme
            .headline4),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _serverTextController,
              decoration: InputDecoration(hintText: 'Server'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _serverIPTextController,
              decoration: InputDecoration(hintText: 'Server IP/URL'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _userIDTextController,
              decoration: InputDecoration(hintText: 'User ID'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordTextController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith((Set < MaterialState > states) {
                  return states.contains(MaterialState.disabled) ? null : Colors.white;
                }),
                backgroundColor: MaterialStateProperty.resolveWith((Set < MaterialState > states) {
                  return states.contains(MaterialState.disabled) ? null : Color.fromRGBO(95, 147, 194, 1);
                }),
              ),
              onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedProgressIndicator extends StatefulWidget {
  final double value;

  AnimatedProgressIndicator({
    required this.value,
  });

  @override
  State < StatefulWidget > createState() {
    return _AnimatedProgressIndicatorState();
  }
}

class _AnimatedProgressIndicatorState extends State < AnimatedProgressIndicator >
  with SingleTickerProviderStateMixin {
    late AnimationController _controller;
    late Animation < Color ? > _colorAnimation;
    late Animation < double > _curveAnimation;

    void initState() {
      super.initState();
      _controller = AnimationController(
        duration: Duration(milliseconds: 1200), vsync: this);

      final colorTween = TweenSequence([
        TweenSequenceItem(
          tween: ColorTween(begin: Colors.red, end: Colors.orange),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: ColorTween(begin: Colors.orange, end: Colors.yellow),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: ColorTween(begin: Colors.yellow, end: Colors.green),
          weight: 1,
        ),
      ]);

      _colorAnimation = _controller.drive(colorTween);
      _curveAnimation = _controller.drive(CurveTween(curve: Curves.easeIn));
    }

    @override
    void didUpdateWidget(oldWidget) {
      super.didUpdateWidget(oldWidget);
      _controller.animateTo(widget.value);
    }

    @override
    Widget build(BuildContext context) {
      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => LinearProgressIndicator(
          value: _curveAnimation.value,
          valueColor: _colorAnimation,
          backgroundColor: _colorAnimation.value?.withOpacity(0.4),
        ),
      );
    }
  }