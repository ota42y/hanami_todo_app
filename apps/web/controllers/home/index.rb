module Web::Controllers::Home
  class Index
    include Web::Action

    expose :todos

    def call(_params)
      @todos = TodoRepository.new.all
    end
  end
end
