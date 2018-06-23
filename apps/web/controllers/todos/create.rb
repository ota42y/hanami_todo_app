module Web::Controllers::Todos
  class Create
    include Web::Action

    def call(params)
      user = UserRepository.new.last

      TodoRepository.new.create(params[:todo].merge(user_id: user.id))

      redirect_to '/'
    end
  end
end
