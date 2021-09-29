import 'package:yobi/src/routes/yobi_route_base.dart';
import 'package:yobi/src/views/charts/charts_frame.dart';

class ChartsRoute extends YobiRouteBase {
  static String routePath = '/charts';

  ChartsRoute()
      : super(child: ChartsView(), routePath: ChartsRoute.routePath);
}
