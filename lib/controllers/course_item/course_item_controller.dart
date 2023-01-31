import 'package:cse_archive/models/course_item_model.dart';
import 'package:cse_archive/models/general.dart';
import 'package:cse_archive/models/reference_model.dart';
import 'package:get/get.dart';

class CourseItemController extends GetxController
    with StateMixin<CourseItemModel> {
  CourseItemController({
    required this.courseId,
  });

  final int courseId;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    var result = CourseItemModel(
      id: courseId,
      slug: 'Design-&-Implementation-of-Programming-Languages',
      name: 'طراحی و پياده‌سازی زبان‌های برنامه‌سازی',
      nameEn: 'Design & Implementation of Programming Languages',
      description:
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.',
      type: CourseType.optional,
      units: 3,
      references: [
        ReferenceModel(
          id: 1,
          title: 'Introduction to Algorithms, 4rd Edition',
          authors: [
            'Thomas H. Cormen',
            'Charles E. Leiserson',
            'Ronald L. Rivest',
            'Clifford Stein',
          ],
          image: 'assets/images/clrs.jpeg',
          slug: 'introduction-to-algorithms-4rd-edition',
        ),
      ],
      requisiteFor: [
        {
          'title': 'طراحی الگوریتم',
          'unit': 3,
          'type': 'تخصصی',
        },
      ],
      requisites: {
        {
          'title': 'طراحی الگوریتم 2',
          'unit': 3,
          'type': 'تخصصی',
        }: RequisiteType.co,
        {
          'title': 'طراحی الگوریتم 3',
          'unit': 3,
          'type': 'تخصصی',
        }: RequisiteType.pre,
      },
      records: [
        {
          'semester': 'نیم‌سال اول ۱۴۰۰',
          'teacher': 'دکتر کشت‌کاران',
          'files': [
            'جلسه ۱',
            'جلسه ۲',
            'جلسه ۳',
          ]
        },
      ],
      resources: [
        {
          'semester': 'نیم‌سال اول ۱۴۰۰',
          'teacher': 'دکتر کشت‌کاران',
          'tas': null,
          'files': [
            'میانترم اول',
            'میانترم دوم',
            'پایانترم',
            'میانترم اول',
            'میانترم دوم',
            'پایانترم',
            'میانترم اول',
            'میانترم دوم',
            'پایانترم',
            'میانترم اول',
            'میانترم دوم',
            'پایانترم',
            'میانترم اول',
            'میانترم دوم',
            'پایانترم',
            'میانترم اول',
            'میانترم دوم',
            'پایانترم',
            'میانترم اول',
            'میانترم دوم',
            'پایانترم',
          ]
        },
        {
          'semester': 'نیم‌سال دوم ۱۴۰۰',
          'teacher': 'دکتر کشت‌کاران',
          'tas': [
            'رضا فرجام',
            'محمد علی کلی',
          ],
          'files': [
            'میانترم اول',
            'میانترم دوم',
            'پایانترم',
          ],
        },
      ],
    );

    change(result, status: RxStatus.success());
  }
}
