import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:streetwyze/app/app.dart';
import 'package:streetwyze/app/app_widget.dart';
import 'package:streetwyze/helpers/custom_trace.dart';


Future<void>  main() async{
   WidgetsFlutterBinding.ensureInitialized();
    await GlobalConfiguration().loadFromAsset("configurations");
    print(CustomTrace(StackTrace.current, message: "api_base_url: ${GlobalConfiguration().getString('api_base_url')}")); 
     App().run(runApp);
}



