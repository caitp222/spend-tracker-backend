class MoneyRecordsController < ApplicationController

  def index
  end

  def create
    user = User.find_by(id: params[:user_id])
    category = Category.find_by(name: money_records_params[:category])
    date = money_records_params[:date].to_date

    creation_params = {
      date: date,
      user: user,
      category: category,
      amount: money_records_params[:amount],
      description: money_records_params[:description],
      record_type: money_records_params[:record_type],
    }
    money_record = MoneyRecord.new(creation_params)

    if money_record.save
      render json: { success_msg: "Record successfully created." }, status: 200
    else
      render json: "Record could not be created.", status: 400
    end
  end

  def update
  end

  def show
  end

  def delete
    money_record = MoneyRecord.find_by(id: params[:id], user_id: params[:user_id])
    if money_record.destroy
      render json: { success_msg: "Record successfully deleted." }, status: 200
    else
      render json: "Record could not be deleted.", status: 400
    end
  end

  private
  def money_records_params
    params.require(:money_record).permit(:date, :category, :amount, :description, :record_type)
  end

end
