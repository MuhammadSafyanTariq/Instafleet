import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'splash_screen.dart';
import 'welcome_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';
import 'social_feed_screen.dart';
import 'explore_screen.dart';
import 'notifications_screen.dart';
import 'camera_screen.dart';
import 'story_viewer_screen.dart';
import 'messages_screen.dart';
import 'groups_screen.dart';
import 'create_community_screen.dart';
import 'community_detail_screen.dart';
import 'community_members_screen.dart';
import 'chat_screen.dart';
import 'profile_screen.dart';
import 'change_avatar_screen.dart';
import 'settings_screen.dart';
import 'privacy_screen.dart';
import 'app_preference_screen.dart';
import 'help_support_screen.dart';
import 'my_ads_screen.dart';
import 'create_add_screen.dart';
import 'edit_profile_screen.dart';
import 'contest_screen.dart';
import 'widgets/main_navigation_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreenWrapper(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot': (context) => const ForgotPasswordScreen(),
        '/home': (context) => const MainNavigationWrapper(initialIndex: 0),
        '/explore': (context) => const MainNavigationWrapper(initialIndex: 1),
        '/notifications': (context) => const NotificationsScreen(),
        '/camera': (context) => const CameraScreen(),
        '/story': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return StoryViewerScreen(
            userName: args['userName']!,
            userImage: args['userImage']!,
            storyImage: args['storyImage']!,
          );
        },
        '/groups': (context) => const GroupsScreen(),
        '/create_community': (context) => const CreateCommunityScreen(),
        '/community_detail': (context) => const CommunityDetailScreen(),
        '/community_members': (context) => const CommunityMembersScreen(),
        '/chat': (context) => const ChatScreen(),
        '/profile': (context) => const MainNavigationWrapper(initialIndex: 3),
        '/change-avatar': (context) => const ChangeAvatarScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/privacy': (context) => const PrivacyScreen(),
        '/app-preference': (context) => const AppPreferenceScreen(),
        '/help-support': (context) => const HelpSupportScreen(),
        '/my-ads': (context) => const MyAdsScreen(),
        '/create-add': (context) => const CreateAddScreen(),
        '/edit-profile': (context) => const EditProfileScreen(),
        '/contest': (context) => const ContestScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
// alkdfj;lakds

// hello



// test