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
  first_name: 'Aleksey',
  last_name: 'Mekhonoshin',
  email: 'aleksey.mekhonoshin@mail.org',
  type: 'Admin',
  password: 'qwerty'
}
])
data_was_created(User)

RoleUser.create!([
  {
    user_id: id(User, { email: 'aleksandr.titov@mail.org' }),
    role_id: id(Role, { name: 'Администратор' })
  },
])
data_was_created(RoleUser)

Category.create!([
  { title: 'Основы веб-разработки' },
  { title: 'Биология' },
])
data_was_created(Category)


Test.create!([
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
])
data_was_created(Test)

TestAuthor.create!([
  {
    user_id: id(User, { email: 'aleksandr.titov@mail.org' }),
    test_id: id(Test, { title: 'Флора для самых маленьких' })
  },
  {
    user_id: id(User, { email: 'aleksandr.titov@mail.org' }),
    test_id: id(Test, { title: 'Основы HTML' })
  },
])
data_was_created(TestAuthor)

Question.create!([
  # Вопросы для "Основы HTML"
  {
    body: 'Выберите правильный способ установки кодировки в html',
    level: 0,
    test_id: id(Test, { title: 'Основы HTML' })
  },
  {
    body: 'Выберите правильный способ подлючения css-стиля',
    level: 1,
    test_id: id(Test, { title: 'Основы HTML' })
  },
  {
    body: 'Выберите блочные теги',
    level: 1,
    test_id: id(Test, { title: 'Основы HTML' })
  },
  # Вопросы для "Флора для самых маленьких"
  {
    body: 'Что изучает флора?',
    level: 1,
    test_id: id(Test, { title: 'Флора для самых маленьких' })
  },
  {
    body: 'Выберите существующие методы анализы флоры из представленных',
    level: 1,
    test_id: id(Test, { title: 'Флора для самых маленьких' })
  },
  {
    body: 'Выберите верное название для флоры водорослей',
    level: 1,
    test_id: id(Test, { title: 'Флора для самых маленьких' })
  },
])
data_was_created(Question)

Answer.create!([
  {
    body: '<meta charset="utf-8">',
    sort: 0,
    question_id: id(Question, { body: 'Выберите правильный способ установки кодировки в html' }),
    correct: true
  },
  {
    body: '<charset "utf-8">',
    sort: 0,
    question_id: id(Question, { body: 'Выберите правильный способ установки кодировки в html' }),
    correct: false
  },
  {
    body: '<charset "utf-8"></charset>',
    sort: 0,
    question_id: id(Question, { body: 'Выберите правильный способ установки кодировки в html' }),
    correct: false
  },
  {
    body: '<html charset="utf-8">',
    sort: 0,
    question_id: id(Question, { body: 'Выберите правильный способ установки кодировки в html' }),
    correct: false
  },
  {
    body: '<css rel="stylesheet" href="style.css">',
    sort: 0,
    question_id: id(Question, { body: 'Выберите правильный способ подлючения css-стиля' }),
    correct: false
  },
  {
    body: '<css rel="stylesheet" src="style.css">',
    sort: 0,
    question_id: id(Question, { body: 'Выберите правильный способ подлючения css-стиля' }),
    correct: false
  },
  {
    body: '<link rel="stylesheet" type="text/css" href="style.css">',
    sort: 0,
    question_id: id(Question, { body: 'Выберите правильный способ подлючения css-стиля' }),
    correct: true
  },
  {
    body: '<style href="style.css">',
    sort: 0,
    question_id: id(Question, { body: 'Выберите правильный способ подлючения css-стиля' }),
    correct: false
  },
  {
    body: '<div></div>',
    sort: 0,
    question_id: id(Question, { body: 'Выберите блочные теги' }),
    correct: true
  },
  {
    body: '<span></span>',
    sort: 0,
    question_id: id(Question, { body: 'Выберите блочные теги' }),
    correct: false
  },
  {
    body: '<p></p>',
    sort: 0,
    question_id: id(Question, { body: 'Выберите блочные теги' }),
    correct: true
  },
  {
    body: '<a></a>',
    sort: 0,
    question_id: id(Question, { body: 'Выберите блочные теги' }),
    correct: false
  },
  {
    body: 'Человека',
    sort: 0,
    question_id: id(Question, { body: 'Что изучает флора?' }),
    correct: false
  },
  {
    body: 'Животных',
    sort: 0,
    question_id: id(Question, { body: 'Что изучает флора?' }),
    correct: false
  },
  {
    body: 'Насекомых',
    sort: 0,
    question_id: id(Question, { body: 'Что изучает флора?' }),
    correct: false
  },
  {
    body: 'Растения',
    sort: 0,
    question_id: id(Question, { body: 'Что изучает флора?' }),
    correct: true
  },
  {
    body: 'Географический анализ',
    sort: 0,
    question_id: id(Question, { body: 'Выберите существующие методы анализы флоры из представленных' }),
    correct: true
  },
  {
    body: 'Возрастной анализ',
    sort: 0,
    question_id: id(Question, { body: 'Выберите существующие методы анализы флоры из представленных' }),
    correct: true
  },
  {
    body: 'Цветовой анализ',
    sort: 0,
    question_id: id(Question, { body: 'Выберите существующие методы анализы флоры из представленных' }),
    correct: false
  },
  {
    body: 'Пробно порядковый анализ',
    sort: 0,
    question_id: id(Question, { body: 'Выберите существующие методы анализы флоры из представленных' }),
    correct: false
  },
  {
    body: 'Бриофлора',
    sort: 0,
    question_id: id(Question, { body: 'Выберите верное название для флоры водорослей' }),
    correct: false
  },
  {
    body: 'Альгофлора',
    sort: 1,
    question_id: id(Question, { body: 'Выберите верное название для флоры водорослей' }),
    correct: true
  },
  {
    body: 'Лихенофлора',
    sort: 2,
    question_id: id(Question, { body: 'Выберите верное название для флоры водорослей' }),
    correct: false
  },
  {
    body: 'Арборифлора',
    sort: 3,
    question_id: id(Question, { body: 'Выберите верное название для флоры водорослей' }),
    correct: false
  }
])
data_was_created(Answer)

puts "\nТестовые данные созданы"
