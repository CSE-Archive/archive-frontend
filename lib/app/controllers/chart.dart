import 'package:cse_archive/app/models/course.dart';
import 'package:get/get.dart';

class ChartController extends GetxController
    with StateMixin<List<List<CourseModel>>> {
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    final literature = CourseModel(
      id: 1,
      name: "فارسی عمومی",
      type: CourseType.general,
      units: 3,
      requisites: {},
      slug: '',
    );

    final english = CourseModel(
      id: 2,
      name: "انگلیسی عمومی معافی",
      type: CourseType.general,
      units: 3,
      requisites: {},
      slug: '',
    );

    final physics1 = CourseModel(
      id: 3,
      name: "فیزیک یک",
      type: CourseType.basic,
      units: 3,
      requisites: {},
      slug: '',
    );

    final fop = CourseModel(
      id: 7,
      name: "مبانی کامپیوتر و برنامه‌نویسی",
      type: CourseType.specialized,
      units: 3,
      requisites: {},
      slug: '',
    );

    final computerLab = CourseModel(
      id: 4,
      name: "آز کامپیوتر",
      type: CourseType.specialized,
      units: 1,
      requisites: {
        fop: RequisiteType.co,
      },
      slug: '',
    );

    final math1 = CourseModel(
      id: 5,
      name: "ریاضیات عمومی یک",
      type: CourseType.basic,
      units: 3,
      requisites: {},
      slug: '',
    );

    final discrete = CourseModel(
      id: 6,
      name: "ساختمان گسسته",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        math1: RequisiteType.co,
        fop: RequisiteType.co,
      },
      slug: '',
    );

// Term 2

    final exercise1 = CourseModel(
      id: 8,
      name: "تربیت بدنی یک",
      type: CourseType.general,
      units: 1,
      requisites: {},
      slug: '',
    );

    final expertEnglish = CourseModel(
      id: 9,
      name: "انگلیسی تخصصی",
      type: CourseType.specialized,
      units: 2,
      requisites: {
        english: RequisiteType.pre,
      },
      slug: '',
    );

    final physics2 = CourseModel(
      id: 10,
      name: "فیزیک دو",
      type: CourseType.basic,
      units: 3,
      requisites: {
        physics1: RequisiteType.co,
        math1: RequisiteType.pre,
      },
      slug: '',
    );

    final diff = CourseModel(
      id: 11,
      name: "معادلات دیفرانسیل",
      type: CourseType.basic,
      units: 3,
      requisites: {
        math1: RequisiteType.pre,
      },
      slug: '',
    );

    final math2 = CourseModel(
      id: 12,
      name: "ریاضیات عمومی دو",
      type: CourseType.basic,
      units: 3,
      requisites: {
        math1: RequisiteType.pre,
      },
      slug: '',
    );

    final logic = CourseModel(
      id: 13,
      name: "مدارهای منطقی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        discrete: RequisiteType.co,
      },
      slug: '',
    );

    final pop = CourseModel(
      id: 14,
      name: "اصول برنامه‌سازی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        fop: RequisiteType.pre,
      },
      slug: '',
    );

// Term 3

    final general = CourseModel(
      id: 15,
      name: "عمومی",
      type: CourseType.general,
      units: 2,
      requisites: {},
      slug: '',
    );

    final elc = CourseModel(
      id: 16,
      name: "مدارهای الکتریکی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        diff: RequisiteType.pre,
      },
      slug: '',
    );

    final em = CourseModel(
      id: 17,
      name: "ریاضی مهندسی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        diff: RequisiteType.pre,
        math2: RequisiteType.pre,
      },
      slug: '',
    );

    final statistics = CourseModel(
      id: 18,
      name: "آمار و احتمال مهندسی",
      type: CourseType.basic,
      units: 3,
      requisites: {
        math2: RequisiteType.pre,
      },
      slug: '',
    );

    final logicLab = CourseModel(
      id: 19,
      name: "آز مدارهای منطقی",
      type: CourseType.specialized,
      units: 1,
      requisites: {
        logic: RequisiteType.pre,
      },
      slug: '',
    );

    final assembly = CourseModel(
      id: 20,
      name: "زبان ماشین و برنامه‌سازی سیستم",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        pop: RequisiteType.pre,
      },
      slug: '',
    );

    final ap = CourseModel(
      id: 21,
      name: "برنامه‌سازی پیشرفته",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        discrete: RequisiteType.pre,
        pop: RequisiteType.pre,
      },
      slug: '',
    );

// Term 4

    final elctro = CourseModel(
      id: 22,
      name: "مدارهای الکترونیکی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        elc: RequisiteType.pre,
      },
      slug: '',
    );

    final nc = CourseModel(
      id: 23,
      name: "روش‌های محاسبات عددی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        diff: RequisiteType.co,
      },
      slug: '',
    );

    final ca = CourseModel(
      id: 24,
      name: "معماری کامپیوتر",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        assembly: RequisiteType.pre,
        logic: RequisiteType.pre,
      },
      slug: '',
    );

    final ds = CourseModel(
      id: 25,
      name: "ساختمان داده‌ها و الگوریتم‌ها",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        ap: RequisiteType.pre,
      },
      slug: '',
    );

    final lanTheory = CourseModel(
      id: 26,
      name: "نظریه زبان‌ها و ماشین",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        pop: RequisiteType.pre,
      },
      slug: '',
    );

// Term 5

    final pm = CourseModel(
      id: 27,
      name: "شیوه ارائه مطالب علمی و فنی",
      type: CourseType.specialized,
      units: 2,
      requisites: {
        expertEnglish: RequisiteType.pre,
      },
      slug: '',
    );

    final signal = CourseModel(
      id: 28,
      name: "سیگنال‌ها و سیستم‌ها",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        em: RequisiteType.pre,
      },
      slug: '',
    );

    final os = CourseModel(
      id: 29,
      name: "اصول طراحی سیستم‌های عامل",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        ca: RequisiteType.pre,
      },
      slug: '',
    );

    final caLab = CourseModel(
      id: 30,
      name: "آز معماری کامپیوتر",
      type: CourseType.specialized,
      units: 1,
      requisites: {
        ca: RequisiteType.pre,
      },
      slug: '',
    );

    final optional = CourseModel(
      id: 31,
      name: "اختیاری",
      type: CourseType.optional,
      units: 3,
      requisites: {},
      slug: '',
    );

    final algorithms = CourseModel(
      id: 32,
      name: "طراحی و تحلیل الگوریتم‌ها",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        ds: RequisiteType.pre,
      },
      slug: '',
    );

// Term 6

    final dataTransfer = CourseModel(
      id: 33,
      name: "انتقال داده‌ها",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        statistics: RequisiteType.pre,
        signal: RequisiteType.pre,
      },
      slug: '',
    );

    final osLab = CourseModel(
      id: 34,
      name: "آز سیستم‌های عامل",
      type: CourseType.specialized,
      units: 1,
      requisites: {
        os: RequisiteType.pre,
      },
      slug: '',
    );

    final micro = CourseModel(
      id: 35,
      name: "ریزپردازنده",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        ca: RequisiteType.pre,
      },
      slug: '',
    );

    final db = CourseModel(
      id: 36,
      name: "اصول طراحی پایگاه داده‌ها",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        ds: RequisiteType.pre,
      },
      slug: '',
    );

    final ai = CourseModel(
      id: 37,
      name: "هوش مصنوعی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        algorithms: RequisiteType.co,
      },
      slug: '',
    );

// Term 7

    final exercise2 = CourseModel(
      id: 38,
      name: "تربیت بدنی دو",
      type: CourseType.general,
      units: 1,
      requisites: {exercise1: RequisiteType.pre},
      slug: '',
    );

    final network = CourseModel(
      id: 39,
      name: "شبکه‌های کامپیوتری",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        os: RequisiteType.pre,
        dataTransfer: RequisiteType.pre,
      },
      slug: '',
    );

    final fpga = CourseModel(
      id: 40,
      name: "طراحی کامپیوتری سیستم‌های دیجیتال",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        ca: RequisiteType.pre,
      },
      slug: '',
    );

    final microLab = CourseModel(
      id: 41,
      name: "آز ریزپردازنده",
      type: CourseType.specialized,
      units: 1,
      requisites: {
        micro: RequisiteType.pre,
      },
      slug: '',
    );

    final software = CourseModel(
      id: 42,
      name: "تحلیل و طراحی سیستم‌ها",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        db: RequisiteType.co,
      },
      slug: '',
    );

    final compiler = CourseModel(
      id: 43,
      name: "اصول طراحی کامپایلرها",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        lanTheory: RequisiteType.pre,
      },
      slug: '',
    );

// Term 8

    final internship = CourseModel(
      id: 44,
      name: "کارآموزی",
      type: CourseType.specialized,
      units: 2,
      requisites: {
        pm: RequisiteType.pre,
      },
      slug: '',
    );

    final project = CourseModel(
      id: 45,
      name: "پروژه کارشناسی",
      type: CourseType.specialized,
      units: 3,
      requisites: {
        pm: RequisiteType.pre,
      },
      slug: '',
    );

    final networkLab = CourseModel(
      id: 46,
      name: "آز شبکه‌های کامپیوتری",
      type: CourseType.specialized,
      units: 1,
      requisites: {
        network: RequisiteType.pre,
      },
      slug: '',
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
