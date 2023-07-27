import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/models/teacher.dart';
import 'package:get/get.dart';

class TeacherController extends GetxController with StateMixin<TeacherModel> {
  final int teacherId;

  TeacherController({required this.teacherId});

  @override
  void onInit() {
    super.onInit();

    fetchData();
  }

  Future<void> fetchData() async {
    var result = TeacherModel(
      id: 1,
      emails: [
        'ziarati@shirazu.ac.ir',
      ],
      image: 'assets/images/clrs.jpeg',
      slug: 'introduction-to-algorithms-4rd-edition',
      courses: [
        CourseModel(
          id: 1,
          name: 'طراحی الگوریتم',
          type: CourseType.specialized,
          units: 3,
          slug: 'temp',
        ),
      ],
      department: 'مهندسی کامپیوتر',
      description:
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.',
      honorific: 'دکتر',
      firstName: 'کوروش',
      lastName: 'زیارتی',
      relatedLinks: [
        'https://google.com',
        'https://hggcxgfxfyoutube.com',
      ],
    );

    change(result, status: RxStatus.success());
  }
}
