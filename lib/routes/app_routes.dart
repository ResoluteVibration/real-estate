import 'package:flutter/material.dart';

// --- Auth + Splash ---
import '../Views/splash/splash_screen.dart';
import '../views/authentication/welcome_screen.dart';
import '../views/authentication/login_screen.dart';
import '../views/authentication/register_screen.dart';
import '../views/authentication/forgot_password_screen.dart';
import '../views/authentication/reset_password_screen.dart';

// --- Onboarding + Home ---
import '../Views/onboarding/onboarding_screen.dart';
import '../views/home/home_screen.dart';

// --- Search & Categories ---
import '../Views/search/search_screen.dart';
import '../Views/search/search_filter_screen.dart';
import '../Views/search/map_view_screen.dart';
import '../Views/categories/categories_screen.dart';

// --- Property ---
import '../Views/property/property_detail_screen.dart';
import '../Views/property/image_gallery_screen.dart';
import '../Views/property/similar_properties_screen.dart';
import '../Views/property/virtual_tour_screen.dart';
import '../Views/property/schedule_visit_screen.dart';

// --- User Actions ---
import '../Views/user_actions/contact_form_screen.dart';
import '../Views/user_actions/favourites_screen.dart';
import '../Views/user_actions/post_property_screen.dart';
import '../Views/user_actions/my_listing_screen.dart';
import '../Views/user_actions/my_visit_screen.dart';

// --- Profile ---
import '../Views/profile/profile_screen.dart';
import '../Views/profile/settings_screen.dart';
import '../Views/profile/notification_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';

  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';

  static const String home = '/home';
  static const String search = '/search';
  static const String searchFilters = '/search-filters';
  static const String mapView = '/map-view';
  static const String categories = '/categories';

  static const String propertyDetail = '/property-detail';
  static const String imageGallery = '/image-gallery';
  static const String similarProperties = '/similar-properties';
  static const String virtualTour = '/virtual-tour';
  static const String scheduleVisit = '/schedule-visit';

  static const String contactForm = '/contact';
  static const String favorites = '/favorites';
  static const String postProperty = '/post-property';
  static const String myListings = '/my-listings';
  static const String myVisits = '/my-visits';

  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String notifications = '/notifications';

  static const String priceTrends = '/price-trends';
  static const String localityReviews = '/locality-reviews';

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    onboarding: (_) => const OnboardingScreen(),

    welcome: (_) => const WelcomeScreen(),
    login: (_) => const LoginScreen(),
    register: (_) => const RegisterScreen(),
    forgotPassword: (_) => const ForgotPasswordScreen(),
    resetPassword: (_) => const ResetPasswordScreen(),

    //home: (_) => const HomeScreen(),
    search: (_) => const SearchScreen(),
    searchFilters: (_) => const SearchFilterScreen(),
    mapView: (_) => const MapViewScreen(),
    categories: (_) => const CategoriesScreen(),

    propertyDetail: (_) => const PropertyDetailScreen(),
    imageGallery: (_) => const ImageGalleryScreen(),
    similarProperties: (_) => const SimilarPropertiesScreen(),
    virtualTour: (_) => const VirtualTourScreen(),
    scheduleVisit: (_) => const ScheduleVisitScreen(),

    contactForm: (_) => const ContactFormScreen(),
    favorites: (_) => const FavouritesScreen(),
    postProperty: (_) => const PostPropertyScreen(),
    myListings: (_) => const MyListingScreen(),
    myVisits: (_) => const MyVisitScreen(),

    profile: (_) => const ProfileScreen(),
    settings: (_) => const SettingsScreen(),
    notifications: (_) => const NotificationScreen(),
/**
    priceTrends: (_) => const PriceTrendsScreen(),
    localityReviews: (_) => const LocalityReviewsScreen(),
 **/
  };
}
