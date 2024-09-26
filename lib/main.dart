import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'data/models/table_model/day_table_model.dart';
import 'data/models/table_model/day_table_model_adapter.dart';
import 'data/models/task_model/task_model.dart';
import 'data/models/task_model/task_model_adapter.dart';
import 'data/observer/add_task_observer.dart';
import 'generated/l10n.dart';
import 'utils/constant.dart';
import 'utils/my_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(DayTableModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  Bloc.observer = AddTaskObserver();

  await Hive.openBox<DayTableModel>(tableBoxName);
  await Hive.openBox<TaskModel>(taskboxName);
  await Hive.openBox(secondBoxName);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          textTheme: const TextTheme(),
          dataTableTheme: const DataTableThemeData(
            headingTextStyle: TextStyle(fontSize: 16, color: Colors.white),
            // headingRowColor: WidgetStatePropertyAll(Colors)
          )),
      onGenerateRoute: Routes().myRoutes,
      initialRoute: homeView,
    );
  }
}


//* body medium  => all noraml text,  [table]

//* title medium => values of [dropdownButton]

//* body large  => texts in [textFormField] 


// titleSmall: TextStyle(color: Colors.white),
                // titleMedium: TextStyle(color: Colors.white),
                // titleLarge: TextStyle(color: Colors.white),
                // labelSmall: TextStyle(color: Colors.white),
                // labelMedium: TextStyle(color: Colors.white),
                // labelLarge: TextStyle(color: Colors.white),
                // headlineSmall: TextStyle(color: Colors.white),
                // headlineMedium: TextStyle(color: Colors.white),
                // headlineLarge: TextStyle(color: Colors.white),
                // displaySmall: TextStyle(color: Colors.white),
                // displayMedium: TextStyle(color: Colors.white),
                // displayLarge: TextStyle(color: Colors.white),
                // bodySmall: TextStyle(color: Colors.white),
                // bodyMedium: TextStyle(color: Colors.white),
                // bodyLarge: TextStyle(color: Colors.white),