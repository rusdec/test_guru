# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def admin_email
  'test.guru.contact@gmail.com'
end

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
    name: 'max_answers',
    setting: 'max_answers',
    value: '4'
  },
  {
    name: 'min_answers',
    setting: 'min_answers',
    value: '0'
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

Admin.create!([
{
  first_name: 'Алексей',
  last_name: 'Мехоношин',
  email: admin_email,
  email_contactable: true,
  password: 'qwerty'
}
])
data_was_created(Admin)

RoleUser.create!([
  {
    user_id: id(User, { email: admin_email }),
    role_id: id(Role, { name: 'Администратор' })
  },
])
data_was_created(RoleUser)

Category.create!([
  { title: 'Основы веб-разработки' },
  { title: 'Биология' },
  { title: 'Ruby' },
])
data_was_created(Category)


Test.create!([
  { title: 'Основы HTML',
    level: 0,
    category_id: id(Category, { title: 'Основы веб-разработки' }),
  },
  {
    title: 'Флора для самых маленьких',
    level: 0,
    category_id: id(Category, { title: 'Биология' }),
  },
  {
    title: 'Массивы и хеши',
    level: 1,
    category_id: id(Category, { title: 'Ruby' }),
  },
  {
    title: 'Строки',
    level: 0,
    category_id: id(Category, { title: 'Ruby' }),
  }
])
data_was_created(Test)

TestAuthor.create!([
  {
    user_id: id(User, { email: admin_email }),
    test_id: id(Test, { title: 'Флора для самых маленьких' })
  },
  {
    user_id: id(User, { email: admin_email }),
    test_id: id(Test, { title: 'Основы HTML' })
  },
  {
    user_id: id(User, { email: admin_email }),
    test_id: id(Test, { title: 'Массивы и хеши' })
  },
  {
    user_id: id(User, { email: admin_email }),
    test_id: id(Test, { title: 'Строки' })
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
  # Вопросы для "Массивы и хеши"
  {
    body: 'Выберите правильные способы добавить элемент в конец массива',
    level: 0,
    test_id: id(Test, { title: 'Массивы и хеши' })
  },
  {
    body: 'Выберите неправильно заданные хеши',
    level: 0,
    sort: 1,
    test_id: id(Test, { title: 'Массивы и хеши' })
  },
  {
    body: 'Выберите результат операции [1,2] + { b: 1, a: 2 }.to_a',
    level: 0,
    sort: 2,
    test_id: id(Test, { title: 'Массивы и хеши' })
  },
  # Вопросы для "Строки"
  {
    body: 'Выберите правильные способы узнать длину строки: str = "abc"',
    level: 0,
    sort: 0,
    test_id: id(Test, { title: 'Строки' })
  },
  {
    body: 'Что выведет следующий код: puts \'abc\tdef\'',
    level: 0,
    sort: 1,
    test_id: id(Test, { title: 'Строки' })
  },
])
data_was_created(Question)

Answer.create!([
  {
    body: 'String::size(str)',
    sort: 0,
    question_id: id(Question, { body: 'Выберите правильные способы узнать длину строки: str = "abc"' }),
    correct: false
  },
  {
    body: 'str.length',
    sort: 1,
    question_id: id(Question, { body: 'Выберите правильные способы узнать длину строки: str = "abc"' }),
    correct: true
  },
  {
    body: 'str.count',
    sort: 2,
    question_id: id(Question, { body: 'Выберите правильные способы узнать длину строки: str = "abc"' }),
    correct: false
  },
  {
    body: 'abc   def',
    sort: 0,
    question_id: id(Question, { body: 'Что выведет следующий код: puts \'abc\tdef\'' }),
    correct: false
  },
  {
    body: 'abcTdef',
    sort: 1,
    question_id: id(Question, { body: 'Что выведет следующий код: puts \'abc\tdef\'' }),
    correct: true
  },
  {
    body: 'abc\tdef',
    sort: 2,
    question_id: id(Question, { body: 'Что выведет следующий код: puts \'abc\tdef\'' }),
    correct: true
  },
  {
    body: 'array.push(x)',
    sort: 0,
    question_id: id(Question, { body: 'Выберите правильные способы добавить элемент в конец массива' }),
    correct: true
  },
  {
    body: 'array.add(x)',
    sort: 1,
    question_id: id(Question, { body: 'Выберите правильные способы добавить элемент в конец массива' }),
    correct: false
  },
  {
    body: 'array + x',
    sort: 2,
    question_id: id(Question, { body: 'Выберите правильные способы добавить элемент в конец массива' }),
    correct: false
  },
  {
    body: 'array << x',
    sort: 3,
    question_id: id(Question, { body: 'Выберите правильные способы добавить элемент в конец массива' }),
    correct: true
  },
  {
    body: '{ a: 1, b: 2 }',
    sort: 0,
    question_id: id(Question, { body: 'Выберите неправильно заданные хеши' }),
    correct: false
  },
  {
    body: '[ a: 1, b: 2 ]',
    sort: 1,
    question_id: id(Question, { body: 'Выберите неправильно заданные хеши' }),
    correct: true
  },
  {
    body: '{ :a => 1, :b => 2 }',
    sort: 2,
    question_id: id(Question, { body: 'Выберите неправильно заданные хеши' }),
    correct: false
  },
  {
    body: '[1, 2, [:b, 1], [:a, 2]]',
    sort: 0,
    question_id: id(Question, { body: 'Выберите результат операции [1,2] + { b: 1, a: 2 }.to_a' }),
    correct: true
  },
  {
    body: '[1, 2, [:b, 1, :a, 2]]',
    sort: 1,
    question_id: id(Question, { body: 'Выберите результат операции [1,2] + { b: 1, a: 2 }.to_a' }),
    correct: false
  },
  {
    body: '[1, 2, :b, 1, :a, 2]',
    sort: 2,
    question_id: id(Question, { body: 'Выберите результат операции [1,2] + { b: 1, a: 2 }.to_a' }),
    correct: false
  },
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
