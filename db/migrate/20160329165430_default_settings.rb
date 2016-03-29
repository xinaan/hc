class DefaultSettings < ActiveRecord::Migration
  def up
    setting = Setting.create(
        title: 'HC | Courses',
        jheader: 'Want to Study?',
        jtext: 'The future is in your hands. Let us help you in achieving your goals. Its time to decide!',
        intro: '<p>Hithadhoo Campus was founded in January 2004 by merging The Regional Vocational Training Centre-Hithadhoo (a regional training facility of Faculty of Engineering Technology, MNU) and The Regional In-service Centre-Hithadhoo (a facility of Faculty of Education, MNU).</p> <p>Located on the island of Hithadhoo in Addu Atoll, the campus provides training facilities for all the faculties and Centres of the Maldives National University.</p> <p>At present we have 30 ongoing courses from the following faculties being conducted at Hithadhoo Campus.</p>',
        lbook: 'http://www.mnu.edu.mv/images/course_books/Course%20info%20booklet%202015%20Term%202.pdf',
        lform: 'http://mnu.edu.mv/images/students/forms/Application_Form_Revised%2015-4-2014.pdf')
  end

  def down
    setting = Setting.find_by_title( 'HC | Courses' )
    setting.destroy
  end
end
