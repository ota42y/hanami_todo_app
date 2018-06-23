class TodoRepository < Hanami::Repository
  def users_todos(user_id, todo_id)
    todos.where(id: todo_id).where(user_id: user_id)
  end
end
