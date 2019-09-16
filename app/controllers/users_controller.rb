class UsersController < ApplicationController

  # Загружаем юзера из базы для экшенов кроме :index, :create, :new

  before_action :load_user, except: [:index, :create, :new]

  # Проверяем имеет ли юзер доступ к экшену, делаем это для всех действий, кроме
  # :index, :new, :create, :show — к этим действиям есть доступ у всех, даже у
  # тех, у кого вообще нет аккаунта на нашем сайте.
  #
  # before_action :authorize_user, except: [:index, :new, :create, :show]

  # def index
  #   # Создаём массив из двух болванок пользователей. Вызываем метод # User.new, который создает модель, не записывая её в базу.
  #   # У каждого юзера мы прописали id, чтобы сымитировать реальную
  #   # ситуацию – иначе не будет работать хелпер путей
  #   @users = [
  #     User.new(
  #       id: 1,
  #       name: 'Anon',
  #       username: 'deleted',
  #       avatar_url: 'https://vk.com/images/deactivated_100.png?ava=1'
  #     ),
  #
  #     User.new(
  #       id: 2,
  #       name: 'Deanon',
  #       username: 'undeleted'
  #     )
  #   ]
  # end

  def index
    # запишем в неё всех пользователей
    @users = User.all
  end

  # Действие new будет отзываться по адресу /users/new
  def new
    # Пока создадим новый экземпляр модели
    @user = User.new
  end

  def create
    # Если пользователь уже авторизован, ему не нужна новая учетная запись,
    # отправляем его на главную с сообщением.




    # redirect_to root_url, alert: 'Вы уже залогинены' if current_user.present?





    # Иначе, создаем нового пользователя с параметрами, которые нам предоставит
    # метод user_params.
    @user = User.new(user_params)

    # Пытаемся сохранить пользователя.
    if @user.save
      # Если удалось, отправляем пользователя на главную с сообщение, что
      # пользователь создан.
      redirect_to root_url, notice: 'Пользователь успешно зарегистрирован!'
    else
      # Если не удалось по какой-то причине сохранить пользователя, то рисуем
      # (обратите внимание, это не редирект), страницу new с формой
      # пользователя, который у нас лежит в переменной @user. В этом объекте
      # содержатся ошибки валидации, которые выведет шаблон формы.
      render 'new'
    end
  end

  def edit
    # @user = User.find params[:id]
  end

  # def show
    # @user = User.new(
    #   name: 'Anon',
    #   username: 'deleted',
    #   avatar_url: 'https://vk.com/images/deactivated_100.png?ava=1'
    # )
    #
    # @questions = [
    #   Question.new(text: 'Как дела?', created_at: Date.parse('13.09.2019')),
    #   Question.new(text: 'В чём сила, брат?', created_at: Date.parse('14.09.2019')),
    #   Question.new(text: 'Куришь?', created_at: Date.parse('15.09.2019')),
    #   Question.new(text: 'Спишь?', created_at: Date.parse('15.09.2019')),
    #   Question.new(text: 'Ешь?', created_at: Date.parse('15.09.2019'))
    # ]
    #
    # @new_question = Question.new
  # end

  def update
    # @user = User.find params[:id]

    # Аналогично create, мы получаем параметры нового (обновленного)
    # пользователя с помощью метода user_params, и пытаемся обновить @user с
    # этими значениями.
    if @user.update(user_params)
      # Если получилось, отправялем пользователя на его страницу с сообщением,
      # что пользователь успешно обновлен.
      redirect_to user_path(@user), notice: 'Данные обновлены'
    else
      # Если не получилось, как и в create рисуем страницу редактирования
      # пользователя, на которой нам будет доступен объект @user, содержащий
      # информацию об ошибках валидации, которые отобразит форма.
      render 'edit'
    end
  end

  def show
    # @user = User.find params[:id]


    # Достаем вопросы пользователя с помощью метода questions, который мы
    # объявили в модели User (has_many :questions), у результата возврата этого
    # метода вызываем метод order, который отсортирует вопросы по дате.
    @questions = @user.questions.order(created_at: :desc)

    # Для формы нового вопроса, которая есть у нас на странице пользователя,
    # создаем болванку вопроса, вызывая метод build у результата вызова метода
    # @user.questions.
    @new_question = @user.questions.build
  end

  private

  # Загружаем из базы запрошенного юзера, находя его по params[:id].
  def load_user
    @user ||= User.find params[:id]
  end


  # Явно задаем список разрешенных параметров для модели User. Мы говорим, что
  # у хэша params должен быть ключ :user. Значением этого ключа может быть хэш с
  # ключами: :email, :password, :password_confirmation, :name, :username и
  # :avatar_url. Другие ключи будут отброшены.
  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation,
                                 :name,
                                 :username,
                                 :avatar_url
    )
  end
end
