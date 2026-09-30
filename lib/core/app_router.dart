import 'package:go_router/go_router.dart';
import '../features/products/presentation/pages/cart_screen.dart';
import '../features/products/presentation/pages/home_screen.dart';
import '../features/products/presentation/pages/product_details_screen.dart';
import '../features/products/presentation/pages/products_list_screen.dart';
import '../features/products/presentation/pages/profile_screen.dart';
import '../features/products/presentation/pages/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) => const ProductsListScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '1';
        return ProductDetailsScreen(productId: id);
      },
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
);
