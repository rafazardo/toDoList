class TodoItemsController < ApplicationController
    before_action :set_todo_list
    before_action :set_todo_item, except: [:create]

    # Função responsavel de criar um item na lista
    def create 
        @todo_item = @todo_list.todo_items.create(todo_items_params)
        redirect_to @todo_list
    end

    # Função responsavel de deletar o item de sua respectiva lista
    def show 
        if @todo_item.destroy 
            flash[:sucess] = "O item foi deletado da lista!"
        else 
            flash[:error] = "Erro! O item não foi deletado da lista"
        end
        redirect_to @todo_list
    end

    # Função responsavel preencher o campo complet_at com a data de quando esta completo
    def complete 
        @todo_item.update_attribute(:completed_at, Time.now)
        redirect_to @todo_list, notice: "Item completado!"
    end

    private 

    def set_todo_list
        @todo_list = TodoList.find(params[:todo_list_id])
    end

    def set_todo_item
        @todo_item = @todo_list.todo_items.find(params[:id])
    end

    def todo_items_params
        params[:todo_item].permit(:conteudo)
    end
    
end
