class Admin::StaffController < ApplicationController
  layout 'admin'

  def new
    @staff = Staff.new
  end

  def create
    type = params[:staff].delete(:type).downcase.to_sym
    cls = case type.downcase.to_sym
          when :author then Author
          else nil
          end

    if cls.nil?
      @staff = Staff.new(params[:staff])
      @staff.errors.add(:type, "must be selected")
      render 'new'
    end
  end

  def update

  end
end
