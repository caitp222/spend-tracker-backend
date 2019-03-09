class CategoriesController < ApplicationController

  def create
    category = Category.new(category_params)
    category.user_id = params[:user_id]
    if category.save
      render json: { success_msg: "Category successfully created." }, status: 200
    else
      render json: "Category could not be created: #{category.errors.full_messages}", status: 400
    end
  end

  def update
    category = Category.find_by(id: params[:id], user_id: params[:user_id])
    if category.update_attributes(category_params)
      render json: { success_msg: "Category successfully updated." }, status: 200
    else
      render json: "Category could not be updated.", status: 400
    end
  end

  def delete
    category = Category.find_by(id: params[:id], user_id: params[:user_id])
    if category.destroy
      render json: { success_msg: "Category successfully deleted." }, status: 200
    else
      render json: "Category could not be deleted.", status: 400
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :color_hex, :category_type)
  end

end
