class TodoItem < ApplicationRecord
  belongs_to :todo_list

  # Funcao responsavel por validar se o campo complet_at possui algum conteudo
  def completed? 
    !completed_at.blank?
  end
  
end
