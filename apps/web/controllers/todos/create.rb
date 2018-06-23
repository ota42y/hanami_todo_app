module Web::Controllers::Todos
  class Create
    include Web::Action

    params do
      required(:todo).schema do
        required(:title).filled(:str?)
      end
    end

    def call(params)
      unless params.valid?
        self.status = 422
        return
      end

      user = UserRepository.new.last

      TodoRepository.new.create(params[:todo].merge(user_id: user.id))

      redirect_to '/'
    end
  end
end
