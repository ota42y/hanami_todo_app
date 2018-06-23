module Web::Controllers::Todos
  class Destroy
    include Web::Action

    params do
      required(:id).filled(:str?)
    end

    def call(params)
      user = UserRepository.new.last

      todo_id = params[:id]
      TodoRepository.new.users_todos(user.id, todo_id).delete

      redirect_to routes.root_path
    end
  end
end
