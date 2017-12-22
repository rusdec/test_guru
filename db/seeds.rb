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

def data_was_clear(model)
  puts "Данные очищены: #{model} (#{model.count})"
end

def id(model, params)
  model.where(params).pluck(:id).first
end

models = [User, Category, Test, TestUser, Question, Answer]
models.each { |model| data_was_clear(model) if model.destroy_all }

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
    category_id: id(Category, { title: 'Основы веб-разработки' })
  },
  {
    #id: 2
    title: 'Основы HTML',
    level: 0,
    category_id: id(Category, { title: 'Основы веб-разработки' })
  },
  {
    #id: 3
    title: 'Флора для самых маленьких',
    level: 0,
    category_id: id(Category, { title: 'Биология' })
  },
  {
    #id: 4
    title: 'Фауна для самых маленьких',
    level: 0,
    category_id: id(Category, { title: 'Биология' })
  },
  {
    #id: 5
    title: 'Фауна Байкала',
    level: 3,
    category_id: id(Category, { title: 'Биология' })
  },
  {
    #id: 6
    title: 'Модели и ассоциации в Ruby on Rails',
    level: 2,
    category_id: id(Category, { title: 'Биология' })
  },
  {
    #id: 7
    title: 'Контроллеры в Ruby on Rails',
    level: 1,
    category_id: id(Category, { title: 'Биология' })
  },
]);
data_was_created(Test)

TestUser.create!([
  {
    user_id: id(User, { email: 'alexey.mekhonoshin@mail.org' }),
    test_id: id(Test, { title: 'Модели и ассоциации в Ruby on Rails' })
  },
  {
    user_id: id(User, { email: 'alexey.mekhonoshin@mail.org' }),
    test_id: id(Test, { title: 'Контроллеры в Ruby on Rails' })
  },
  {
    user_id: id(User, { email: 'svetlana.ivanova@mail.org' }),
    test_id: id(Test, { title: 'Основы CSS' })
  },
  {
    user_id: id(User, { email: 'svetlana.ivanova@mail.org' }),
    test_id: id(Test, { title: 'Основы HTML' })
  },
])
data_was_created(TestUser)

Question.create!([
  # Вопросы для "Основы CSS"
  {
    #id: 1
    body: 'Задайте цвет тексту: <span>Я - Текст</span>',
    level: 1,
    test_id: id(Test, { title: 'Основы CSS' })
  },
  {
    #id: 2
    body: 'Отцентруйте текст по вертикали: <table><td>Текст1</td><td>Текст<br>2</td></table>',
    level: 2,
    test_id: id(Test, { title: 'Основы CSS' })
  },
  {
    #id: 3
    body: 'В чём разница между class и id?',
    level: 1,
    test_id: id(Test, { title: 'Основы CSS' })
  },
  # Вопросы для "Основы HTML"
  {
    #id: 4
    body: 'Создайте POST-форму для ввода пароля и эл.почты.',
    level: 2,
    test_id: id(Test, { title: 'Основы HTML' })
  },
  {
    #id: 5
    body: 'Что означают теги HTML, HEAD, BODY?',
    level: 1,
    test_id: id(Test, { title: 'Основы HTML' })
  },
  {
    #id: 6
    body: 'Зачем нужен тег <q>?',
    level: 1,
    test_id: id(Test, { title: 'Основы HTML' })
  },
  # Вопросы для "Флора для самых маленьких"
  {
    #id: 7
    body: 'Что изучает флора?',
    level: 1,
    test_id: id(Test, { title: 'Флора для самых маленьких' })
  },
  # Вопросы для "Фауна для самых маленьких"
  {
    #id: 8
    body: 'Выберите предcтавителя фауны: гвоздика, собака',
    level: 1,
    test_id: id(Test, { title: 'Флора для самых маленьких' })
  },
  # Вопросы для "Фауна Байкала"
  {
    #id: 9
    body: 'Кто не является представителем подводного мира оз.Байкал: нерпа, нарвал, осётр',
    level: 1,
    test_id: id(Test, { title: 'Фауна Байкала' })
  },
  {
    #id: 10
    body: 'Перечислите минимум три вида птиц, живущих территории Байкала',
    level: 1,
    test_id: id(Test, { title: 'Фауна Байкала' })
  },
  # Вопросы для "Модели и ассоциации в Ruby on Rails"
  {
    #id: 11
    body: 'Опишите разницу между ассоциациями has_many и has_one',
    level: 1,
    test_id: id(Test, { title: 'Модели и ассоциации в Ruby on Rails' })
  },
  {
    #id: 12
    body: 'Составьте классы для сущностей: user, book. Отношение между сущностями - многие-ко-многим.',
    level: 2,
    test_id: id(Test, { title: 'Модели и ассоциации в Ruby on Rails' })
  },
  # Вопросы для "Контроллеры в Ruby on Rails"
  {
    #id: 13
    body: 'Опишите соглашение об именовании контроллеров',
    level: 1,
    test_id: id(Test, { title: 'Контроллеры в Ruby on Rails' })
  },
  {
    #id: 14
    body: 'Зачем нужны strong-параметры?',
    level: 1,
    test_id: id(Test, { title: 'Контроллеры в Ruby on Rails' })
  }
])
data_was_created(Question)

Answer.create!([
  {
    body: 'Соглашение по именованию контроллеров в Rails устанавливает предпочтение множественного числа в последнем слове имени контроллера, хотя строго это не требуется (например, ApplicationController). К примеру, ClientsController более предпочтителен, чем ClientController, SiteAdminsController более предпочтителен, чем SiteAdminController или SitesAdminsController, и так далее.',
    user_id: id(User, { email: 'alexey.mekhonoshin@mail.org' }),
    question_id: id(Question, { body: 'Опишите соглашение об именовании контроллеров' }),
    correct: true
  },
  {
    body: 'С помощью сильных параметров (strong parameters) параметры Action Controller запрещены к использованию в массовых назначениях Active Model до тех пор, пока они не добавлены в белый список. Это лучший способ предотвратить случайную уязвимость, позволяющую пользователям обновлять конфиденциальные атрибуты модели. Кроме того, параметры могут быть помечены как обязательные и будут проходить через предопределенные raise/rescue, что приведет к 400 Bad Request, если не будут переданы все обязательные параметры.',
    user_id: id(User, { email: 'alexey.mekhonoshin@mail.org' }),
    question_id: id(Question, { body: 'Зачем нужны strong-параметры?' }),
    correct: true
  },
  {
    body: 'нарвал',
    user_id: id(User, { email: 'svetlana.ivanova@mail.org' }),
    question_id: id(Question, { body: 'Кто не является представителем подводного мира оз.Байкал: нерпа, нарвал, осётр' }),
    correct: true,
  },
  {
    body: 'span { colortext: red }',
    user_id: id(User, { email: 'svetlana.ivanova@mail.org' }),
    question_id: id(Question, { body: 'Задайте цвет тексту: <span>Я - Текст</span>' }),
    correct: false,
  }
])
data_was_created(Answer)

puts "Тестовые данные созданы"
