import 'package:band_scheduler/ui/common_availability/common_availability_screen.dart';
import 'package:band_scheduler/ui/login/login_screen.dart';
import 'package:band_scheduler/ui/practices/practices_screen.dart';
import 'package:band_scheduler/ui/schedule_input/schedule_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

@TypedGoRoute<RootRoute>(path: '/')
class RootRoute extends GoRouteData with $RootRoute {
  const RootRoute();

  @override
  String? redirect(BuildContext context, GoRouterState state) =>
      const AvailabilityRoute().location;
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginScreen();
}

@TypedGoRoute<AvailabilityRoute>(path: '/availability')
class AvailabilityRoute extends GoRouteData with $AvailabilityRoute {
  const AvailabilityRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CommonAvailabilityScreen();
}

@TypedGoRoute<InputRoute>(path: '/input')
class InputRoute extends GoRouteData with $InputRoute {
  const InputRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ScheduleInputScreen();
}

@TypedGoRoute<PracticesRoute>(path: '/practices')
class PracticesRoute extends GoRouteData with $PracticesRoute {
  const PracticesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PracticesScreen();
}

GoRouter createRouter() {
  return GoRouter(
    initialLocation: const AvailabilityRoute().location,
    routes: $appRoutes,
  );
}
