# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def print_msg(model, msg)
  puts "-> #{model}: #{msg} (#{model.count})"
end

def data_was_created(model)
  print_msg(model, 'Данные созданы')
end

def data_was_clear(model)
  print_msg(model, 'Данные очищены')
end

def table_empty(model)
  print_msg(model, 'Таблица пуста')
end

def id(model, params)
  model.where(params).pluck(:id).first
end

models = [Role, User, Category, Test, TestPassage, Question, Answer, Setting]
models.each do |model|
  if model.count > 0
    data_was_clear(model) if model.destroy_all
  else
    table_empty(model)
  end
end
puts

Setting.create!([
  {
    name: 'Макс. кол-во ответов на вопрос',
    setting: 'max_answers',
    value: '4'
  },
  {
    name: 'Мин. кол-во ответов на вопрос',
    setting: 'min_answers',
    value: '1'
  }
])
data_was_created(Setting)

Role.create!([
{
  name: 'Администратор',
},
{
  name: 'Пользователь'
}  
])
data_was_created(Role)

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
},
{
  first_name: 'Aleksandr',
  last_name: 'Titiov',
  email: 'aleksandr.titov@mail.org',
  password_digest: 'admin'
}
])
data_was_created(User)

RoleUser.create!([
  {
    user_id: id(User, { email: 'svetlana.ivanova@mail.org' }),
    role_id: id(Role, { name: 'Пользователь' })
  },
  {
    user_id: id(User, { email: 'alexey.mekhonoshin@mail.org' }),
    role_id: id(Role, { name: 'Пользователь' })
  },
  {
    user_id: id(User, { email: 'aleksandr.titov@mail.org' }),
    role_id: id(Role, { name: 'Администратор' })
  },
])
data_was_created(RoleUser)

Category.create!([
  { title: 'Основы веб-разработки' },
  { title: 'Биология' },
  { title: 'Ruby' }
])
data_was_created(Category)


Test.create!([
  {
    title: 'Основы CSS',
    level: 0,
    category_id: id(Category, { title: 'Основы веб-разработки' }),
  },
  {
    title: 'Основы HTML',
    level: 0,
    category_id: id(Category, { title: 'Основы веб-разработки' }),
  },
  {
    title: 'Флора для самых маленьких',
    level: 0,
    category_id: id(Category, { title: 'Биология' }),
  },
  {
    title: 'Фауна для самых маленьких',
    level: 0,
    category_id: id(Category, { title: 'Биология' }),
  },
  {
    title: 'Фауна Байкала',
    level: 3,
    category_id: id(Category, { title: 'Биология' }),
  },
  {
    title: 'Модели и ассоциации в Ruby on Rails',
    level: 2,
    category_id: id(Category, { title: 'Ruby' }),
  },
  {
    title: 'Контроллеры в Ruby on Rails',
    level: 1,
    category_id: id(Category, { title: 'Ruby' }),
  },
])
data_was_created(Test)

TestAuthor.create!([
  {
    user_id: id(User, { email: 'aleksandr.titov@mail.org' }),
    test_id: id(Test, { title: 'Фауна Байкала' })
  },
  {
    user_id: id(User, { email: 'aleksandr.titov@mail.org' }),
    test_id: id(Test, { title: 'Фауна для самых маленьких' })
  },
  {
    user_id: id(User, { email: 'aleksandr.titov@mail.org' }),
    test_id: id(Test, { title: 'Флора для самых маленьких' })
  },
  {
    user_id: id(User, { email: 'aleksandr.titov@mail.org' }),
    test_id: id(Test, { title: 'Основы HTML' })
  },
  {
    user_id: id(User, { email: 'aleksandr.titov@mail.org' }),
    test_id: id(Test, { title: 'Основы CSS' })
  },
  {
    user_id: id(User, { email: 'aleksandr.titov@mail.org' }),
    test_id: id(Test, { title: 'Контроллеры в Ruby on Rails' })
  },
  {
    user_id: id(User, { email: 'aleksandr.titov@mail.org' }),
    test_id: id(Test, { title: 'Модели и ассоциации в Ruby on Rails' })
  },
])
data_was_created(TestAuthor)

Question.create!([
  # Вопросы для "Основы CSS"
  {
    body: 'Задайте цвет тексту: <span>Я - Текст</span>',
    level: 1,
    test_id: id(Test, { title: 'Основы CSS' })
  },
  {
    body: 'Отцентруйте текст по вертикали: <table><td>Текст1</td><td>Текст<br>2</td></table>',
    level: 2,
    test_id: id(Test, { title: 'Основы CSS' })
  },
  {
    body: 'В чём разница между class и id?',
    level: 1,
    test_id: id(Test, { title: 'Основы CSS' })
  },
  # Вопросы для "Основы HTML"
  {
    body: 'Создайте POST-форму для ввода пароля и эл.почты.',
    level: 2,
    test_id: id(Test, { title: 'Основы HTML' })
  },
  {
    body: 'Что означают теги HTML, HEAD, BODY?',
    level: 1,
    test_id: id(Test, { title: 'Основы HTML' })
  },
  {
    body: 'Зачем нужен тег <q>?',
    level: 1,
    test_id: id(Test, { title: 'Основы HTML' })
  },
  # Вопросы для "Флора для самых маленьких"
  {
    body: 'Что изучает флора?',
    level: 1,
    test_id: id(Test, { title: 'Флора для самых маленьких' })
  },
  # Вопросы для "Фауна для самых маленьких"
  {
    body: 'Выберите предcтавителя фауны: гвоздика, собака',
    level: 1,
    test_id: id(Test, { title: 'Флора для самых маленьких' })
  },
  # Вопросы для "Фауна Байкала"
  {
    body: 'Кто не является представителем подводного мира оз.Байкал: нерпа, нарвал, осётр',
    level: 1,
    test_id: id(Test, { title: 'Фауна Байкала' })
  },
  {
    body: 'Перечислите минимум три вида птиц, живущих территории Байкала',
    level: 1,
    test_id: id(Test, { title: 'Фауна Байкала' })
  },
  # Вопросы для "Модели и ассоциации в Ruby on Rails"
  {
    body: 'Опишите разницу между ассоциациями has_many и has_one',
    level: 1,
    test_id: id(Test, { title: 'Модели и ассоциации в Ruby on Rails' })
  },
  {
    body: 'Составьте классы для сущностей: user, book. Отношение между сущностями - многие-ко-многим.',
    level: 2,
    test_id: id(Test, { title: 'Модели и ассоциации в Ruby on Rails' })
  },
  # Вопросы для "Контроллеры в Ruby on Rails"
  {
    body: 'Опишите соглашение об именовании контроллеров',
    level: 1,
    test_id: id(Test, { title: 'Контроллеры в Ruby on Rails' })
  },
  {
    body: 'Зачем нужны strong-параметры?',
    level: 1,
    test_id: id(Test, { title: 'Контроллеры в Ruby on Rails' })
  }
])
data_was_created(Question)

Answer.create!([
  {
    body: 'Соглашение по именованию контроллеров в Rails устанавливает предпочтение множественного числа в последнем слове имени контроллера, хотя строго это не требуется (например, ApplicationController). К примеру, ClientsController более предпочтителен, чем ClientController, SiteAdminsController более предпочтителен, чем SiteAdminController или SitesAdminsController, и так далее.',
    question_id: id(Question, { body: 'Опишите соглашение об именовании контроллеров' }),
    correct: true,
  },
  {
    body: 'С помощью сильных параметров (strong parameters) параметры Action Controller запрещены к использованию в массовых назначениях Active Model до тех пор, пока они не добавлены в белый список. Это лучший способ предотвратить случайную уязвимость, позволяющую пользователям обновлять конфиденциальные атрибуты модели. Кроме того, параметры могут быть помечены как обязательные и будут проходить через предопределенные raise/rescue, что приведет к 400 Bad Request, если не будут переданы все обязательные параметры.',
    question_id: id(Question, { body: 'Зачем нужны strong-параметры?' }),
    correct: true
  },
  {
    body: 'нарвал',
    question_id: id(Question, { body: 'Кто не является представителем подводного мира оз.Байкал: нерпа, нарвал, осётр' }),
    correct: true,
  },
  {
    body: 'span { colortext: red }',
    question_id: id(Question, { body: 'Задайте цвет тексту: <span>Я - Текст</span>' }),
    correct: false,
  }
])
data_was_created(Answer)

TestPassage.create!([
  {
    user_id: id(User, { email: 'alexey.mekhonoshin@mail.org' }),
    test_id: id(Test, { title: 'Модели и ассоциации в Ruby on Rails' }),
  },
  {
    user_id: id(User, { email: 'alexey.mekhonoshin@mail.org' }),
    test_id: id(Test, { title: 'Контроллеры в Ruby on Rails' }),
  },
  {
    user_id: id(User, { email: 'svetlana.ivanova@mail.org' }),
    test_id: id(Test, { title: 'Основы CSS' }),
  },
  {
    user_id: id(User, { email: 'svetlana.ivanova@mail.org' }),
    test_id: id(Test, { title: 'Основы HTML' }),
  },
])
data_was_created(TestPassage)



puts "\nТестовые данные созданы"
