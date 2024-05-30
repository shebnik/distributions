@JS()
library jstat.js;

import 'package:js/js.dart';

@JS('jStat.centralF.inv')
external double centralFInv(double p, int df1, int df2);

@JS('jStat.studentt.inv')
external double studenttInv(double p, int df);
