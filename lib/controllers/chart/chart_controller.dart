import 'package:cse_archive/models/chart_course_model.dart';
import 'package:get/get.dart';

class ChartController extends GetxController
    with StateMixin<List<List<ChartCourseModel>>> {
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    final literature = ChartCourseModel(
      id: "1",
      name: "فارسی عمومی",
      type: CourseType.general,
      units: 3,
      requisites: {},
    );

    final english = ChartCourseModel(
      id: "2",
      name: "انگلیسی عمومی معافی",
      type: CourseType.general,
      units: 3,
      requisites: {},
    );

    final physics1 = ChartCourseModel(
      id: "3",
      name: "فیزیک یک",
      type: CourseType.basic,
      units: 3,
      requisites: {},
    );

    final fop = ChartCourseModel(
      id: "7",
      name: "مبانی کامپیوتر و برنامه‌نویسی",
      type: CourseType.specialized,
      units: 3,
      requisites: {},
    );

    final computerLab = ChartCourseModel(
      id: "4",
      name: "آز کامپیوتر",
      type: CourseType.specialized,
      units: 1,
      requisites: {
        fop: RequisiteType.co,
      },
    );

    final math1 = ChartCourseModel(
      id: "5",
      name: "ریاضیات عمومی یک",
      type: CourseType.basic,
      units: 3,
      requisites: {},
    );

    final discrete = ChartCourseModel(
      id: "6",
      name: "ساختمان گسسته",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        math1: RequisiteType.co,
        fop: RequisiteType.co,
      },
    );

// Term 2

    final exercise1 = ChartCourseModel(
      id: "8",
      name: "تربیت بدنی یک",
      type: CourseType.general,
      units: 1,
      requisites: {},
    );

    final expertEnglish = ChartCourseModel(
      id: "9",
      name: "انگلیسی تخصصی",
      type: CourseType.specialized,
      units: 2,
      requisites: {
        english: RequisiteType.pre,
      },
    );

    final physics2 = ChartCourseModel(
      id: "10",
      name: "فیزیک دو",
      type: CourseType.basic,
      units: 3,
      requisites: {
        physics1: RequisiteType.co,
        math1: RequisiteType.pre,
      },
    );

    final diff = ChartCourseModel(
      id: "11",
      name: "معادلات دیفرانسیل",
      type: CourseType.basic,
      units: 3,
      requisites: {
        math1: RequisiteType.pre,
      },
    );

    final math2 = ChartCourseModel(
      id: "12",
      name: "ریاضیات عمومی دو",
      type: CourseType.basic,
      units: 3,
      requisites: {
        math1: RequisiteType.pre,
      },
    );

    final logic = ChartCourseModel(
      id: "13",
      name: "مدارهای منطقی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        discrete: RequisiteType.co,
      },
    );

    final pop = ChartCourseModel(
      id: "14",
      name: "اصول برنامه‌سازی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        fop: RequisiteType.pre,
      },
    );

// Term 3

    final general = ChartCourseModel(
      id: "15",
      name: "عمومی",
      type: CourseType.general,
      units: 2,
      requisites: {},
      doesOpenNewTab: false,
    );

    final elc = ChartCourseModel(
      id: "16",
      name: "مدارهای الکتریکی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        diff: RequisiteType.pre,
      },
    );

    final em = ChartCourseModel(
      id: "17",
      name: "ریاضی مهندسی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        diff: RequisiteType.pre,
        math2: RequisiteType.pre,
      },
    );

    final statistics = ChartCourseModel(
      id: "18",
      name: "آمار و احتمال مهندسی",
      type: CourseType.basic,
      units: 3,
      requisites: {
        math2: RequisiteType.pre,
      },
    );

    final logicLab = ChartCourseModel(
      id: "19",
      name: "آز مدارهای منطقی",
      type: CourseType.specialized,
      units: 1,
      requisites: {
        logic: RequisiteType.pre,
      },
    );

    final assembly = ChartCourseModel(
      id: "20",
      name: "زبان ماشین و برنامه‌سازی سیستم",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        pop: RequisiteType.pre,
      },
    );

    final ap = ChartCourseModel(
      id: "21",
      name: "برنامه‌سازی پیشرفته",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        discrete: RequisiteType.pre,
        pop: RequisiteType.pre,
      },
    );

// Term 4

    final elctro = ChartCourseModel(
      id: "22",
      name: "مدارهای الکترونیکی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        elc: RequisiteType.pre,
      },
    );

    final nc = ChartCourseModel(
      id: "23",
      name: "روش‌های محاسبات عددی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        diff: RequisiteType.co,
      },
    );

    final ca = ChartCourseModel(
      id: "24",
      name: "معماری کامپیوتر",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        assembly: RequisiteType.pre,
        logic: RequisiteType.pre,
      },
    );

    final ds = ChartCourseModel(
      id: "25",
      name: "ساختمان داده‌ها و الگوریتم‌ها",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        ap: RequisiteType.pre,
      },
    );

    final lanTheory = ChartCourseModel(
      id: "26",
      name: "نظریه زبان‌ها و ماشین",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        pop: RequisiteType.pre,
      },
    );

// Term 5

    final pm = ChartCourseModel(
      id: "27",
      name: "شیوه ارائه مطالب علمی و فنی",
      type: CourseType.specialized,
      units: 2,
      requisites: {
        expertEnglish: RequisiteType.pre,
      },
    );

    final signal = ChartCourseModel(
      id: "28",
      name: "سیگنال‌ها و سیستم‌ها",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        em: RequisiteType.pre,
      },
    );

    final os = ChartCourseModel(
      id: "29",
      name: "اصول طراحی سیستم‌های عامل",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        ca: RequisiteType.pre,
      },
    );

    final caLab = ChartCourseModel(
      id: "30",
      name: "آز معماری کامپیوتر",
      type: CourseType.specialized,
      units: 1,
      requisites: {
        ca: RequisiteType.pre,
      },
    );

    final optional = ChartCourseModel(
      id: "31",
      name: "اختیاری",
      type: CourseType.optional,
      units: 3,
      requisites: {},
      doesOpenNewTab: false,
    );

    final algorithms = ChartCourseModel(
      id: "32",
      name: "طراحی و تحلیل الگوریتم‌ها",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        ds: RequisiteType.pre,
      },
    );

// Term 6

    final dataTransfer = ChartCourseModel(
      id: "33",
      name: "انتقال داده‌ها",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        statistics: RequisiteType.pre,
        signal: RequisiteType.pre,
      },
    );

    final osLab = ChartCourseModel(
      id: "34",
      name: "آز سیستم‌های عامل",
      type: CourseType.specialized,
      units: 1,
      requisites: {
        os: RequisiteType.pre,
      },
    );

    final micro = ChartCourseModel(
      id: "35",
      name: "ریزپردازنده",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        ca: RequisiteType.pre,
      },
    );

    final db = ChartCourseModel(
      id: "36",
      name: "اصول طراحی پایگاه داده‌ها",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        ds: RequisiteType.pre,
      },
    );

    final ai = ChartCourseModel(
      id: "37",
      name: "هوش مصنوعی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        algorithms: RequisiteType.co,
      },
    );

// Term 7

    final exercise2 = ChartCourseModel(
      id: "38",
      name: "تربیت بدنی دو",
      type: CourseType.general,
      units: 1,
      requisites: {exercise1: RequisiteType.pre},
    );

    final network = ChartCourseModel(
      id: "39",
      name: "شبکه‌های کامپیوتری",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        os: RequisiteType.pre,
        dataTransfer: RequisiteType.pre,
      },
    );

    final fpga = ChartCourseModel(
      id: "40",
      name: "طراحی کامپیوتری سیستم‌های دیجیتال",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        ca: RequisiteType.pre,
      },
    );

    final microLab = ChartCourseModel(
      id: "41",
      name: "آز ریزپردازنده",
      type: CourseType.specialized,
      units: 1,
      requisites: {
        micro: RequisiteType.pre,
      },
    );

    final software = ChartCourseModel(
      id: "42",
      name: "تحلیل و طراحی سیستم‌ها",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        db: RequisiteType.co,
      },
    );

    final compiler = ChartCourseModel(
      id: "43",
      name: "اصول طراحی کامپایلرها",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        lanTheory: RequisiteType.pre,
      },
    );

// Term 8

    final internship = ChartCourseModel(
      id: "44",
      name: "کارآموزی",
      type: CourseType.specialized,
      units: 2,
      requisites: {
        pm: RequisiteType.pre,
      },
    );

    final project = ChartCourseModel(
      id: "45",
      name: "پروژه کارشناسی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        pm: RequisiteType.pre,
      },
    );

    final networkLab = ChartCourseModel(
      id: "46",
      name: "آز شبکه‌های کامپیوتری",
      type: CourseType.specialized,
      units: 1,
      requisites: {
        network: RequisiteType.pre,
      },
    );

    final result = [
      [
        literature,
        english,
        physics1,
        computerLab,
        math1,
        discrete,
        fop,
      ],
      [
        exercise1,
        expertEnglish,
        physics2,
        diff,
        math2,
        logic,
        pop,
      ],
      [
        general,
        elc,
        em,
        statistics,
        logicLab,
        assembly,
        ap,
      ],
      [
        general,
        elctro,
        nc,
        ca,
        ds,
        lanTheory,
      ],
      [
        general,
        pm,
        signal,
        os,
        caLab,
        optional,
        algorithms,
      ],
      [
        general,
        optional,
        dataTransfer,
        osLab,
        micro,
        db,
        ai,
      ],
      [
        exercise2,
        general,
        network,
        fpga,
        microLab,
        software,
        compiler,
      ],
      [
        general,
        internship,
        project,
        networkLab,
        optional,
        optional,
        optional,
      ],
    ];

    change(result, status: RxStatus.success());
  }
}
