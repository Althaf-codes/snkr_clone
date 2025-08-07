import 'package:go_router/go_router.dart';
import 'package:snkr_app/app_entry_screen.dart';
import 'package:snkr_app/common/screens/categorywise_product_screen.dart';
import 'package:snkr_app/screens/calender/calender_screen.dart';
import 'package:snkr_app/screens/cart/cart_screen.dart';
import 'package:snkr_app/screens/home/home_screen.dart';
import 'package:snkr_app/screens/profile/profile_screen.dart';
import 'package:snkr_app/screens/shop/shop_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        // Persistent Bottom Navigation Shell
        builder: (context, state, child) {
          return AppEntryScreen(child: child);
        },
        routes: [
          // Main navigation routes with bottom nav items
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
              path: '/shop',
              builder: (context, state) => const ShopScreen(),
              routes: [
                GoRoute(
                    path:
                        '/category', //'/category/:id (for getting list of subCategories and their products based on url)
                    builder: (context, state) {
                      // final String categoryId =
                      //     state.pathParameters["id"] ?? "";
                      return CategorywiseProductsScreen(
                          title: state.uri.queryParameters["title"] ??
                              "New Arrivals");
                    })
              ]),
          GoRoute(
            path: '/calendar',
            builder: (context, state) => const CalenderScreen(),
          ),
          GoRoute(
            path: '/cart',
            builder: (context, state) => const CartScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),

      // Global ProductDetailScreen route

      // GoRoute(
      //   path: '/product/:id',
      //   builder: (context, state) {
      //     final productId = state.pathParameters['id'];
      //     return ProductDetailScreen(
      //       productId: int.parse(productId!),
      //       // product: Product.emptyProduct,
      //       // similarProducts: [],
      //     );
      //   },
      // ),

      // GoRoute(
      //   path: '/filter',
      //   builder: (context, state) {
      //     return const FilterScreen();
      //   },
      // ),
    ],
  );
}
