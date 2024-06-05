import 'dart:ui'; // Importing Dart UI library
import 'dart:js' as js; // Importing Dart JavaScript library with alias 'js'
import 'package:flutter/material.dart'; // Importing Flutter material design package
import 'package:flutter_bloc/flutter_bloc.dart'; // Importing Flutter BLoC package
import 'package:go_router/go_router.dart'; // Importing GoRouter package
import 'package:hive_flutter/hive_flutter.dart';
import 'package:squadsyncweb/bussiness/entity/user.dart';
import 'package:squadsyncweb/bussiness/repository/login_repository.dart'; // Importing login repository
import 'package:squadsyncweb/bussiness/usecase/login_usecase.dart'; // Importing login use case
import 'package:squadsyncweb/common/data.dart';
import 'package:squadsyncweb/data/data_source/login_data_source.dart'; // Importing login data source
import 'package:squadsyncweb/presentation/bloc/create_org_admin_bloc/create_organization_bloc.dart'; // Importing create organization admin BLoC
import 'package:squadsyncweb/presentation/bloc/create_organization_bloc/create_organization_bloc.dart'; // Importing create organization BLoC
import 'package:squadsyncweb/presentation/bloc/home_dash_board_copy_bloc/home_dash_board_copy_bloc.dart'; // Importing home dashboard copy BLoC
import 'package:squadsyncweb/presentation/bloc/login_bloc/login_bloc.dart'; // Importing login BLoC
import 'package:squadsyncweb/presentation/pages/add_organization.dart'; // Importing add organization page
import 'package:squadsyncweb/presentation/pages/add_organization_admin.dart'; // Importing add organization admin page
import 'package:squadsyncweb/presentation/pages/change_password.dart'; // Importing change password page
import 'package:squadsyncweb/presentation/pages/create_organisation.dart'; // Importing create organization page
import 'package:squadsyncweb/presentation/pages/create_organisation_admin.dart'; // Importing create organization admin page
import 'package:squadsyncweb/presentation/pages/edit_profile.dart'; // Importing edit profile page
import 'package:squadsyncweb/presentation/pages/home_dashboard_copy.dart'; // Importing home dashboard copy page
import 'package:squadsyncweb/presentation/pages/login_page.dart'; // Importing login page
import 'package:squadsyncweb/presentation/pages/selected_module_for_organization.dart'; // Importing selected module for organization page
import 'package:url_strategy/url_strategy.dart';

// Function to show splash screen
// void showSplashScreen() {
//   js.context.callMethod(
//       'showSplashScreen'); // Call JavaScript method to show splash screen
// }

// Define the GoRouter with initial location and routes
final GoRouter _router = GoRouter(
  initialLocation: '/', // Set initial location to '/'
  redirect: (context, state) {
    // showSplashScreen(); // Show splash screen on redirect
    return null; // Return null to stay in the current state
  },
  errorBuilder: (context, state) {
    return const Scaffold(
      body: Center(
        child: Text("Error Page"),
      ), // Display error page text
    );
  },
  routes: <RouteBase>[
    GoRoute(
        path: '/', // Define root path
        builder: (BuildContext context, GoRouterState state) {
          return const Scaffold(
            body: Center(
              child: Text("Start Page"),
            ), // Display start page text
          );
        },
        routes: [
          GoRoute(
            path: 'login', // Define org-admin path
            name: 'OrgAdmin',
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider(
                create: (context) => LoginBloc(
                  useCase: LoginUseCase(
                    repository: LoginRepository(
                      dataSource: LoginDataSource(),
                    ),
                  ),
                ),
                child: const LoginPage(
                  isOrg: true, // Set isOrg to true for org-admin
                ),
              );
            },
          ),
          GoRoute(
            path: 'super-admin', // Define super-admin path
            name: 'SuperAdmin',
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider(
                create: (context) => LoginBloc(
                  useCase: LoginUseCase(
                    repository: LoginRepository(
                      dataSource: LoginDataSource(),
                    ),
                  ),
                ),
                child: const LoginPage(
                  isOrg: false, // Set isOrg to false for super-admin
                ),
              );
            },
          ),
          GoRoute(
            path: 'homepage', // Define homepage path
            name: 'HomePage',
            builder: (context, state) {
              return BlocProvider(
                create: (context) =>
                    HomeDashBoardCopyBloc(), // Provide HomeDashBoardCopyBloc
                child:
                    const HomeDashboardCopy(), // Display home dashboard copy page
              );
            },
          ),
          GoRoute(
            path: 'add-org-admin', // Define add-org-admin path
            name: 'AddOrgAdmin',
            builder: (context, state) {
              return const AddOrganizationAdmin(); // Display add organization admin page
            },
          ),
          GoRoute(
            path: 'create-org-admin', // Define create-org-admin path
            name: 'CreateOrgAdmin',
            builder: (context, state) {
              return BlocProvider(
                create: (context) =>
                    CreateOrgAdminBloc(), // Provide CreateOrgAdminBloc
                child:
                    const CreateORGANIZATIONAdmin(), // Display create organization admin page
              );
            },
          ),
          GoRoute(
            path: 'change-password', // Define change-password path
            name: 'ChangePassword',
            builder: (context, state) {
              return const ChangePassword(); // Display change password page
            },
          ),
          GoRoute(
            path: 'add-new-organization', // Define add-new-organization path
            name: 'AddNewOrganization',
            builder: (context, state) {
              return BlocProvider(
                create: (context) =>
                    CreateOrganizationBloc(), // Provide CreateOrganizationBloc
                child:
                    const Createorganization(), // Display create organization page
              );
            },
          ),
          GoRoute(
            path: 'add-organization', // Define add-organization path
            name: 'AddOrganization',
            builder: (context, state) {
              return const AddOrganization(); // Display add organization page
            },
          ),
          GoRoute(
            path: 'edit-profile', // Define edit-profile path
            name: 'EditProfile',
            builder: (context, state) {
              return const EditProfile(); // Display edit profile page
            },
          ),
          GoRoute(
            path: 'module-selection', // Define module-selection path
            name: 'ModuleSelection',
            builder: (context, state) {
              return const SelectedModuleForOrganization(); // Display selected module for organization page
            },
          ),
        ])
  ],
);

// Main entry point
void main(List<String> args) async {
  setPathUrlStrategy();
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter binding is initialized
  await Hive.initFlutter(); // Initialize Hive
  Hive.registerAdapter(UserTokenAdapter());
  userTokenBox = await Hive.openBox('userTokenBox');

  runApp(MaterialApp.router(
    scrollBehavior: const MaterialScrollBehavior().copyWith(
      dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown
      },
    ),
    routerConfig: _router, // Set router configuration
    debugShowCheckedModeBanner: false, // Disable debug banner
    theme: ThemeData(fontFamily: 'Enixe'), // Set theme with custom font
  ));
}
