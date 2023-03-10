class TodoList < ApplicationRecord
    has_many :todo_items, :dependent => :destroy #Garante que items sejam deletados, independente do delete on cascade no BD
end
