module Web::Controllers::Todos
  class Destroy
    include Web::Action

    params do
      required(:todo).schema do
        required(:id).filled(:str?)
      end
    end

    def call(params)
      user = UserRepository.new.last

      todo_id = params[:todo][:id]
      TodoRepository.new.users_todos(user.id, todo_id).delete

      redirect_to routes.root_path
    end
  end
end
