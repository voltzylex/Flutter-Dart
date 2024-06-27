import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:state_management/dio/presentation/pages/dio_page.dart';
import 'package:state_management/riverpod/screens/home/home_screen.dart';
import 'package:state_management/video_upload/presentation/pages/upload_video.dart';

import 'clean_arcitecture/config/router/app_router.dart';
import 'clean_arcitecture/core/database/local_database.dart';
import 'clean_arcitecture/core/network/dio_client.dart';
import 'clean_arcitecture/core/theme/app_theme.dart';
import 'clean_arcitecture/core/theme/cubit/theme_cubit.dart';
import 'clean_arcitecture/data/datasources/local/movie/movie_local_data_source.dart';
import 'clean_arcitecture/data/datasources/local/movie/movie_local_data_source_impl.dart';
import 'clean_arcitecture/data/datasources/remote/actor/actor_remote_data_source.dart';
import 'clean_arcitecture/data/datasources/remote/actor/actor_remote_data_source_impl.dart';
import 'clean_arcitecture/data/datasources/remote/movie/movie_remote_data_source.dart';
import 'clean_arcitecture/data/datasources/remote/movie/movie_remote_data_source_impl.dart';
import 'clean_arcitecture/data/repositories/actor/actor_repository_impl.dart';
import 'clean_arcitecture/data/repositories/movie/movie_repository_impl.dart';
import 'clean_arcitecture/domain/repositories/actor/actor_repository.dart';
import 'clean_arcitecture/domain/repositories/movie/movie_repository.dart';
import 'clean_arcitecture/domain/usecases/actor/actor_usecases.dart';
import 'clean_arcitecture/domain/usecases/movie/movie_usecases.dart';
import 'clean_arcitecture/presentation/cubit/actor/get_actor_detail/get_actor_detail_cubit.dart';
import 'clean_arcitecture/presentation/cubit/actor/get_actor_social_media/get_actor_social_media_cubit.dart';
import 'clean_arcitecture/presentation/cubit/movie/get_movie_credits/get_movie_credits_cubit.dart';
import 'clean_arcitecture/presentation/cubit/movie/get_popular_movies/get_popular_movies_cubit.dart';
import 'clean_arcitecture/presentation/cubit/movie/get_saved_movies/get_saved_movies_cubit.dart';
import 'clean_arcitecture/presentation/cubit/movie/get_top_rated_movies/get_top_rated_movies_cubit.dart';
import 'clean_arcitecture/presentation/cubit/movie/toggle_bookmark/toggle_bookmark_cubit.dart';

part './clean_arcitecture/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await injector<LocalDatabase>().initialize();

  final directory = await getApplicationDocumentsDirectory();

  HydratedBloc.storage =
      await HydratedStorage.build(storageDirectory: directory);

  /// without provider scope it will not work
  runApp(const ProviderScope(child: MyApp()));
}

final router = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => injector<ThemeCubit>()),
        BlocProvider<GetMovieCreditsCubit>(
            create: (context) => injector<GetMovieCreditsCubit>()),
        BlocProvider<GetSavedMoviesCubit>(
            create: (context) =>
                injector<GetSavedMoviesCubit>()..getSavedMovieDetails()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp.router(
                themeMode: themeState.themeMode,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                routerDelegate: AutoRouterDelegate(router),
                routeInformationParser: router.defaultRouteParser(),
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
      // child: MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   title: 'State Management Demo',
      //   theme: ThemeData(
      //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //     useMaterial3: true,
      //   ),
      //   home: const MainPage(),
      // ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RiverpodHomeScreen(),
                    )),
                child: const Text("Riverpod")),
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.purple[50],
            onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const DioPage(),
                )),
            child: const Text("Dio"),
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.purple[50],
            onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const UploadVideo(),
                )),
            child: const Text("Upload Video"),
          )
        ],
      ),
    );
  }

  final car = Car();
}

class Car {
  Car._();
  factory Car() => Car._();

  int? price;

  set setprice(int nprice) => price = nprice;

  get newPrice => price;
}
