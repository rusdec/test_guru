# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def data_was_created(model)
  puts "Данные созданы: #{model} (#{model.count})"
end

User.create!([
{
  first_name: 'Alexey',
  last_name:  'Mekhonoshin',
  email: 'alexey.mekhonoshin@mail.org',
  password_digest: 'qwerty',
},
{
  first_name: 'Svetlana',
  last_name:  'Ivanova',
  email: 'svetlana.ivanova@mail.org',
  password_digest: 'svetkalove',
}
]);
data_was_created(User)

Category.create!([
  { title: 'Основы веб-разработки' },
  { title: 'Биология' },
  { title: 'Ruby' }
]);
data_was_created(Category)

Test.create!([
  {
    #id: 1
    title: 'Основы CSS',
    level: 0,
    category_id: 1
  },
  {
    #id: 2
    title: 'Основы HTML',
    level: 0,
    category_id: 1
  },
  {
    #id: 3
    title: 'Флора для самых маленьких',
    level: 0,
    category_id: 2
  },
  {
    #id: 4
    title: 'Фауна для самых маленьких',
    level: 0,
    category_id: 2
  },
  {
    #id: 5
    title: 'Фауна Байкала',
    level: 3,
    category_id: 2
  },
  {
    #id: 6
    title: 'Модели и ассоциации в Ruby on Rails',
    level: 2,
    category_id: 3
  },
  {
    #id: 7
    title: 'Контроллеры в Ruby on Rails',
    level: 1,
    category_id: 3
  },
]);
data_was_created(Test)

TestUser.create!([
  { user_id: 1, test_id: 6 },
  { user_id: 1, test_id: 7 },
  { user_id: 2, test_id: 1 },
  { user_id: 2, test_id: 2 },
])
data_was_created(TestUser)

Question.create!([
  # Вопросы для "Основы CSS"
  {
    #id: 1
    body: 'Задайте цвет тексту: <span>Я - Текст</span>',
    level: 1,
    test_id: 1
  },
  {
    #id: 2
    body: 'Отцентруйте текст по вертикали: <table><td>Текст1</td><td>Текст<br>2</td></table>',
    level: 2,
    test_id: 1
  },
  {
    #id: 3
    body: 'В чём разница между class и id?',
    level: 1,
    test_id: 1 
  },
  # Вопросы для "Основы HTML"
  {
    #id: 4
    body: 'Создайте POST-форму для ввода пароля и эл.почты.',
    level: 2,
    test_id: 2 
  },
  {
    #id: 5
    body: 'Что означают теги HTML, HEAD, BODY?',
    level: 1,
    test_id: 2
  },
  {
    #id: 6
    body: 'Зачем нужен тег <q>?',
    level: 1,
    test_id: 2
  },
  # Вопросы для "Флора для самых маленьких"
  {
    #id: 7
    body: 'Что изучает флора?',
    level: 1,
    test_id: 3
  },
  # Вопросы для "Фауна для самых маленьких"
  {
    #id: 8
    body: 'Выберите предcтавителя фауны: гвоздика, собака',
    level: 1,
    test_id: 4
  },
  # Вопросы для "Фауна Байкала"
  {
    #id: 9
    body: 'Кто не является представителем подводного мира оз.Байкал: нерпа, нарвал, осётр',
    level: 1,
    test_id: 5
  },
  {
    #id: 10
    body: 'Перечислите минимум три вида птиц, живущих территории Байкала',
    level: 1,
    test_id: 5
  },
  # Вопросы для "Модели и ассоциации в Ruby on Rails"
  {
    #id: 11
    body: 'Опишите разницу между ассоциациями has_many и has_one',
    level: 1,
    test_id: 6
  },
  {
    #id: 12
    body: 'Составьте классы для сущностей: user, book. Отношение между сущностями - многие-ко-многим.',
    level: 2,
    test_id: 6
  },
  # Вопросы для "Контроллеры в Ruby on Rails"
  {
    #id: 13
    body: 'Опишите соглашение об именовании контроллеров.',
    level: 1,
    test_id: 7
  },
  {
    #id: 14
    body: 'Зачем нужны strong-параметры?',
    level: 1,
    test_id: 7
  }
])
data_was_created(Question)

Answer.create!([
  {
    body: 'Соглашение по именованию контроллеров в Rails устанавливает предпочтение множественного числа в последнем слове имени контроллера, хотя строго это не требуется (например, ApplicationController). К примеру, ClientsController более предпочтителен, чем ClientController, SiteAdminsController более предпочтителен, чем SiteAdminController или SitesAdminsController, и так далее.',
    user_id: 1,
    question_id: 14,
    correct: true
  },
  {
    body: 'С помощью сильных параметров (strong parameters) параметры Action Controller запрещены к использованию в массовых назначениях Active Model до тех пор, пока они не добавлены в белый список. Это лучший способ предотвратить случайную уязвимость, позволяющую пользователям обновлять конфиденциальные атрибуты модели. Кроме того, параметры могут быть помечены как обязательные и будут проходить через предопределенные raise/rescue, что приведет к 400 Bad Request, если не будут переданы все обязательные параметры.',
    user_id: 1,
    question_id: 14,
    correct: true
  },
  {
    body: 'нарвал',
    user_id: 2,
    question_id: 9,
    correct: true,
  },
  {
    body: 'span { colortext: red }',
    user_id: 2,
    question_id: 1,
    correct: false,
  }
])
data_was_created(Answer)

puts "Тестовые данные созданы"
