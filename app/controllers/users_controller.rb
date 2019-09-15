class UsersController < ApplicationController
  def index
    # Создаём массив из двух болванок пользователей. Вызываем метод # User.new, который создает модель, не записывая её в базу.
    # У каждого юзера мы прописали id, чтобы сымитировать реальную
    # ситуацию – иначе не будет работать хелпер путей
    @users = [
      User.new(
        id: 1,
        name: 'Anon',
        username: 'deleted',
        avatar_url: 'https://vk.com/images/deactivated_100.png?ava=1'
      ),
      User.new(
        id: 2,
        name: 'Deanon',
        username: 'undeleted'
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Anon',
      username: 'deleted',
      avatar_url: 'https://vk.com/images/deactivated_100.png?ava=1'
      # avatar_url: ''
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('15.09.2019')),
      Question.new(text: 'В чём сила, брат?', created_at: Date.parse('15.09.2019'))
    ]

    @new_question = Question.new
  end
end
